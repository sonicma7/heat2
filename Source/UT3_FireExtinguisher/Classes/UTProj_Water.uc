/**
 * Copyright 1998-2008 Epic Games, Inc. All Rights Reserved.
 */
class UTProj_Water extends UTProjectile;

var class<UTDamageType>	ComboDamageType;
var class<UTDamageType> ComboTriggerType;
var ParticleSystem ComboTemplate;
var float ComboRadius;
var int   ComboDamage;
var float ComboMomentumTransfer;
var int ComboAmmoCost;
var SoundCue ComboExplosionSound;
var class<UTReplicatedEmitter> ComboExplosionEffect;

/** true if we have been combo'ed (so don't play normal explosion effects) */
var repnotify bool bComboed;

var Pawn ComboTarget;		// for AI use

replication
{
	if (Role == ROLE_Authority)
		bComboed;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bComboed')
	{
		bSuppressExplosionFX = true;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/** CreateProjectileLight() called from TickSpecial() once if Instigator is local player
always create shock light, even at low frame rates (since critical for timing combos)
*/
simulated event CreateProjectileLight()
{
	ProjectileLight = new(Outer) ProjectileLightClass;
	AttachComponent(ProjectileLight);
}

function ComboExplosion()
{
	//HurtRadius(ComboDamage, ComboRadius, ComboDamageType, ComboMomentumTransfer, Location );
	//Spawn(ComboExplosionEffect);
	PlaySound(ComboExplosionSound);

	bSuppressExplosionFX = true;
	bComboed = true;
	Shutdown();
}

simulated function ProcessTouch(Actor Other, vector HitLocation, vector HitNormal)
{
	local UTProj_ShockBall ShockProj;

	Super.ProcessTouch(Other, HitLocation, HitNormal);

	// when shock projectiles collide, make sure they both blow up
	ShockProj = UTProj_ShockBall(Other);
	if (ShockProj != None)
	{
		//ShockProj.Explode(HitLocation, -HitNormal);
	}
}

event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	if ( DamageType==ComboTriggerType )
	{
		InstigatorController = EventInstigator;
		Instigator = EventInstigator.Pawn;
		//ComboExplosion();
		if (EventInstigator.Pawn != None && EventInstigator.Pawn.Weapon != None)
		{
			EventInstigator.Pawn.Weapon.AddAmmo(-ComboAmmoCost);
		}
	}
	else
	{
		Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
	}
}

function Monitor(Pawn P)
{
	ComboTarget = P;
	if ( ComboTarget != None )
	{
		GotoState('WaitForCombo');
	}
}

state WaitForCombo
{
	function Tick(float DeltaTime)
	{
		local float Dist;
		local UTBot B;

		if ( (ComboTarget == None) || ComboTarget.bDeleteMe
			|| (Instigator == None) || (UTWeap_ShockRifle(Instigator.Weapon) == None) )
		{
			if (Instigator != None && UTWeap_ShockRifle(Instigator.Weapon) != None)
			{
				UTWeap_ShockRifle(Instigator.Weapon).ClearCombo();
			}
			GotoState('');
			return;
		}



		// if I'm close enough or have passed target, do combo
		Dist = VSize(ComboTarget.Location - Location);
		if ( Dist <= 0.5 * ComboRadius + ComboTarget.GetCollisionRadius()
			|| (Velocity Dot (ComboTarget.Location - Location)) <= 0.0 )
		{
			//UTWeap_ShockRifle(Instigator.Weapon).DoCombo();
			GotoState('');
			return;
		}
		else if (Dist <= ComboRadius + ComboTarget.GetCollisionRadius())
		{
			// if close to combo time, make bot look at me
			B = UTBot(Instigator.Controller);
			if (B != None)
			{
				B.TemporaryFocus = self;
			}
		}

		if ( PointDistToLine(ComboTarget.Location, Normal(Velocity), Location) > ComboRadius + FMax(ComboTarget.GroundSpeed,VSize(ComboTarget.Velocity)) )
		{
			UTWeap_ShockRifle(Instigator.Weapon).ClearCombo();
			GotoState('');
			return;
		}
	}

	event EndState(name NextStateName)
	{
		local UTBot B;

		if (Instigator != None)
		{
			B = UTBot(Instigator.Controller);
			if (B != None && B.TemporaryFocus == self)
			{
				B.TemporaryFocus = None;
			}
		}
	}
}

defaultproperties
{
	ProjFlightTemplate=ParticleSystem'Firefighter.Particles.Extinguisher_Frost'
	ProjExplosionTemplate=None
	Speed=0
	MaxSpeed=0
	MaxEffectDistance=25.0
	bCheckProjectileLight=true
	ProjectileLightClass=None

	Damage=55
	DamageRadius=120
	MomentumTransfer=0

	MyDamageType=class'UTDmgType_ShockBall'
	LifeSpan=2.0

	bCollideWorld=true
	bProjTarget=True

	ComboDamageType=None
	ComboTriggerType=None

	ComboDamage=215
	ComboRadius=275
	ComboMomentumTransfer=150000
	ComboTemplate=None
	ComboAmmoCost=3
	CheckRadius=40.0
	bCollideComplex=false

	Begin Object Name=CollisionCylinder
		CollisionRadius=16
		CollisionHeight=16
		AlwaysLoadOnClient=True
		AlwaysLoadOnServer=True
		BlockNonZeroExtent=true
		BlockZeroExtent=true
		BlockActors=true
		CollideActors=true
	End Object

	bNetTemporary=false
	AmbientSound=SoundCue'A_Weapon_FireExtinguisher.FireExtinguisher.A_Weapon_FE_TravelCue'
	ExplosionSound=None
	ComboExplosionSound=None
	ComboExplosionEffect=None

}
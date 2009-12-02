/**
 * Copyright 1998-2008 Epic Games, Inc. All Rights Reserved.
 */
class UTAttachment_FireExtinguisher extends UTWeaponAttachment
	dependson(UTEmitter);

var ParticleSystemComponent Tracer;

var array<DistanceBasedParticleTemplate> PrimaryImpactTemplates;

simulated function SpawnTracer(vector EffectLocation,vector HitLocation)
{
	if (UTPawn(Owner).FiringMode == 0)
	{
		Tracer.SetTranslation(EffectLocation);
		Tracer.SetVectorParameter('LinkBeamEnd', HitLocation);
		Tracer.SetRotation(rotator(HitLocation - EffectLocation));
		Tracer.ActivateSystem();
	}
}

simulated function FirstPersonFireEffects(Weapon PawnWeapon, vector HitLocation)
{
	super.FirstPersonFireEffects(PawnWeapon, HitLocation);
	SpawnTracer(UTWeapon(PawnWeapon).GetEffectLocation(),HitLocation);
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
	Super.ThirdPersonFireEffects(HitLocation);
	SpawnTracer(GetEffectLocation(), HitLocation);
}

simulated function StopThirdPersonFireEffects()
{
	Super.StopThirdPersonFireEffects();

	Tracer.DeactivateSystem();
}

simulated function PlayImpactEffects(vector HitLocation)
{
	DefaultImpactEffect.ParticleTemplate = class'UTEmitter'.static.GetTemplateForDistance(PrimaryImpactTemplates, HitLocation, WorldInfo);

	Super.PlayImpactEffects(HitLocation);
}

defaultproperties
{

	// Weapon SkeletalMesh

	Begin Object Name=SkeletalMeshComponent0
                SkeletalMesh=SkeletalMesh'WP_FireExtinguisher.Mesh.SK_WP_FireExtinguisher_1P'
		AnimSets[0]=AnimSet'WP_FireExtinguisher.Anim.K_WP_FireExtinguisher_1P2'
	End Object

	WeapAnimType=EWAT_Stinger

	PrimaryImpactTemplates[0]=(Template=ParticleSystem'WP_Stinger.Particles.P_WP_Stinger_Surface_Impact_Far',MinDistance=2250.0)
	PrimaryImpactTemplates[1]=(Template=ParticleSystem'WP_Stinger.Particles.P_WP_Stinger_Surface_Impact_Mid',MinDistance=600.0)
	PrimaryImpactTemplates[2]=(Template=ParticleSystem'WP_Stinger.Particles.P_WP_Stinger_Surface_Impact_Near',MinDistance=0.0)
	DefaultImpactEffect=(Sound=SoundCue'A_Weapon_Stinger.Weapons.A_Weapon_Stinger_FireImpactCue')
//	bAlignToSurfaceNormal=false
	bMakeSplash=true

	BulletWhip=SoundCue'A_Weapon.Enforcers.Cue.A_Weapon_Enforcers_BulletWhizz_Cue'
	WeaponClass=class'UTWeap_FE'
	MuzzleFlashLightClass=class'UTStingerMuzzleFlashLight'
	MuzzleFlashSocket=MF
	MuzzleFlashPSCTemplate=ParticleSystem'WP_Stinger.Particles.P_Stinger_3P_MF_Primary'
	MuzzleFlashAltPSCTemplate=ParticleSystem'WP_Stinger.Particles.P_Stinger_3P_MF_Alt_Fire'

	FireAnim=WeaponFire
}
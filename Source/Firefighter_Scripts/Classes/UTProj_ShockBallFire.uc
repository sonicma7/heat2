class UTProj_ShockBallFire extends UTProj_ShockBall;

defaultproperties
{
	ProjFlightTemplate=ParticleSystem'Firefighter2.Weapon.P_WP_ShockRifle_Ball'
	ProjExplosionTemplate=ParticleSystem'Firefighter2.Weapon.P_WP_ShockRifle_Ball_Impact'
	Speed=1150
	MaxSpeed=1150
	MaxEffectDistance=7000.0
	bCheckProjectileLight=true
	ProjectileLightClass=class'UTGame.UTShockBallLight'

	Damage=55
	DamageRadius=120
	MomentumTransfer=70000

	MyDamageType=class'UTDmgType_ShockBall'
	LifeSpan=8.0

	bCollideWorld=true
	bProjTarget=True

	ComboDamageType=class'UTDmgType_ShockCombo'
	ComboTriggerType=class'UTDmgType_ShockPrimary'

	ComboDamage=215
	ComboRadius=275
	ComboMomentumTransfer=150000
	ComboTemplate=ParticleSystem'WP_ShockRifle.Particles.P_WP_ShockRifle_Explo'
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
	AmbientSound=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_AltFireTravelCue'
	ExplosionSound=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_AltFireImpactCue'
	ComboExplosionSound=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_ComboExplosionCue'
	ComboExplosionEffect=class'UTEmit_ShockCombo'
}
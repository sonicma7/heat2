class UTWeap_ShockRifleFireSmall extends UTWeap_ShockRifle;

defaultproperties
{
	// Weapon SkeletalMesh
	Begin Object class=AnimNodeSequence Name=MeshSequenceA
	End Object

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WP_ShockRifle.Mesh.SK_WP_ShockRifle_1P'
		AnimSets(0)=AnimSet'WP_ShockRifle.Anim.K_WP_ShockRifle_1P_Base'
		Animations=MeshSequenceA
		Rotation=(Yaw=-16384)
		FOV=60.0
	End Object

        Components.Remove(PickupMesh)

	AttachmentClass=class'UTAttachment_ShockRifleFireSmall'

	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'Firefighter2.Weapon.SK_WP_ShockRifle_3P'
	End Object

	InstantHitMomentum(0)=+60000.0

	//WeaponFireTypes(0)=EWFT_InstantHit
	WeaponFireTypes(0)=EWFT_Projectile
	WeaponProjectiles(0)=class'UTProj_ShockBallFire'

	InstantHitDamage(0)=45
	//FireInterval(0)=+0.77
	FireInterval(0)=+1.5
	//InstantHitDamageTypes(0)=class'UTDmgType_ShockPrimary'
	InstantHitDamageTypes(0)=None

	//WeaponFireSnd[0]=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_FireCue'
	WeaponFireSnd[0]=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_AltFireCue'
	WeaponEquipSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_RaiseCue'
	WeaponPutDownSnd=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_LowerCue'
	PickupSound=SoundCue'A_Pickups.Weapons.Cue.A_Pickup_Weapons_Shock_Cue'

	MaxDesireability=0.65
	AIRating=0.65
	CurrentRating=0.65
	bInstantHit=true
	bSplashJump=false
	bRecommendSplashDamage=false
	bSniping=true
	//ShouldFireOnRelease(0)=0
	ShouldFireOnRelease(0)=1

	ShotCost(0)=0
	ShotCost(1)=0

	FireOffset=(X=40,Y=80)
	PlayerViewOffset=(X=17,Y=10.0,Z=-8.0)

	AmmoCount=20
	LockerAmmoCount=30
	MaxAmmoCount=50

	FireCameraAnim(0)=CameraAnim'Camera_FX.ShockRifle.C_WP_ShockRifle_Alt_Fire_Shake'

	WeaponFireAnim(0)=WeaponAltFire

	MuzzleFlashSocket=MF
	MuzzleFlashPSCTemplate=Firefighter2.Weapon.P_ShockRifle_MF_Alt
	MuzzleFlashAltPSCTemplate=Firefighter2.Weapon.P_ShockRifle_MF_Alt
	MuzzleFlashColor=(R=200,G=120,B=255,A=255)
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'UTGame.UTShockMuzzleFlashLight'
	CrossHairCoordinates=(U=256,V=0,UL=64,VL=64)
	LockerRotation=(Pitch=32768,Roll=16384)

	IconCoordinates=(U=728,V=382,UL=162,VL=45)

	QuickPickGroup=0
	QuickPickWeight=0.9

	WeaponColor=(R=160,G=0,B=255,A=255)

	InventoryGroup=4
	GroupWeight=0.5

	IconX=400
	IconY=129
	IconWidth=22
	IconHeight=48

	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=90,RightAmplitude=40,LeftFunction=WF_Constant,RightFunction=WF_LinearDecreasing,Duration=0.1200)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1
    
    

}


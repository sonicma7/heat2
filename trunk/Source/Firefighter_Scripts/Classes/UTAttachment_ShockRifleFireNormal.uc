class UTAttachment_ShockRifleFireNormal extends UTAttachment_ShockRifle;

defaultproperties
{
	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'Firefighter2.Weapon.SK_WP_ShockRifle_3P'
        bOnlyOwnerSee=False
	End Object
    
    WeaponClass=class'UTWeap_ShockRifleFireNormal'

	MuzzleFlashPSCTemplate=Firefighter2.Weapon.P_ShockRifle_3P_MF
	MuzzleFlashAltPSCTemplate=Firefighter2.Weapon.P_ShockRifle_3P_MF
    MuzzleFlashDuration=0;

}
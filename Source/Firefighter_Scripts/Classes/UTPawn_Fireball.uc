/**
 * Copyright 1998-2007 Epic Games, Inc. All Rights Reserved.
 */
class UTPawn_Fireball extends UTPawn;


event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	// hack here so we don't have to modify Pawn's TakeDamage this late in the dev cycle.
	if( !AffectedByHitEffects() )
	{
		Momentum = vect(0,0,0);
	}

	Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}


DefaultProperties
{

	// Set the collision.
	Begin Object Name=CollisionCylinder
		CollisionRadius=20.0
		CollisionHeight=50.0
		CollideActors=True
        BlockActors=True
	End Object
	CylinderComponent=CollisionCylinder

	//DefaultMesh = SkeletalMesh'CH_Twiggy.Twiggy'
	DefaultMesh = SkeletalMesh'Firefighter2.Mesh.FireBallEnemy'

    DefaultFamily=class'UTFamilyInfo_Fireball'

    SoundGroupClass = class'UTPawnSoundGroup_Fireball'
	
	Begin Object Name=MyLightEnvironment
    End Object
    Components.Add(MyLightEnvironment)

    Begin Object Name=WPawnSkeletalMeshComponent
    	//SkeletalMesh=SkeletalMesh'Firefighter2.Mesh.SK_CH_IronGuard_MaleB'
    	//PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
        AnimSets[0]=AnimSet'Firefighter2.Mesh.FireBallAnim'
    	//AnimSets[0]=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
    	AnimTreeTemplate=AnimTree'Firefighter2.Mesh.FireBallAnimTree'
        LightEnvironment=MyLightEnvironment
    	CastShadow=true
    	Translation=(X=0.0,Y=0.0,Z=0.0)
    	//Scale3D=(X=25.0,Y=25.0,Z=25.0)
        //GroundSpeed = 3
        //Scale=20
    End Object
    GroundSpeed = 80

}
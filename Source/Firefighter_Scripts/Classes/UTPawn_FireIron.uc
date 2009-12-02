/**
 * Copyright 1998-2007 Epic Games, Inc. All Rights Reserved.
 */
class UTPawn_FireIron extends UTPawn;


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

	//DefaultMesh = SkeletalMesh'CH_Twiggy.Twiggy'
	DefaultMesh = SkeletalMesh'Firefighter2.Mesh.SK_CH_IronGuard_MaleB'
	
	Begin Object Name=MyLightEnvironment
    End Object
    Components.Add(MyLightEnvironment)

    Begin Object Name=WPawnSkeletalMeshComponent
    	SkeletalMesh=SkeletalMesh'Firefighter2.Mesh.SK_CH_IronGuard_MaleB'
    	PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
    	AnimSets[0]=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
    	AnimTreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
    	LightEnvironment=MyLightEnvironment
    	CastShadow=true
    	Translation=(X=0.0,Y=0.0,Z=0.0)
    	Scale3D=(X=1.0,Y=1.0,Z=1.0)
    End Object

}
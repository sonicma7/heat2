/**
 * This class represents the base pawn.
 */
class UTPawn_FireIronTest2 extends Pawn
	placeable;



/**
 * The default properties.
 */
defaultproperties
{
	// Set the collision.
	Begin Object Name=CollisionCylinder
		CollisionRadius=21.0
		CollisionHeight=44.0
		CollideActors=True
        BlockActors=True
	End Object
	CylinderComponent=CollisionCylinder
	
	// Set up the light environment.
	Begin Object Class=DynamicLightEnvironmentComponent Name=LightEnvironment
		ModShadowFadeoutTime=1.0
		AmbientGlow=(R=0.8,G=0.8,B=0.8,A=1.0)
		AmbientShadowColor=(R=0.5,G=0.5,B=0.5)
	End Object
	Components.Add(LightEnvironment)
	
	// Set up the skeletal mesh and its animations.
	Begin Object Class=SkeletalMeshComponent Name=BodyMeshComponent
		AlwaysLoadOnClient=true
		AlwaysLoadOnServer=true
		bOwnerNoSee=true
		CastShadow=true
		BlockRigidBody=true
		bUpdateSkelWhenNotRendered=false
		bIgnoreControllersWhenNotRendered=true
		bUpdateKinematicBonesFromAnimation=true
		bCastDynamicShadow=true
		LightEnvironment=LightEnvironment
		bUseAsOccluder=false
		bOverrideAttachmentOwnerVisibility=true
		bAcceptsDecals=false
		bHasPhysicsAssetInstance=true
		bEnableFullAnimWeightBodies=true
		TickGroup=TG_PreAsyncWork
		MinDistFactorForKinematicUpdate=0.2
		bChartDistanceFactor=true
        SkeletalMesh=SkeletalMesh'Firefighter2.Mesh.SK_CH_IronGuard_MaleB'
		//PhysicsAsset=PhysicsAsset'Firefighter2.Mesh.SK_CH_IronGuard_MaleB'
		PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
		AnimSets[0]=AnimSet'Firefighter2.Mesh.K_AnimHuman_BaseMale'
		//AnimTreeTemplate=AnimTree'sk_velociraptor.anims.raptor_animtree'
		//SkeletalMesh=SkeletalMesh'sk_velociraptor.mesh.sk_raptor'
        //SkeletalMesh=SkeletalMesh'Firefighter2.Mesh.SK_CH_IronGuard_MaleA'
        //PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
		
        //SkeletalMesh=SkeletalMesh'CH_IronGuard_Male.Mesh.SK_CH_IronGuard_MaleA'        
        //PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
		//AnimSets[0]=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
		//AnimSets(0)=AnimSet'sk_velociraptor.anims.raptor_anims'
		//PhysAsset=PhysicsAsset'sk_velociraptor.mesh.sk_raptor_Physics'
		//Scale=1.0
	End Object
	Components.Add(BodyMeshComponent)
	Mesh=BodyMeshComponent
	
	// Adjust the eye height to match the UT standard rig.
	BaseEyeHeight=38.0
	EyeHeight=38.0
}



		
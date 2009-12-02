/**
 * Copyright 1998-2007 Epic Games, Inc. All Rights Reserved.
 */

class UTVehicleFactory_Hose extends UTVehicleFactory_TrackTurretBase;

defaultproperties
{
	Begin Object Name=SVehicleMesh
		SkeletalMesh=SkeletalMesh'VH_Hose.Mesh.SK_VH_Hose'
		Scale=10.0
	End Object

	Components.Remove(Sprite)

	Begin Object Name=CollisionCylinder
		CollisionHeight=80.0
		CollisionRadius=100.0
	End Object

	VehicleClassPath="UT3_Hose.UTVehicle_Hose"
}
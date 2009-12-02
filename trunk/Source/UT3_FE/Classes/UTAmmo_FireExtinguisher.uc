/**
 * Copyright 1998-2008 Epic Games, Inc. All Rights Reserved.
 */
class UTAmmo_FireExtinguisher extends UTAmmoPickupFactory;

defaultproperties
{
	AmmoAmount=8
	TargetWeapon=class'UTWeap_FE'
	PickupSound=SoundCue'A_Pickups.Ammo.Cue.A_Pickup_Ammo_Shock_Cue'
	MaxDesireability=0.28

	Begin Object Name=AmmoMeshComp
		StaticMesh=StaticMesh'Pickups.Ammo_Shock.Mesh.S_Ammo_ShockRifle'
		Translation=(X=0.0,Y=0.0,Z=-15.0)
	End Object

	Begin Object Name=CollisionCylinder
		CollisionHeight=14.4
	End Object
}
class BearInv extends MaskInv;

var		PolarBearMask		BMAsk;

simulated function GiveTo( pawn Other, optional Pickup Pickup ) 
{

    local Inventory I;
	
	if(Role==ROLE_Authority)
	{
		if(BMAsk == none)
		{
			BMAsk = Spawn(class'PolarBearMask',Other);
			//Other.AttachToBone(BMAsk,'Head');
			BMAsk.TransferActor(Other);
		}
		

	}
	
	For( I = Other.Inventory; I != None; I =I.Inventory )
	{
		if ( DinoInv(I) != none || BearInv(I) != None || PandaInv(I) != None || BudInv(I) != None || HuskInv(I) != None || SirenInv(I) != None || ElephantInv(I) != None || ChainChompInv(I) != None || KirbyInv(I) != None || PeachInv(I) != None || FoxInv(I) != None || AureolaInv(I) != None || AquaInv(I) != None || YoshiInv(I) != None || NonInv(I) != None || PumpkinInv(I) != None )
		{

               
			I.Destroyed();
			I.Destroy();
	
		}
	}
	
	Super.GiveTo(Other,Pickup);
}

function DropFrom(vector StartLocation)
{
	if ( BMAsk != none )
	{
		BMAsk.Destroy();
	}
	
	Super.DropFrom(StartLocation);
}


simulated function Destroyed()
{
    if ( BMAsk != none )
	{
		BMAsk.Destroy();
	}

    super(KFWeapon).Destroyed();   
}

defaultproperties
{
     HudImage=Texture'CuteCostumes_T.polarbeartrade'
     SelectedHudImage=Texture'CuteCostumes_T.polarbeartrade'
     Weight=0.000000
     TraderInfoTexture=Texture'CuteCostumes_T.polarbeartrade'
     FireModeClass(0)=Class'KFMod.NoFire'
     FireModeClass(1)=Class'KFMod.NoFire'
     SelectForce="SwitchToAssaultRifle"
     bCanThrow=False
     Description="Costume: Polar Bear Mask."
     Priority=10
     InventoryGroup=5
     GroupOffset=5
     PickupClass=Class'CuteCostumes.BearPickup'
     BobDamping=6.000000
     AttachmentClass=Class'CuteCostumes.CostumeAttachment'
     IconCoords=(X1=250,Y1=110,X2=330,Y2=145)
     ItemName="PolarBear Mask"
     DrawType=DT_None
     Mesh=SkeletalMesh'KF_Weapons_Trip.9mm_Trip'
}

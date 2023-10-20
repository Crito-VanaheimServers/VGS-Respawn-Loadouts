/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];

private _ctrl = _this select 0;
private _selection = _ctrl lbData (lbCurSel _ctrl);
_ctrl lbDelete (lbCurSel _ctrl);

switch (ButtonType) do
{	
	case "Uniform":
	{	
		ExileClientModelBoxVehicle removeItemFromUniform _selection;
	};
	case "Vest":
	{			
		ExileClientModelBoxVehicle removeItemFromVest _selection;
	};
	case "BackPack":
	{
		ExileClientModelBoxVehicle removeItemFromBackpack _selection;
	};	
};

[] call vgsLoadouts_fnc_LoadOutPricing;

true
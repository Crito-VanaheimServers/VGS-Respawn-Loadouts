/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];

private _ctrl = _this select 0;
private _selection = _ctrl lbData (lbCurSel _ctrl);
private _itemAdded = false;

	if ((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) exitWith
	{
		["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
		playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
	};
	
switch (ButtonType) do
{	
	case "Uniform":
	{	
		if!(ExileClientModelBoxVehicle canAddItemToUniform _selection) exitWith
		{
			["ErrorTitleAndText",["Loadout Error", format["Not enough space in uniform to add item"]]] call ExileClient_gui_toaster_addTemplateToast;
			playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
		};
		
		ExileClientModelBoxVehicle addItemToUniform _selection;
										   
		_itemAdded = true;
	};
	case "Vest":
	{			
		if!(ExileClientModelBoxVehicle canAddItemToVest  _selection) exitWith
		{
			["ErrorTitleAndText",["Loadout Error", format["Not enough space in vest to add item"]]] call ExileClient_gui_toaster_addTemplateToast;
			playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
		};
			
		ExileClientModelBoxVehicle addItemToVest _selection;
										
		_itemAdded = true;
	};
	case "BackPack":
	{
		if!(ExileClientModelBoxVehicle canAddItemToBackpack   _selection) exitWith
		{
			["ErrorTitleAndText",["Loadout Error", format["Not enough space in Backpack to add item"]]] call ExileClient_gui_toaster_addTemplateToast;
			playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
		};

		ExileClientModelBoxVehicle addItemToBackpack _selection;
											
		_itemAdded = true;
	};	
};

if(_itemAdded)then
{
	private _configName = _Selection call ExileClient_util_gear_getConfigNameByClassName;
	private _item = (getText (configFile >> _configName >> _selection >> "displayName"));
	private _index = (_display displayCtrl 99151) lbAdd _item;
	(_display displayCtrl 99151) lbSetData [_index,_selection];
	
	private _toolTip = format ["Double click on items to remove from inventory"];
	(_display displayCtrl 99151) lbSetTooltip [_index, _toolTip];
	
	[] call vgsLoadouts_fnc_LoadOutPricing;
};

true
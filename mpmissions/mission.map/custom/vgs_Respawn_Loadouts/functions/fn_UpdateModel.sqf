/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private["_vehicleClassName", "_unitLoadout","_modelBoundingDimensions", "_modelBoundingRadius"];

disableSerialization;

call ExileClient_gui_toaster_removeAllToasts;

private _loadoutdisplay = uiNamespace getVariable "vgsLoadoutGUI";

if (vgs_LoadoutStarted) then
{
	_vehicleClassName = _this select 0;
	_unitLoadout = _this select 1;
	if !(isNull ExileClientModelBoxVehicle) then
	{
		deleteVehicle ExileClientModelBoxVehicle;
	};
	ExileClientModelBoxVehicle = _vehicleClassName createVehicleLocal ExileClientModelBoxPosition;

	{ExileClientModelBoxVehicle removeWeaponGlobal _x;} 	forEach (weapons ExileClientModelBoxVehicle);
	{ExileClientModelBoxVehicle unlinkItem _x;} 			forEach (assignedItems ExileClientModelBoxVehicle);
	{ExileClientModelBoxVehicle removeItem _x;} 			forEach (items ExileClientModelBoxVehicle);
	removeAllItemsWithMagazines 	ExileClientModelBoxVehicle;
	removeHeadgear 					ExileClientModelBoxVehicle;
	removeUniform 					ExileClientModelBoxVehicle;
	removeVest 						ExileClientModelBoxVehicle;
	removeBackpackGlobal 			ExileClientModelBoxVehicle;
	
	ExileClientModelBoxVehicle linkItem "ItemMap";
	ExileClientModelBoxVehicle linkItem "ItemGPS";
	ExileClientModelBoxVehicle linkItem "Exile_Item_XM8";
	ExileClientModelBoxVehicle linkItem "ItemCompass";

	vgs_LoadoutStarted = false;
}
else
{
	private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];
	private _ctrl = _this select 0;
	private _selection = _ctrl lbData (lbCurSel _ctrl);
	
	private _itemCheck = [_selection] call vgsLoadouts_fnc_GetItemType;
	
	private	_itemClass = _itemCheck select 0;	
	private	_itemType = _itemCheck select 1;	

	if((_itemClass == "") && (_itemType == ""))then
	{
		_itemClass = "NONE";	
	};
	
	switch (ButtonType) do
	{	
		case "PrimaryWpn":
		{
			switch (_itemClass) do
			{	
				case "Weapon":
				{			
					switch (_itemType) do
					{
						case "MachineGun";
						case "Rifle";
						case "SniperRifle";
						case "AssaultRifle";
						case "SubmachineGun":					
						{
							if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
							{
								private _scopes = [];
								private _compatibleMags = [_selection, false] call BIS_fnc_compatibleMagazines;
								private _compatibleItems = _selection call BIS_fnc_compatibleItems;
								{
									private _scopeCheck = [_x] call vgsLoadouts_fnc_GetItemType;
									private _isScope = _scopeCheck select 1;
									if ((_isScope == "AccessorySights") && (_x in respawnSights)) then
									{
										_scopes pushback _x;
									};
								}forEach _compatibleItems;
								[_compatibleMags] call vgsLoadouts_fnc_WeaponMagsLoad;
								[_scopes] call vgsLoadouts_fnc_WeaponItemsLoad;
								[_selection] call vgsLoadouts_fnc_DisplayStats;
								
								private _modelItem = primaryWeapon ExileClientModelBoxVehicle;
								if (_selection != _modelItem)then
								{
									ExileClientModelBoxVehicle addWeapon _selection;
								};
								
								if(vgsLoadoutTabs)then
								{
									private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
									private _ItemCost = format ["Item Cost: %1", _itemPrice];
									(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;	
								};
							}
							else
							{
								["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
								playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
							};
						};
					};
				};
				case "Item";
				case "Magazine":
				{
					switch (_itemType) do 
					{
						case "Bullet";
						case "AccessorySights":
						{
							if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
							{
								[_selection] call vgsLoadouts_fnc_DisplayStats;
								ExileClientModelBoxVehicle addPrimaryWeaponItem _selection;
								
								if(vgsLoadoutTabs)then
								{
									private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
									private _ItemCost = format ["Item Cost: %1", _itemPrice];
									(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
								};
							}
							else
							{
								["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
								playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
							};
						};
					};
				};
				case "NONE":
				{
					private _modelItem = primaryWeapon ExileClientModelBoxVehicle;
					if !(_modelItem == "")then
					{
						ExileClientModelBoxVehicle removeWeaponGlobal _modelItem;
					};
					
					if(vgsLoadoutTabs)then
					{
						private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
				};
			};
		};
		case "Uniform":
		{
			switch (_itemClass) do
			{
				case "NONE":
				{
					lbClear 99151;
					private _modelItem = uniform ExileClientModelBoxVehicle;
					if !(_modelItem == "")then
					{
						removeUniform ExileClientModelBoxVehicle;
					};
					
					if(vgsLoadoutTabs)then
					{
						private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
					
					[] call vgsLoadouts_fnc_DropBoxLoad;
				};
				default
				{
					if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
					{
						lbClear 99151;
						private _modelItem = uniform ExileClientModelBoxVehicle;
						[_selection] call vgsLoadouts_fnc_DisplayStats;
						if (_selection != _modelItem)then
						{
							ExileClientModelBoxVehicle forceAddUniform _selection;
						};
						
						if(vgsLoadoutTabs)then
						{						
							private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
							private _ItemCost = format ["Item Cost: %1", _itemPrice];
							(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
							
							[] call vgsLoadouts_fnc_DropBoxLoad;
						};
					}
					else
					{
						["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;					
						playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
					};
				};
			};
		};
		case "Vest":
		{
			switch (_itemClass) do
			{
				case "NONE":
				{
					lbClear 99151;
					private _modelItem = vest ExileClientModelBoxVehicle;
					if !(_modelItem == "")then
					{
						removeVest ExileClientModelBoxVehicle;
					};
					
					if(vgsLoadoutTabs)then
					{
						private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
					
					[] call vgsLoadouts_fnc_DropBoxLoad;
				};
				default
				{
					if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
					{
						lbClear 99151;
						private _modelItem = vest ExileClientModelBoxVehicle;
						[_selection] call vgsLoadouts_fnc_DisplayStats;
						if (_selection != _modelItem)then
						{
							ExileClientModelBoxVehicle addVest _selection;
						};
	
						if(vgsLoadoutTabs)then
						{						
							private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
							private _ItemCost = format ["Item Cost: %1", _itemPrice];
							(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
						};
						
						[] call vgsLoadouts_fnc_DropBoxLoad;
					}
					else
					{
						["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;					
						playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
					};
				};
			};
		};
		case "BackPack":
		{
			switch (_itemClass) do
			{
				case "NONE":
				{
					lbClear 99151;
					private _modelItem = BackPack ExileClientModelBoxVehicle;
					if !(_modelItem == "")then
					{
						removeBackpackGlobal ExileClientModelBoxVehicle;
					};

					if(vgsLoadoutTabs)then
					{							
						private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
					
					[] call vgsLoadouts_fnc_DropBoxLoad;
				};
				default
				{
					if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
					{
						lbClear 99151;
						private _modelItem = BackPack ExileClientModelBoxVehicle;
						[_selection] call vgsLoadouts_fnc_DisplayStats;
						if (_selection != _modelItem)then
						{
							ExileClientModelBoxVehicle addBackpack _selection;
						};

						if(vgsLoadoutTabs)then
						{						
							private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
							private _ItemCost = format ["Item Cost: %1", _itemPrice];
							(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
						};
						
						[] call vgsLoadouts_fnc_DropBoxLoad;
					}
					else
					{
						["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
						playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
					};
				};
			};
		};
		case "HeadGear":
		{
			switch (_itemClass) do
			{
				case "NONE":
				{
					private _modelItem = HeadGear ExileClientModelBoxVehicle;
					if !(_modelItem == "")then
					{
						removeHeadgear ExileClientModelBoxVehicle;
					};
					
					if(vgsLoadoutTabs)then
					{					
						private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
				};
				default
				{
					if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
					{
						[_selection] call vgsLoadouts_fnc_DisplayStats;
						ExileClientModelBoxVehicle addHeadgear _selection;
						
						if(vgsLoadoutTabs)then
						{					
							private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
							private _ItemCost = format ["Item Cost: %1", _itemPrice];
							(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
						};
					}
					else
					{
						["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
						playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
					};
				};
			};
		};
		case "NVG":
		{
			switch (_itemClass) do
			{
				case "NONE":
				{
					
					private _modelItem = ExileClientModelBoxVehicle getSlotItemName 616;
					if !(_modelItem == "")then
					{
						private _NVG = hmd ExileClientModelBoxVehicle;
						ExileClientModelBoxVehicle unlinkItem _NVG; 
					};
					
					if(vgsLoadoutTabs)then
					{
							private _ItemCost = format ["Item Cost: 0"];
						(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
					};
				};
				default
				{
					if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
					{
						[_selection] call vgsLoadouts_fnc_DisplayStats;
						ExileClientModelBoxVehicle linkItem _selection;
						
						if(vgsLoadoutTabs)then
						{
							private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
							private _ItemCost = format ["Item Cost: %1", _itemPrice];
							(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
						};
					}
					else
					{
						["ErrorTitleAndText",["Loadout Error", format["Hover mouse over item to see missing requirements."]]] call ExileClient_gui_toaster_addTemplateToast;
						playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
					};
				};
			};
		};
	};	
};

[] call vgsLoadouts_fnc_LoadOutPricing;

ExileClientModelBoxVehicle setPosATL ExileClientModelBoxPosition;
ExileClientModelBoxVehicle setDir 0;
ExileClientModelBoxVehicle enableSimulation false;
_modelBoundingDimensions = ExileClientModelBoxVehicle call BIS_fnc_boundingBoxDimensions;
_modelBoundingRadius = ExileClientModelBoxVehicle call BIS_fnc_boundingCircle;

ExileClientModelBoxCameraFocusPosition = 
[
	ExileClientModelBoxPosition select 0, 
	ExileClientModelBoxPosition select 1, 
	(ExileClientModelBoxPosition select 2) + ((_modelBoundingDimensions select 2) * 0.5)
];
ExileClientModelBoxCameraFocusObject setPosATL ExileClientModelBoxCameraFocusPosition;
ExileClientModelBoxCameraPosition = 
[
	(ExileClientModelBoxCameraFocusPosition select 0) - _modelBoundingRadius, 
	ExileClientModelBoxCameraFocusPosition select 1, 
	(ExileClientModelBoxPosition select 2) + (_modelBoundingDimensions select 2) 
];
ExileClientModelBoxCamera camPrepareTarget ExileClientModelBoxCameraFocusObject;
ExileClientModelBoxCamera setPosATL ExileClientModelBoxCameraPosition;
ExileClientModelBoxCamera camCommitPrepared 0;

true
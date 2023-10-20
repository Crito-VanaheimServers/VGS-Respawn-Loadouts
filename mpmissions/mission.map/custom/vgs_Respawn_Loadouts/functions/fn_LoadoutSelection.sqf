/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

disableSerialization;

private _display = createDialog "vgsLoadoutGUI";
cutText ["","BLACK IN"]; 

vgs_LoadoutStarted = true;

private _loadoutdisplay = uiNamespace getVariable "vgsLoadoutGUI";

ExileClientMoonLight setLightBrightness 5;

{
	ctrlShow [_x, false];
}forEach [99105,99106,99107,99108,99109,99110,99111,99112,99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];

call ExileClient_gui_postProcessing_reset; 
SelectedSpawn = 0;

call ExileClient_gui_modelBox_create;

private _listBox = _loadoutdisplay displayCtrl 99104;
_listBox ctrlSetEventHandler ["LBSelChanged", "_this call vgsLoadouts_fnc_UpdateModel"];
_listBox ctrlCommit 0;

private _listBox1 = _loadoutdisplay displayCtrl 99108;
_listBox1 ctrlSetEventHandler ["LBSelChanged", "_this call vgsLoadouts_fnc_UpdateModel"];
_listBox1 ctrlCommit 0;

private _listBox2 = _loadoutdisplay displayCtrl 99112;
_listBox2 ctrlSetEventHandler ["LBSelChanged", "_this call vgsLoadouts_fnc_UpdateModel"];
_listBox2 ctrlCommit 0;

private _dropBoxCategories = _loadoutdisplay displayCtrl 99158;
_dropBoxCategories ctrlSetEventHandler ["LBSelChanged", "_this call vgsLoadouts_fnc_DropBoxSelLoad"];
_dropBoxCategories ctrlCommit 0;

private _listBox3 = _loadoutdisplay displayCtrl 99150;
_listBox3 ctrlSetEventHandler ["LBSelChanged", "_this call vgsLoadouts_fnc_ItemsListBoxChange"];
_listBox3 ctrlSetEventHandler ["MouseButtonDblClick", "_this call vgsLoadouts_fnc_ItemsInventoryAdd"];
_listBox3 ctrlCommit 0;

private _listBox4 = _loadoutdisplay displayCtrl 99151;
_listBox4 ctrlSetEventHandler ["MouseButtonDblClick", "_this call vgsLoadouts_fnc_ItemsInventoryRemove"];
_listBox4 ctrlCommit 0;

private _lockerFunds = player getVariable ["ExileLocker",0];
private _fundsText = format ["Available Funds: %1 Tabs",_lockerFunds];

private _lbLockerBalance = _loadoutdisplay ctrlCreate ["RscText", 99162];
_lbLockerBalance ctrlSetPosition [0.683937 * safezoneW + safezoneX, 0.600  * safezoneH + safezoneY,0.216563 * safezoneW,0.05 * safezoneH];
_lbLockerBalance ctrlSetText _fundsText;
_lbLockerBalance ctrlSetScale 1.75;
_lbLockerBalance ctrlSetTextColor [0,206,209,1.374];
_lbLockerBalance ctrlCommit 0;

private _lbItemCost = _loadoutdisplay ctrlCreate ["RscText", 99163];
_lbItemCost ctrlSetPosition [0.683937 * safezoneW + safezoneX, 0.650  * safezoneH + safezoneY,0.216563 * safezoneW,0.05 * safezoneH];
_lbItemCost ctrlSetText "Item Cost:	0 Tabs";
_lbItemCost ctrlSetScale 1.75;
_lbItemCost ctrlSetTextColor [0,206,209,1.374];
_lbItemCost ctrlCommit 0;

private _lbTotalCost = _loadoutdisplay ctrlCreate ["RscText", 99164];
_lbTotalCost ctrlSetPosition [0.683937 * safezoneW + safezoneX, 0.700  * safezoneH + safezoneY,0.216563 * safezoneW,0.05 * safezoneH];
_lbTotalCost ctrlSetText "Loadout Cost:	0 Tabs";
_lbTotalCost ctrlSetScale 1.75;
_lbTotalCost ctrlSetTextColor [0,206,209,1.374];
_lbTotalCost ctrlCommit 0;

["O_Soldier_unarmed_F", []] call vgsLoadouts_fnc_UpdateModel;

_loadoutdisplay displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 

waitUntil {SelectedSpawn isEqualTo 1};
SelectedSpawn = 0;

private _VGSRespawnLoadout = getUnitLoadout ExileClientModelBoxVehicle;
player setVariable ["VGSRespawnLoadout",_VGSRespawnLoadout,true];

ExileClientSpawnLocationSelectionDone = true;
true
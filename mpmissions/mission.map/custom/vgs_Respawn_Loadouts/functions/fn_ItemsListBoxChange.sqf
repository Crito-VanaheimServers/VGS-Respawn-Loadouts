/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _loadoutdisplay = uiNamespace getVariable "vgsLoadoutGUI";

private _ctrl = _this select 0;
private _selection = _ctrl lbData (lbCurSel _ctrl);
 
if !((_ctrl lbColor (lbCurSel _ctrl)) isEqualTo [1,0,0,1]) then 
{
	_selection call vgsLoadouts_fnc_DisplayStats;
	
	if(vgsLoadoutTabs)then
	{
		private _itemPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _selection >> "price");
		private _ItemCost = format ["Item Cost: %1", _itemPrice];
		(_loadoutdisplay displayCtrl 99163) ctrlSetText _ItemCost;
	};
}
else
{
	playSoundUI ["FD_CP_Not_Clear_F", 0.5, 0.5];
};

true
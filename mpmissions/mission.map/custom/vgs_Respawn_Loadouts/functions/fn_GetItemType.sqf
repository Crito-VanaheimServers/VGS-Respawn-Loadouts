/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

params ["_selection"];

private _itemResult = [_selection] call BIS_fnc_itemType;		/// gets item item type and class type
		
if (_itemResult select 0 == "") then
{
	_itemResult = [_selection] call BIS_fnc_ObjectType;
};

_itemResult
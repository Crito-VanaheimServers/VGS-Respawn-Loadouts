/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _dropBoxCat = ["FOOD","DRINK","MEDICAL","AMMUNITION","MISC"];

lbClear 99158;

for "_i" from 0 to (count _dropBoxCat)-1 do
{
	Private _Category = _dropBoxCat select _i;
	private _index = (_display displayCtrl 99158) lbAdd _Category;
	(_display displayCtrl 99158) lbSetData [_index,_Category];
};

(_display displayCtrl 99158) lbSetCurSel 0;

true
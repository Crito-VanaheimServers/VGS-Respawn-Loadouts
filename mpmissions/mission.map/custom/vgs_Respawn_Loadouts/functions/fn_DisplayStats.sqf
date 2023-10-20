/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

params ["_item"];

private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];

private _stats = _item call ExileClient_util_item_getMainStats;
private _ctrl = 99130;
private _xTextPos = 0.435;
private _xPos = 0.450;

for "_i" from 0 to (20) -1 do
{
		ctrlDelete (_display displayCtrl _ctrl);
		_ctrl = _ctrl + 1;
};

private _itemPic = _display ctrlCreate ["RscPictureKeepAspect", 99130];
_itemPic ctrlSetPosition [0.695937 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.216563 * safezoneW,0.176 * safezoneH];
private _configName = _item call ExileClient_util_gear_getConfigNameByClassName;
_itemPic ctrlCommit 0;
_itemPic ctrlSetText getText(configFile >> _configName >> _item >> "picture");

private _picframe = _display ctrlCreate ["RscFrame", 99131];
_picframe ctrlSetPosition [0.690781 * safezoneW + safezoneX,0.214 * safezoneH + safezoneY,0.226875 * safezoneW,0.198 * safezoneH];
_picframe ctrlSetTextColor [0,206,209,1.374];
_picframe ctrlCommit 0;

private _stats = _item call ExileClient_util_item_getMainStats;
private _ctrl = 99130;
private _xTextPos = 0.435;
private _xPos = 0.450;

_ctrl = 99132;
for "_i" from 0 to (count _stats)-1 do
{
	private _stat = (_stats select _i);
	if !((_stat select 0) == "SALES PRICE")then
	{
		private _lable = _display ctrlCreate ["RscText",_ctrl];
		_lable ctrlSetPosition [0.689937 * safezoneW + safezoneX, _xTextPos  * safezoneH + safezoneY,0.216563 * safezoneW,0.01 * safezoneH];
		_lable ctrlSetTextColor [1,1,1,1];
		_lable ctrlCommit 0;
		_lable ctrlSetText (_stat select 0);
		_ctrl = _ctrl + 1;
		private _pbar = _display ctrlCreate ["RscProgress", _ctrl];
		_pbar ctrlSetPosition [0.689937 * safezoneW + safezoneX, _xPos  * safezoneH + safezoneY,0.216563 * safezoneW,0.01 * safezoneH];
		_pbar ctrlSetTextColor [0,206,209,1.374];
		_pbar progressSetPosition (_stat select 2);
		_pbar ctrlCommit 0;
		_ctrl = _ctrl + 1;
		private _frame = _display ctrlCreate ["RscFrame", _ctrl];
		_frame ctrlSetPosition [0.689937 * safezoneW + safezoneX, _xPos  * safezoneH + safezoneY,0.216563 * safezoneW,0.01 * safezoneH];
		_frame ctrlSetTextColor [0,206,209,1.374];
		_frame ctrlCommit 0;
	
		_xTextPos = _xTextPos + 0.050;
		_xPos = _xPos + 0.050;
		_ctrl = _ctrl + 1;
	};
};

true
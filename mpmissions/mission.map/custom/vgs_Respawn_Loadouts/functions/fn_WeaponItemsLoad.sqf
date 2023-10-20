/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

params ["_compatibleItems"];

private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];
lbClear 99112;
private _playerRespect = ExileClientPlayerScore;
private _lockerFunds = player getVariable ["ExileLocker",0];

private _PrimaryWpnItms = [];

for "_i" from 0 to (count _compatibleItems)-1 do
{
	private _curItem = (_compatibleItems select _i);
	private _configName = _curItem call ExileClient_util_gear_getConfigNameByClassName;
	private _item = (getText (configFile >> _configName >> _curItem >> "displayName"));
	private _itemRespect = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "quality");
	private _requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_itemRespect]);
	private _itemCost = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "price");
	private _itemInfo = [_requiredRespect,_itemCost,_item,_curItem];
	_PrimaryWpnItms pushBack _itemInfo;
};

_PrimaryWpnItms sort true;

for "_i" from 0 to (count _PrimaryWpnItms)-1 do
{
	private _requiredRespect = (_PrimaryWpnItms select _i)select 0;
	private _itemCost = (_PrimaryWpnItms select _i)select 1;
	private _item = (_PrimaryWpnItms select _i)select 2;
	private _curItem = (_PrimaryWpnItms select _i)select 3;
	private _itemRespect = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "quality");
	private _index = (_display displayCtrl 99112) lbAdd _item;
	(_display displayCtrl 99112) lbSetData [_index,_curItem];

	if((_requiredRespect > _playerRespect) && (vgsLoadoutRep))then
	{
		(_display displayCtrl 99112) lbSetColor [_index,[1,0,0,1]];
		private _missingRep = _requiredRespect - _playerRespect;
		private _toolTip = format ["[Respect Unlock: %1], Missing %2 Respect", _requiredRespect, _missingRep];
		(_display displayCtrl 99112) lbSetTooltip [_index, _toolTip];
	}
	else
	{
		if((_itemCost > _lockerFunds) && (vgsLoadoutTabs))then
		{
			(_display displayCtrl 99112) lbSetColor [_index,[1,0,0,1]];
			private _missingTabs = _lockerFunds - _itemCost;
			private _toolTip = format ["[Item Cost: %1], Missing %2 Tabs", _itemCost, _missingTabs];
			(_display displayCtrl 99112) lbSetTooltip [_index, _toolTip];
		}
		else
		{
			private _respectColor = [1, 1, 1, 1];

			switch (_itemRespect) do
			{
				case 2: 	 { _respectColor = [0.62, 0.87 ,0.23, 1]; };
				case 3:		 { _respectColor = [0, 0.78, 0.92, 1]; };
				case 4:		 { _respectColor = [0.62, 0.27, 0.58, 1]; };
				case 5:		 { _respectColor = [1, 0.7, 0.09, 1]; };
				case 6:		 { _respectColor = [0.93, 0, 0.48, 1]; };
			};
			
			(_display displayCtrl 99112) lbSetColor [_index,_respectColor];
		};
	};
};

true
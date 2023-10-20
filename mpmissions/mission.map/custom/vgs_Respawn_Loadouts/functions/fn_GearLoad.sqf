/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _display = uiNameSpace getVariable ["vgsLoadoutGUI", displayNull];

lbClear 99104;

private _ctrl = 99130;
for "_i" from 0 to (20) -1 do
{
		ctrlDelete (_display displayCtrl _ctrl);
		_ctrl = _ctrl + 1;
};

private _playerRespect = ExileClientPlayerScore;
private _lockerFunds = player getVariable ["ExileLocker",0];

private _listBoxItems = nil;
private _sortList = [];
private _inventoryItems = [];
private _showInventoryItems = false;
private _modelItem = "";

switch (ButtonType) do
{	
	case "PrimaryWpn":
	{
			{
				ctrlShow [_x, false];
			}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];
			
			{
				ctrlShow [_x, true];
			}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
			
			_listBoxItems = respawnPrimaryWpn;
			
			_modelItem = primaryWeapon ExileClientModelBoxVehicle;
	};
	case "Uniform":
	{
		{
			ctrlShow [_x, false];
		}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
		
		{
			ctrlShow [_x, true];
		}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];

		lbClear 99151;
		
		_listBoxItems = respawnUniforms;
		
		_modelItem = uniform ExileClientModelBoxVehicle;
		
		_inventoryItems = uniformItems ExileClientModelBoxVehicle;
		
		_showInventoryItems = true;
	};
	case "Vest":
	{
		{
			ctrlShow [_x, false];
		}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
		
		{
			ctrlShow [_x, true];
		}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];

		lbClear 99151;
		
		_listBoxItems = respawnVest;
		
		_modelItem = vest ExileClientModelBoxVehicle;

		_inventoryItems = vestItems ExileClientModelBoxVehicle;
			
		_showInventoryItems = true;
	};
	case "BackPack":
	{
		{
			ctrlShow [_x, false];
		}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
		
		{
			ctrlShow [_x, true];
		}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];

		lbClear 99151;
		
		_listBoxItems = respawnBackPacks;
		
		_modelItem = backpack ExileClientModelBoxVehicle;

		_inventoryItems = backpackItems ExileClientModelBoxVehicle;
					
		_showInventoryItems = true;
	};
	case "HeadGear":
	{
		{
			ctrlShow [_x, false];
		}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
		
		{
			ctrlShow [_x, false];
		}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];
		
		_listBoxItems = respawnHeadGear;
		
		_modelItem = headgear ExileClientModelBoxVehicle;
	};
	case "NVG":
	{
		{
			ctrlShow [_x, false];
		}forEach [99105,99106,99107,99108,99109,99110,99111,99112];
		
		{
			ctrlShow [_x, false];
		}forEach [99150,99151,99152,99153,99154,99155,99156,99157,99158,99159];
		
		_listBoxItems = respawnNVG;
		
		_modelItem = ExileClientModelBoxVehicle getSlotItemName 616;
	};
};	

private _firstIndex = (_display displayCtrl 99104) lbAdd "<NONE>";
(_display displayCtrl 99104) lbSetData [_firstIndex,""];

if(_modelItem == "")then
{
	(_display displayCtrl 99104) lbSetCurSel _firstIndex;
};

for "_i" from 0 to (count _listBoxItems)-1 do
{
	private _curItem = (_listBoxItems select _i);
	private _configName = _curItem call ExileClient_util_gear_getConfigNameByClassName;
	private _item = (getText (configFile >> _configName >> _curItem >> "displayName"));
	private _itemRespect = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "quality");
	private _requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_itemRespect]);
	private _itemCost = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "price");
	private _itemInfo = [_requiredRespect,_itemCost,_item,_curItem];
	_sortList pushBack _itemInfo;
};

_sortList sort true;

for "_i" from 0 to (count _sortList)-1 do
{
	private _requiredRespect = (_sortList select _i)select 0;
	private _itemCost = (_sortList select _i)select 1;
	private _item = (_sortList select _i)select 2;
	private _curItem = (_sortList select _i)select 3;
	private _itemRespect = getNumber(missionConfigFile >> "CfgExileArsenal" >> _curItem >> "quality");
	private _index = (_display displayCtrl 99104) lbAdd _item;
	(_display displayCtrl 99104) lbSetData [_index,_curItem];

	if((_requiredRespect > _playerRespect) && (vgsLoadoutRep))then
	{
		(_display displayCtrl 99104) lbSetColor [_index,[1,0,0,1]];
		private _missingRep = _requiredRespect - _playerRespect;
		private _toolTip = format ["[Respect Unlock: %1], Missing %2 Respect", _requiredRespect, _missingRep];
		(_display displayCtrl 99104) lbSetTooltip [_index, _toolTip];
	}
	else
	{
		if((_itemCost > _lockerFunds) && (vgsLoadoutTabs))then
		{
			(_display displayCtrl 99104) lbSetColor [_index,[1,0,0,1]];
			private _missingTabs = _itemCost - _lockerFunds;
			private _toolTip = format ["[Item Cost: %1], Missing %2 Tabs", _itemCost, _missingTabs];
			(_display displayCtrl 99104) lbSetTooltip [_index, _toolTip];
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
			
			(_display displayCtrl 99104) lbSetColor [_index,_respectColor];
		};		
	};
	
	if(_modelItem == _curItem)then
	{
		(_display displayCtrl 99104) lbSetCurSel _index;
	};
};

if(_showInventoryItems)then
{
	for "_i" from 0 to (count _inventoryItems)-1 do
	{
		private _inventoryItem = _inventoryItems select _i;
		private _configName = _inventoryItem call ExileClient_util_gear_getConfigNameByClassName;
		private _item = (getText (configFile >> _configName >> _inventoryItem >> "displayName"));
		
		private _index = (_display displayCtrl 99151) lbAdd _item;
		(_display displayCtrl 99151) lbSetData [_index,_inventoryItem];
	};
};

true
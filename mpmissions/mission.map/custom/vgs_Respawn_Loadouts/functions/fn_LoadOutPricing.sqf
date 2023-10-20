/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _loadoutdisplay = uiNamespace getVariable "vgsLoadoutGUI";

private _VGSRespawnLoadout = getUnitLoadout ExileClientModelBoxVehicle;
private _itemsArray = [];

private _primaryWpn = primaryWeapon ExileClientModelBoxVehicle;
private _uniform = uniform ExileClientModelBoxVehicle;
private _vest = vest ExileClientModelBoxVehicle;
private _backPack = BackPack ExileClientModelBoxVehicle;
private _headGear = HeadGear ExileClientModelBoxVehicle;
private _NVG = hmd ExileClientModelBoxVehicle;

private _vgsLoadoutItems = [_primaryWpn,_uniform,_vest,_backPack,_headGear,_NVG];

	if !(_primaryWpn == "")then
	{
		private _primaryAmmoArray = primaryWeaponMagazine ExileClientModelBoxVehicle;
		private _primaryAttachments = primaryWeaponItems ExileClientModelBoxVehicle;
		
		if(count _primaryAmmoArray > 0)then
		{
			private _primaryAmmo = _primaryAmmoArray select 0;
			_itemsArray pushback _primaryAmmo;
		};
		
		if(count _primaryAttachments > 0)then
		{
			private _primarySight = _primaryAttachments select 2;
			_itemsArray pushback _primarySight;
		};
	};

	if !(_uniform == "")then
	{
		private _inventoryItems = uniformItems ExileClientModelBoxVehicle;
		if(count _inventoryItems > 0)then
		{
			{
				_itemsArray pushback _x;
			}forEach _inventoryItems;
		};
	};
	
	if !(_vest == "")then
	{
		private _inventoryItems = vestItems ExileClientModelBoxVehicle;
		if(count _inventoryItems > 0)then
		{
			{
				_itemsArray pushback _x;
			}forEach _inventoryItems;
		};
	};

	if !(_backPack == "")then
	{
		private _inventoryItems = backpackItems ExileClientModelBoxVehicle;
		if(count _inventoryItems > 0)then
		{
			{
				_itemsArray pushback _x;
			}forEach _inventoryItems;
		};
	};

	{
		if !(_x == "")then
		{
			_itemsArray pushback _x;
		};
	}forEach _vgsLoadoutItems;

private _pricingCalculate = 0;

if (vgsLoadoutTabs) then
{
	for "_i" from 0 to (count _itemsArray)- 1 do 
	{
		private _item = (_itemsArray select _i);
		private _itemCost = getNumber(missionConfigFile >> "CfgExileArsenal" >> _item >> "price");
		_pricingCalculate = _pricingCalculate + _itemCost;
	};
};

private _loadoutCost = format ["Loadout Cost: %1", _pricingCalculate];
(_loadoutdisplay displayCtrl 99164) ctrlSetText _loadoutCost;

private _lockerFunds = player getVariable ["ExileLocker",0];
_lockerFunds = _lockerFunds - _pricingCalculate;
private _fundsText = format ["Available Funds: %1 Tabs",_lockerFunds];
(_loadoutdisplay displayCtrl 99162) ctrlSetText _fundsText;

if !(_lockerFunds >= 0) then 
{
	(_loadoutdisplay displayCtrl 99120) ctrlEnable false;
}
else 
{
	(_loadoutdisplay displayCtrl 99120) ctrlEnable true;
	player setVariable ["vgsLoadoutCost", _pricingCalculate, true]
};

true
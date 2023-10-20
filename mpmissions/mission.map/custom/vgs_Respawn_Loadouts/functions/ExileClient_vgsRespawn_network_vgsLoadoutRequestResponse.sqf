/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

params ["_VGSRespawnLoadout"];

ExileClientModelBoxVehicle setUnitLoadout _VGSRespawnLoadout;
[] call vgsLoadouts_fnc_LoadOutPricing;

true
/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

private _VGSRespawnLoadout = getUnitLoadout ExileClientModelBoxVehicle;
['vgsLoadoutSaveRequest', [_VGSRespawnLoadout]] call ExileClient_system_network_send;
/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

if (isServer) exitWith {};

private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	 ['ExileClient_vgsRespawn_network_vgsLoadoutRequestResponse','custom\vgs_Respawn_Loadouts\functions\ExileClient_vgsRespawn_network_vgsLoadoutRequestResponse.sqf']
];

[]execVM "custom\vgs_Respawn_Loadouts\config.sqf";

diag_log format["vgs_RespawnLoadouts_Client PreInit Finished"];
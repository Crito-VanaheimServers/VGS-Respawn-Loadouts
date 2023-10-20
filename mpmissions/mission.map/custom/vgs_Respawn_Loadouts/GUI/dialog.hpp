/*
VGS Respawn Loadouts
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 10/18/2023
*/

class vgsLoadoutGUI
{
    idd = 99102;
    access = 3;
    duration = -1;
    onLoad = "uiNamespace setVariable ['vgsLoadoutGUI', _this select 0];";
    onUnload = "uiNamespace setVariable ['vgsLoadoutGUI', displayNull];";
    
    class Controls
	{
		class RSPLFrameMain: RSPLFrame
		{
			idc = 99103;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.583 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLListboxMain: RSPLListbox
		{
			idc = 99104;
			x = 0.0256245 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {1,1,1,0.05};
		};
		class RSPLTextAmmo: RSPLText
		{
			idc = 99105;
			text = "AMMUNITION";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1.25 * 0.022 * safezoneH;
		};
		class RSPLFrameAmmoTxt: RSPLFrame
		{
			idc = 99106;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLFrameTopLB: RSPLFrame
		{
			idc = 99107;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.253 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLListboxTop: RSPLListbox
		{
			idc = 99108;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {1,1,1,0.05};
		};
		class RSPLFrameSightsTxt: RSPLFrame
		{
			idc = 99109;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLTextAmmoSights: RSPLText
		{
			idc = 99110;
			text = "ACCESSORY OPTICS";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1.25 * 0.022 * safezoneH;
		};
		class RSPLFrameBottomLB: RSPLFrame
		{
			idc = 99111;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.253 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLListboxBottom: RSPLListbox
		{
			idc = 99112;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {1,1,1,0.05};
		};
		class RSPLFrameButtons: RSPLFrame
		{
			idc = 99113;
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLButtonWeapon: RSPLButton
		{
			idc = 99114;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};
			onButtonClick = "ButtonType = 'PrimaryWpn'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonUniform: RSPLButton
		{
			idc = 99115;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};			
			onButtonClick = "ButtonType = 'Uniform'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonVest: RSPLButton
		{
			idc = 99116;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};			
			onButtonClick = "ButtonType = 'Vest'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonBackpack: RSPLButton
		{
			idc = 99117;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};			
			onButtonClick = "ButtonType = 'BackPack'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonNVG: RSPLButton
		{
			idc = 99118;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};			
			onButtonClick = "ButtonType = 'NVG'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonHeadgear: RSPLButton
		{
			idc = 99119;
			x = 0.139062 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,206,209,0.1};
			colorBackgroundActive[] = {0,206,209,1};			
			onButtonClick = "ButtonType = 'HeadGear'; []call vgsLoadouts_fnc_GearLoad;";
		};
		class RSPLButtonSpawn: RSPLButton
		{
			idc = 99120;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {1,0,0,0.2};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0,0,0.5};
			sizeEx = 1 * 0.066;
			text = "SPAWN";
			onButtonClick = "call ExileClient_gui_modelBox_destroy; ExileClientMoonLight setLightBrightness 0.75; closeDialog 0; SelectedSpawn = 1;";
		};
		class RSPLKeepAspectWeapon: RSPLKeepAspect
		{
			idc = 99122;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\Rifle.paa";
		};
		class RSPLKeepAspectUniform: RSPLKeepAspect
		{
			idc = 99123;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\Uniform.paa";
		};
		class RSPLKeepAspectVest: RSPLKeepAspect
		{
			idc = 99124;
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\Vest.paa";
		};
		class RSPLKeepAspectBackPack: RSPLKeepAspect
		{
			idc = 99125;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\Backpack.paa";
		};
		class RSPLKeepAspectHeadgear: RSPLKeepAspect
		{
			idc = 99126;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\NVG.paa";
		};
		class RSPLKeepAspectNVG: RSPLKeepAspect
		{
			idc = 99127;
			x = 0.139062 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			text = "custom\vgs_Respawn_Loadouts\icons\Headgear.paa";
		};
		class RSPLListboxItems: RSPLListbox
		{
			idc = 99150;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {1,1,1,0.05};
		};
		class RSPLListboxInventory: RSPLListbox
		{
			idc = 99151;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {1,1,1,0.05};
		};
		class RSPLFrameInventoryList: RSPLFrame
		{
			idc = 99152;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.231 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLFrameItemList: RSPLFrame
		{
			idc = 99153;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.231 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLTextItems: RSPLText
		{
			idc = 99154;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1.25 * 0.022 * safezoneH;
			text = "ITEMS";
		};
		class RSPLTextInventoryTxt: RSPLText
		{
			idc = 99155;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1.25 * 0.022 * safezoneH;
			text = "ITEMS IN INVENTORY"; 
		};
		class RSPLFrameItemsTxt: RSPLFrame
		{
			idc = 99156;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLFrameInventory: RSPLFrame
		{
			idc = 99157;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RSPLComboDropBox: RSPLCombo
		{
			idc = 99158;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RSPLFrameDropBox: RSPLFrame
		{
			idc = 99159;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,206,209,1.374};
		};
		class RscButton_1606: RSPLButton
		{
			idc = 99160;
			text = "LOAD LOADOUT";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,206,209,0.2};
			colorBackgroundActive[] = {0,206,209,1};
			sizeEx = 1 * 0.066;
			onButtonClick = "[]call vgsLoadouts_fnc_LoadLoadout;";

		};
		class RscButton_1607: RSPLButton
		{
			idc = 99161;
			text = "SAVE LOADOUT";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,206,209,0.2};
			colorBackgroundActive[] = {0,206,209,1};
			sizeEx = 1 * 0.066;
			onButtonClick = "[]call vgsLoadouts_fnc_SaveLoadout;";
		};
	};
};


/* ############################################################## */
/* #			Admin Panel v1.3 by Stoku						# */
/* #					Have fun!								# */
/* ############################################################## */

/* Author and versioning info */
local SCRIPT_VERSION			= "1.3";
local SCRIPT_AUTHOR				= "Stoku";
local LANGUAGE_NAME				= "english";
local LANGUAGE_AUTHOR			= "Stoku";

/* Basic settings */
local CONSOLE_PREFIX			= "[AdminPanel]";	// Console prefix
local BIND_KEY					= 'P';				// Keybind to access panel
local iAdminLevel				= 0;				// Admin level variable, set it with SetAdminLevel from server.nut
local SOUND_ENABLED				= true;				// Enable/disable admin panel sounds

/* Admin level access configuration */
local PANEL_ACCESS				= 1;				// Admin panel access level
local TIME_WEATHER_ACCESS 		= 1;				// Access to Time & Weather settings
local PLAYER_MANAGER_ACCESS 	= 1;				// Player Manager
local VEHICLE_MANAGER_ACCESS 	= 1;				// Vehicle Manager
local GAME_ACCESS				= 1;				// Game settings
local SERVER_ACCESS				= 1;				// Server settings
// Time & Weather
local TIME_WEATHER_TLOCK		= 1;				// Time lock
local TIME_WEATHER_WLOCK		= 1;				// Weather lock
local TIME_WEATHER_TIME			= 1;				// Set time
local TIME_WEATHER_WEATHER		= 1;				// Set weather
// Player Manager
local PLAYER_MANAGER_BAN		= 1;				// Ban player
local PLAYER_MANAGER_BANTYPE_1	= 1;				// Ban nickname
local PLAYER_MANAGER_BANTYPE_2	= 1;				// Ban IP
local PLAYER_MANAGER_BANTYPE_3	= 1;				// Ban LUID
local PLAYER_MANAGER_KICK		= 1;				// Kick player
local PLAYER_MANAGER_KILL		= 1;				// Kill player
local PLAYER_MANAGER_FREEZE		= 1;				// Freeze/unfreeze
local PLAYER_MANAGER_HEAL		= 1;				// Heal player
local PLAYER_MANAGER_GOTO		= 1;				// Go to player
local PLAYER_MANAGER_BRING		= 1;				// Bring player
local PLAYER_MANAGER_ALL		= 1;				// All
local PLAYER_CONSOLE_MODE1		= 1;				// Private message
local PLAYER_CONSOLE_MODE2		= 1;				// Set health
local PLAYER_CONSOLE_MODE3		= 1;				// Set Armor
local PLAYER_CONSOLE_MODE4		= 1;				// Set Skin
local PLAYER_CONSOLE_MODE5		= 1;				// Ban IP
local PLAYER_CONSOLE_MODE6		= 1;				// Unban IP
local PLAYER_CONSOLE_MODE7		= 1;				// Set admin level
// Vehicle manager
local VEHICLE_MANAGER_FIX		= 1;				// Fix vehicle access
local VEHICLE_MANAGER_EXPLODE	= 1;				// Explode vehicle
local VEHICLE_MANAGER_RESPAWN	= 1;				// Respawn
local VEHICLE_MANAGER_REMOVE	= 1;				// Remove
local VEHICLE_MANAGER_TELEPORT	= 1;				// Teleport
local VEHICLE_MANAGER_COLOR		= 1;				// Set color1/2
// Server settings
local SERVER_SETTINGS_SNAME		= 1;				// Server name setting
local SERVER_SETTINGS_MNAME		= 1;				// Map name
local SERVER_SETTINGS_GNAME		= 1; 				// Gamemode name
local SERVER_SETTINGS_MPLAYERS	= 1;				// Max players
local SERVER_SETTINGS_PASSWORD	= 1;				// Server password
local SERVER_SETTINGS_PORT		= 1;				// Server port
// Game settings
local GAME_SETTINGS_SPEED		= 1;				// Set game speed
local GAME_SETTINGS_GRAVITY		= 1;				// Set game gravity
local GAME_SETTINGS_FLYINGC		= 1;				// Toggle flying cars cheat
local GAME_SETTINGS_HANGLINGC	= 1;				// Toggle handling cheat
local GAME_SETTINGS_FRIENDLYF	= 1;				// Toggle friendly fire
local GAME_SETTINGS_SSVBRIDGE	= 1;				// Toggle SSV bridge lock
/* End of level configuration*/


/* Sound schemes */
/* GTAIII Sound Scheme (default) */
local SOUND_MENU				= 152;				// Sound played when panel appears
local SOUND_ACCEPT				= 160;				// Accept button sound
local SOUND_CANCEL				= 57;				// Cancel button sound
local SOUND_ENTER				= 150;				// Open new menu sound
local SOUND_EXIT				= 153;				// Exit button sound
local SOUND_CLICK				= 149;				// Click other buttons eg. + or -*/

/* Modern Sound Scheme */
/*local SOUND_MENU				= 54;				// Sound played when panel appears
local SOUND_ACCEPT				= 158;				// Accept button sound
local SOUND_CANCEL				= 53;				// Cancel button sound
local SOUND_ENTER				= 54;				// Open new menu sound
local SOUND_EXIT				= 53;				// Exit button sound
local SOUND_CLICK				= 158;				// Click other buttons eg. + or -*/

/* Color palette */
paletteColor1 <- Colour( 0, 0, 0 );
paletteColor2 <- Colour( 255, 255, 255 );
paletteColor3 <- Colour( 42, 119, 161 );
paletteColor4 <- Colour( 179, 54, 58 );
paletteColor5 <- Colour( 38, 55, 57 );
	
paletteColor6 <- Colour( 185, 49, 139 );
paletteColor7 <- Colour( 234, 229, 62 );
paletteColor8 <- Colour( 70, 126, 232 );
paletteColor9 <- Colour( 102, 114, 146 );
paletteColor10 <- Colour( 210, 86, 51 );

paletteColor11 <- Colour( 90, 33, 36 );
paletteColor12 <- Colour( 132, 40, 391 );
paletteColor13 <- Colour( 158, 47, 43 );
paletteColor14 <- Colour( 216, 165, 52 );
paletteColor15 <- Colour( 244, 114, 58 );

paletteColor16 <- Colour( 116, 119, 97 );
paletteColor17 <- Colour( 145, 138, 61 );
paletteColor18 <- Colour( 46, 113, 131 );
paletteColor19 <- Colour( 124, 162, 130 );
paletteColor20 <- Colour( 100, 227, 116 );

paletteColor21 <- Colour( 160, 160, 160 );
paletteColor22 <- Colour( 113, 113, 113 );
paletteColor23 <- Colour( 214, 165, 255 );
paletteColor24 <- Colour( 147, 31, 255 );
paletteColor25 <- Colour( 70, 106, 134 );
/* End of color palette */

/* Dont touch it! */
gTitleWindow <- null;
gTitleButton0 <- null;
gTitleButton1 <- null;
gTitleButton2 <- null;
gTitleButton3 <- null;
gTitleButton4 <- null;
gTitleButton5 <- null;

gTimeWeatherWindow <- null;
gTimeWeatherLabel1 <- null;
gTimeWeatherLabel2 <- null;
gTimeWeatherLabel3 <- null;
gTimeWeatherLabel4 <- null;
gTimeWeatherCheckbox1 <- null;
gTimeWeatherCheckbox2 <- null;
gTimeWeatherEditbox1 <- null;
gTimeWeatherEditbox2 <- null;
gTimeWeatherEditbox3 <- null;
gTimeWeatherButton1 <- null;
gTimeWeatherButton2 <- null;
gTimeWeatherButton3 <- null;
gTimeWeatherButton4 <- null;

gPlayerManagerWindow <- null;
gPlayerManagerButton1 <- null;
gPlayerManagerButton2 <- null;
gPlayerManagerButton3 <- null;
gPlayerManagerButton4 <- null;
gPlayerManagerButton5 <- null;
gPlayerManagerButton6 <- null;
gPlayerManagerButton7 <- null;
gPlayerManagerButton8 <- null;
gPlayerManagerButton9 <- null;
gPlayerManagerButton10 <- null;
gPlayerManagerLabel1 <- null;
gPlayerManagerLabel2 <- null;
gPlayerManagerLabel3 <- null;
gPlayerManagerLabel4 <- null;
gPlayerManagerLabel5 <- null;
gPlayerManagerLabel6 <- null;
gPlayerManagerLabel7 <- null;
gPlayerManagerLabel8 <- null;
gPlayerManagerEditbox1 <- null;
gPlayerManagerCheckbox1 <- null;
gPlayerManagerProgressbar1 <- null;
gPlayerManagerProgressbar2 <- null;

gBanSelectionWindow <- null;
gBanSelectionLabel1 <- null;
gBanSelectionLabel2 <- null;
gBanSelectionLabel3 <- null;
gBanSelectionLabel4 <- null;
gBanSelectionCheckbox1 <- null;
gBanSelectionCheckbox2 <- null;
gBanSelectionCheckbox3 <- null;
gBanSelectionButton1 <- null;
gBanSelectionButton2 <- null;

gColorPaletteWindow <- null;
gColorPaletteButton1 <- null;
gColorPaletteButton2 <- null;
gColorPaletteButton3 <- null;
gColorPaletteButton4 <- null;
gColorPaletteButton5 <- null;
gColorPaletteButton6 <- null;
gColorPaletteButton7 <- null;
gColorPaletteButton8 <- null;
gColorPaletteButton9 <- null;
gColorPaletteButton10 <- null;
gColorPaletteButton11 <- null;
gColorPaletteButton12 <- null;
gColorPaletteButton13 <- null;
gColorPaletteButton14 <- null;
gColorPaletteButton15 <- null;
gColorPaletteButton16 <- null;
gColorPaletteButton17 <- null;
gColorPaletteButton18 <- null;
gColorPaletteButton19 <- null;
gColorPaletteButton20 <- null;
gColorPaletteButton21 <- null;
gColorPaletteButton22 <- null;
gColorPaletteButton23 <- null;
gColorPaletteButton24 <- null;
gColorPaletteButton25 <- null;

gVehicleManagerWindow <- null;
gVehicleManagerButton0 <- null;
gVehicleManagerButton1 <- null;
gVehicleManagerButton2 <- null;
gVehicleManagerButton3 <- null;
gVehicleManagerButton4 <- null;
gVehicleManagerButton5 <- null;
gVehicleManagerButton6 <- null;
gVehicleManagerButton7 <- null;
gVehicleManagerButton8 <- null;
gVehicleManagerButton9 <- null;
gVehicleManagerButton10 <- null;
gVehicleManagerButton11 <- null;
gVehicleManagerLabel1 <- null;
gVehicleManagerLabel2 <- null;
gVehicleManagerLabel3 <- null;
gVehicleManagerLabel4 <- null;
gVehicleManagerLabel5 <- null;
gVehicleManagerProgressbar1 <- null;
gVehicleManagerCheckbox1 <- null;
gVehicleManagerCheckbox2 <- null;
gVehicleManagerCheckbox3 <- null;

gServerSettingsWindow <- null;
gServerSettingsLabel1 <- null;
gServerSettingsLabel2 <- null;
gServerSettingsLabel3 <- null;
gServerSettingsLabel4 <- null;
gServerSettingsLabel5 <- null;
gServerSettingsLabel6 <- null;
gServerSettingsEditbox1 <- null;
gServerSettingsEditbox2 <- null;
gServerSettingsEditbox3 <- null;
gServerSettingsEditbox4 <- null;
gServerSettingsEditbox5 <- null;
gServerSettingsEditbox6 <- null;
gServerSettingsButton0 <- null;
gServerSettingsButton1 <- null;

gGameSettingsWindow <- null;
gGameSettingsLabel1 <- null;
gGameSettingsLabel2 <- null;
gGameSettingsLabel3 <- null;
gGameSettingsLabel4 <- null;
gGameSettingsLabel5 <- null;
gGameSettingsLabel6 <- null;
gGameSettingsEditbox1 <- null;
gGameSettingsEditbox2 <- null;
gGameSettingsCheckbox1 <- null;
gGameSettingsCheckbox2 <- null;
gGameSettingsCheckbox3 <- null;
gGameSettingsCheckbox4 <- null;
gGameSettingsButton0 <- null;
gGameSettingsButton1 <- null;
gGameSettingsButton2 <- null;
gGameSettingsButton3 <- null;
gGameSettingsButton4 <- null;
gGameSettingsButton5 <- null;
gGameSettingsButton6 <- null;
gGameSettingsButton7 <- null;

gMessageWindow <- null;
gMessageLabel1 <- null;
gMessageButton0 <- null;
gMessageButton1 <- null;


pLocalPlayer <- FindLocalPlayer();
vLocalPlayerPos <- Vector( 0, 0, 0 );
bSpawnState <- false;
fHealth <- 100;
iPlayerID <- 0;
iMaxPlayers <- 0;
iWeatherID <- 0;
iVehicleID <- 0;
iVehicleCount <- 0;
iColorID <- 1;

function onScriptLoad()
{
	ConsoleMessage( "This server is using AdminPanel v" + SCRIPT_VERSION + " by " + SCRIPT_AUTHOR + "." );
	ConsoleMessage( CONSOLE_PREFIX + " Using language: " + LANGUAGE_NAME + " by " + LANGUAGE_AUTHOR + "." );
	
	CallServerFunc( "adminpanel/server.nut", "VehicleManager_LoadData", pLocalPlayer );
	CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_LoadData", pLocalPlayer );
	CallServerFunc( "adminpanel/server.nut", "GameSettings_LoadData", pLocalPlayer );
	CallServerFunc( "adminpanel/server.nut", "ServerSettings_LoadData", pLocalPlayer );
		
	/* GUI Color schemes */
	/* Oldschool GTAIII Color Scheme (default) */
	local GUI_WINDOW_ALPHA 			= 200;							// Windows alpha channel
	local GUI_ELEMENT_ALPHA 		= 50;							// Elements alpha channel
	local GUI_LABEL_ALPHA	 		= 200;							// Labels alpha channel
	local GUI_TITLE_BAR 			= false;						// Enable/disable window titlebars
	local GUI_TEXT_COLOR 			= Colour( 150, 150, 150 );		// Label/editbox text color
	local GUI_WINDOW_COLOR 			= Colour( 43, 43, 55 );			// Window color
	local GUI_BUTTON_COLOR 			= Colour( 65, 81, 71 );			// Button color
	local GUI_BUTTON_TEXT_COLOR 	= Colour( 216, 157, 0 );		// Button text color
	local GUI_HEALTHBAR_COLOR 		= Colour( 185, 100, 50 );		// Health bar color
	local GUI_ARMORBAR_COLOR 		= Colour( 121, 137, 93 );		// Armor bar color

	/* Modern GTAIII Color Scheme */
	/*local GUI_WINDOW_ALPHA 			= 130;							// Window alpha channel
	local GUI_ELEMENT_ALPHA 		= 20;							// Elements alpha channel
	local GUI_LABEL_ALPHA	 		= 0;							// Labels alpha channel
	local GUI_TITLE_BAR 			= false;						// Enable/disable window titlebars
	local GUI_TEXT_COLOR 			= Colour( 200, 200, 200 );		// Label/editbox text color
	local GUI_WINDOW_COLOR 			= Colour( 0, 0, 0 );			// Window color
	local GUI_BUTTON_COLOR 			= Colour( 0, 0, 0 );			// Button color
	local GUI_BUTTON_TEXT_COLOR 	= Colour( 192, 164, 81 );		// Button text color
	local GUI_HEALTHBAR_COLOR 		= Colour( 192, 164, 81 );		// Health bar color
	local GUI_ARMORBAR_COLOR 		= Colour( 0, 255, 0 );			// Armor bar color*/
	
	/*----------------------------------------------------------*/
	/* Default template by Stoku								*/
	/*----------------------------------------------------------*/
	/* Start of GUI variables used for theming, ADVANCED USERS ONLY! */
	local titleWindow = [ 0, ScreenHeight - 310, 200, 300, "AdminPanel v" + SCRIPT_VERSION ];			// X pos, Y pos, X Size, Y Size, Text
	local twButton0 = [ 5, titleWindow[3] - 60, 190, 25, "Exit" ];										// X pos, Y pos, X Size, Y Size, Text
	local twButton1 = [ 5, 5, 190, 25, "Time & Weather" ];												// X pos, Y pos, X Size, Y Size, Text
	local twButton2 = [ 5, 35, 190, 25, "Player Manager" ];												// X pos, Y pos, X Size, Y Size, Text
	local twButton3 = [ 5, 65, 190, 25, "Vehicle Manager" ];											// X pos, Y pos, X Size, Y Size, Text
	local twButton4 = [ 5, 95, 190, 25, "Server Settings" ];											// X pos, Y pos, X Size, Y Size, Text
	local twButton5 = [ 5, 125, 190, 25, "Game Settings" ];												// X pos, Y pos, X Size, Y Size, Text

	local timeweatherWindow = [ 200, ScreenHeight - 310, 400, 300, "Time & Weather Settings" ];			// X pos, Y pos, X Size, Y Size, Text
	local timeweatherLabel1 = [ 5, 5, 100, 25, "Time Lock:" ];											// X pos, Y pos, X Size, Y Size, Text
	local timeweatherLabel2 = [ 5, 35, 100, 25, "Weather Lock:" ];										// X pos, Y pos, X Size, Y Size, Text
	local timeweatherLabel3 = [ 5, 65, 100, 25, "Set Time:" ];											// X pos, Y pos, X Size, Y Size, Text
	local timeweatherLabel4 = [ 5, 95, 100, 25, "Set Weather:" ];										// X pos, Y pos, X Size, Y Size, Text
	local timeweatherCheckbox1 = [ 140, 10, 10, 10, true ];												// X pos, Y pos, X Size, Y Size, bChecked
	local timeweatherCheckbox2 = [ 140, 40, 10, 10, true ];												// X pos, Y pos, X Size, Y Size, bChecked
	local timeweatherEditbox1 = [ 140, 65, 60, 25 ];													// X pos, Y pos, X Size, Y Size
	local timeweatherEditbox2 = [ 200, 65, 60, 25 ];													// X pos, Y pos, X Size, Y Size
	local timeweatherEditbox3 = [ 140, 95, 35, 25 ];													// X pos, Y pos, X Size, Y Size
	local timeweatherButton1 = [ 175, 95, 25, 25, "+" ];												// X pos, Y pos, X Size, Y Size, Text
	local timeweatherButton2 = [ 200, 95, 25, 25, "-" ];												// X pos, Y pos, X Size, Y Size, Text
	local timeweatherButton3 = [ 5, timeweatherWindow[3] - 60, (timeweatherWindow[2]/2)-10, 25, "Accept" ];							// X pos, Y pos, X Size, Y Size, Text
	local timeweatherButton4 = [ timeweatherWindow[3]-100, timeweatherWindow[3] - 60, (timeweatherWindow[2]/2)-10, 25, "Cancel" ];	// X pos, Y pos, X Size, Y Size, Text

	local playermanagerWindow = [ 200, ScreenHeight - 310, 400, 300, "Player Manager" ];				// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton1 = [ 5, 5, 25, 25, "<" ];													// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton2 = [ playermanagerWindow[2]-30, 5, 25, 25, ">" ];							// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton3 = [ 5, 35, 100, 25, "Kick" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton4 = [ 5, 95, 100, 25, "Kill" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton5 = [ 5, 125, 100, 25, "Freeze" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton6 = [ 5, 155, 100, 25, "Heal" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton7 = [ 5, playermanagerWindow[3] - 60, 390, 25, "Cancel" ];					// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton8 = [ 5, 65, 100, 25, "Ban" ];												// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton9 = [ 110, 35, 100, 25, "Go to" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerButton10 = [ 110, 65, 100, 25, "Bring" ];										// X pos, Y pos, X Size, Y Size, Text
	local playermanagerCheckbox1 = [ 160, 160, 10, 10, false ];											// X pos, Y pos, X Size, Y Size, bChecked
	local playermanagerLabel1 = [ playermanagerWindow[2]/2-70, 8, 100, 25, "Free Slot (0/0)" ];			// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel2 = [ 220, 38, 100, 25, "Health: 0" ];										// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel3 = [ 220, 68, 100, 25, "Armor: 0" ];										// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel4 = [ 215, 95, 100, 25, "Skin: 0" ];										// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel5 = [ 215, 125, 100, 25, "Ping: 0ms" ];										// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel6 = [ 215, 155, 100, 25, "IP:" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel7 = [ 5, playermanagerWindow[3] - 110, 390, 25, "[1/8] Mode: Find player [Press END to change]" ];	// X pos, Y pos, X Size, Y Size, Text
	local playermanagerLabel8 = [ 130, 155, 100, 25, "All" ];											// X pos, Y pos, X Size, Y Size, Text
	local playermanagerEditbox1 = [ 5, playermanagerWindow[3] - 90, 390, 25 ];							// X pos, Y pos, X Size, Y Size
	local playermanagerProgressbar1 = [ 215, 35, 180, 25 ];												// X pos, Y pos, X Size, Y Size
	local playermanagerProgressbar2 = [ 215, 65, 180, 25 ];												// X pos, Y pos, X Size, Y Size
	
	local banselectionWindow = [ (ScreenWidth/2)-150, (ScreenHeight/2), 300, 70, "Select ban type" ];	// X pos, Y pos, X Size, Y Size, Text
	local banselectionLabel1 = [ 20, 5, 100, 25, "Ban nickname" ];										// X pos, Y pos, X Size, Y Size, Text
	local banselectionLabel2 = [ 20, 20, 100, 25, "Ban IP" ];										// X pos, Y pos, X Size, Y Size, Text
	local banselectionLabel3 = [ 20, 35, 100, 25, "Ban LUID" ];										// X pos, Y pos, X Size, Y Size, Text
	local banselectionCheckbox1 = [ 5, 8, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local banselectionCheckbox2 = [ 5, 23, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local banselectionCheckbox3 = [ 5, 38, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local banselectionButton0 = [ (banselectionWindow[2]/2) + 5, banselectionWindow[3] - 10, (banselectionWindow[2]/2)-10, 25, "Cancel" ];							// X pos, Y pos, X Size, Y Size, Text
	local banselectionButton1 = [ 5, banselectionWindow[3] - 10, (banselectionWindow[2]/2)-10, 25, "Add ban" ];							// X pos, Y pos, X Size, Y Size, Text

	local vehiclemanagerWindow = [ 200, ScreenHeight - 310, 400, 300, "Vehicle Manager" ];				// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton0 = [ vehiclemanagerWindow[3]-100, vehiclemanagerWindow[3] - 60, (vehiclemanagerWindow[2]/2)-10, 25, "Cancel" ];	// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton1 = [ 5, vehiclemanagerWindow[3] - 60, (vehiclemanagerWindow[2]/2)-10, 25, "Accept" ];							// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton2 = [ 5, 5, 25, 25, "<" ];												// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton3 = [ vehiclemanagerWindow[2]-30, 5, 25, 25, ">" ];						// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton4 = [ 5, 65, 100, 25, "Fix" ];											// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton5 = [ 5, 35, 100, 25, "Explode" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton6 = [ 5, 95, 100, 25, "Respawn" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton7 = [ 5, 125, 100, 25, "Remove" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton8 = [ 5, 155, 100, 25, "Teleport" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton9 = [ 110, 35, 100, 25, "Color 1" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerButton10 = [ 110, 65, 100, 25, "Color 2" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerLabel1 = [ vehiclemanagerWindow[2]/2-70, 8, 100, 25, "Name (0/0)" ];			// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerLabel2 = [ 220, 38, 100, 25, "Health: 0" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerLabel3 = [ 110, 98, 100, 25, "Locked:" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerLabel4 = [ 110, 128, 100, 25, "Lights:" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerLabel5 = [ 110, 158, 100, 25, "Engine:" ];										// X pos, Y pos, X Size, Y Size, Text
	local vehiclemanagerProgressbar1 = [ 215, 35, 180, 25 ];											// X pos, Y pos, X Size, Y Size
	local vehiclemanagerCheckbox1 = [ 180, 103, 10, 10, false ];											// X pos, Y pos, X Size, Y Size, bChecked
	local vehiclemanagerCheckbox2 = [ 180, 133, 10, 10, false ];											// X pos, Y pos, X Size, Y Size, bChecked
	local vehiclemanagerCheckbox3 = [ 180, 163, 10, 10, false ];										// X pos, Y pos, X Size, Y Size, bChecked

	local serversettingsWindow = [ 200, ScreenHeight - 310, 400, 300, "Server Settings" ];				// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel1 = [ 5, 5, 100, 25, "Server Name:" ];										// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel2 = [ 5, 35, 100, 25, "Map Name:" ];										// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel3 = [ 5, 65, 100, 25, "Gamemode Name:" ];									// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel4 = [ 5, 95, 100, 25, "Max Players:" ];									// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel5 = [ 5, 125, 100, 25, "Password:" ];										// X pos, Y pos, X Size, Y Size, Text
	local serversettingsLabel6 = [ 5, 155, 100, 25, "Port:" ];											// X pos, Y pos, X Size, Y Size, Text
	local serversettingsEditbox1 = [ 150, 5, 240, 25 ];													// X pos, Y pos, X Size, Y Size
	local serversettingsEditbox2 = [ 150, 35, 240, 25 ];												// X pos, Y pos, X Size, Y Size
	local serversettingsEditbox3 = [ 150, 65, 240, 25 ];												// X pos, Y pos, X Size, Y Size
	local serversettingsEditbox4 = [ 150, 95, 50, 25 ];													// X pos, Y pos, X Size, Y Size
	local serversettingsEditbox5 = [ 150, 125, 240, 25 ];												// X pos, Y pos, X Size, Y Size
	local serversettingsEditbox6 = [ 150, 155, 100, 25 ];												// X pos, Y pos, X Size, Y Size
	local serversettingsButton0 = [ serversettingsWindow[3]-100, serversettingsWindow[3] - 60, (serversettingsWindow[2]/2)-10, 25, "Cancel" ];	// X pos, Y pos, X Size, Y Size, Text
	local serversettingsButton1 = [ 5, serversettingsWindow[3] - 60, (serversettingsWindow[2]/2)-10, 25, "Accept" ];							// X pos, Y pos, X Size, Y Size, Text

	local gamesettingsWindow = [ 200, ScreenHeight - 310, 400, 300, "Game Settings" ];					// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel1 = [ 5, 5, 100, 25, "Game Speed:" ];										// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel2 = [ 5, 35, 100, 25, "Game Gravity:" ];										// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel3 = [ 5, 65, 100, 25, "Flying Cars:" ];										// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel4 = [ 5, 95, 100, 25, "Handling Cheat:" ];									// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel5 = [ 5, 125, 100, 25, "Friendly Fire:" ];									// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsLabel6 = [ 5, 155, 100, 25, "SSV Bridge Lock:" ];									// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsEditbox1 = [ 140, 5, 60, 25 ];													// X pos, Y pos, X Size, Y Size
	local gamesettingsEditbox2 = [ 140, 35, 60, 25 ];													// X pos, Y pos, X Size, Y Size
	local gamesettingsCheckbox1 = [ 140, 70, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local gamesettingsCheckbox2 = [ 140, 100, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local gamesettingsCheckbox3 = [ 140, 130, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local gamesettingsCheckbox4 = [ 140, 160, 10, 10, true ];											// X pos, Y pos, X Size, Y Size, bChecked
	local gamesettingsButton0 = [ gamesettingsWindow[3]-100, gamesettingsWindow[3] - 60, (gamesettingsWindow[2]/2)-10, 25, "Cancel" ];	// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton1 = [ 5, gamesettingsWindow[3] - 60, (gamesettingsWindow[2]/2)-10, 25, "Accept" ];							// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton2 = [ 200, 5, 25, 25, "+" ];												// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton3 = [ 225, 5, 25, 25, "-" ];												// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton4 = [ 200, 35, 25, 25, "+" ];												// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton5 = [ 225, 35, 35, 25, "++" ];												// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton6 = [ 300, 35, 25, 25, "-" ];												// X pos, Y pos, X Size, Y Size, Text
	local gamesettingsButton7 = [ 265, 35, 35, 25, "--" ];												// X pos, Y pos, X Size, Y Size, Text

	local messageWindow = [ (ScreenWidth/2)-100, (ScreenHeight/2)-30, 200, 50, "Message" ];				// X pos, Y pos, X Size, Y Size, Text
	local messageWindowLabel1 = [ 5, 5, 190, 25, "Are you sure?" ];										// X pos, Y pos, X Size, Y Size, Text
	local messageWindowButton0 = [ 5, 25, 95, 25, "Yes" ];												// X pos, Y pos, X Size, Y Size, Text
	local messageWindowButton1 = [ 100, 25, 95, 25, "No" ];												// X pos, Y pos, X Size, Y Size, Text
	
	local colorpaletteWindow = [ (ScreenWidth/2)-62.5, (ScreenHeight/2)-150, 125, 125, "Select Color:" ];	// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton1 = [ 0, 0, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton2 = [ 0, 25, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton3 = [ 0, 50, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton4 = [ 0, 75, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton5 = [ 0, 100, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton6 = [ 25, 0, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton7 = [ 25, 25, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton8 = [ 25, 50, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton9 = [ 25, 75, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton10 = [ 25, 100, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton11 = [ 50, 0, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton12 = [ 50, 25, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton13 = [ 50, 50, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton14 = [ 50, 75, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton15 = [ 50, 100, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton16 = [ 75, 0, 25, 25, "" ];												// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton17 = [ 75, 25, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton18 = [ 75, 50, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton19 = [ 75, 75, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton20 = [ 75, 100, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton21 = [ 100, 0, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton22 = [ 100, 25, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton23 = [ 100, 50, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton24 = [ 100, 75, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	local colorpaletteButton25 = [ 100, 100, 25, 25, "" ];											// X pos, Y pos, X Size, Y Size, Text
	/* --- End of theme --- */
	
	// ------------------------------- Title Window
	gTitleWindow = GUIWindow( VectorScreen( titleWindow[0], titleWindow[1] ), ScreenSize( titleWindow[2], titleWindow[3] ), titleWindow[4] );
	
	if ( GUI_WINDOW_COLOR ) gTitleWindow.Colour = GUI_WINDOW_COLOR;
	//gTitleWindow.Transparent = true;
	gTitleWindow.Titlebar = GUI_TITLE_BAR;
	gTitleWindow.Alpha = GUI_WINDOW_ALPHA;
	gTitleWindow.Visible = false;
	
	/* Exit button */
	gTitleButton0 = GUIButton( VectorScreen( twButton0[0], twButton0[1] ), ScreenSize( twButton0[2], twButton0[3] ), twButton0[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton0.Colour = GUI_BUTTON_COLOR;
	gTitleButton0.FontTags = TAG_BOLD;
	gTitleButton0.SetCallbackFunc( Menu1_Handle0 );
	gTitleButton0.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton0.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton0.Flags = FLAG_SHADOW;
	gTitleButton0.Visible = true;
	
	/* Time & Weather button */
	gTitleButton1 = GUIButton( VectorScreen( twButton1[0], twButton1[1] ), ScreenSize( twButton1[2], twButton1[3] ), twButton1[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton1.Colour = GUI_BUTTON_COLOR;
	gTitleButton1.FontTags = TAG_BOLD;
	gTitleButton1.SetCallbackFunc( Menu1_Handle1 );
	gTitleButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton1.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton1.Flags = FLAG_SHADOW;
	gTitleButton1.Visible = false;
	
	/* Player Manager button */
	gTitleButton2 = GUIButton( VectorScreen( twButton2[0], twButton2[1] ), ScreenSize( twButton2[2], twButton2[3] ), twButton2[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton2.Colour = GUI_BUTTON_COLOR;
	gTitleButton2.FontTags = TAG_BOLD;
	gTitleButton2.SetCallbackFunc( Menu1_Handle2 );
	gTitleButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton2.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton2.Flags = FLAG_SHADOW;
	gTitleButton2.Visible = false;
	
	/* Vehicle Manager button */
	gTitleButton3 = GUIButton( VectorScreen( twButton3[0], twButton3[1] ), ScreenSize( twButton3[2], twButton3[3] ), twButton3[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton3.Colour = GUI_BUTTON_COLOR;
	gTitleButton3.FontTags = TAG_BOLD;
	gTitleButton3.SetCallbackFunc( Menu1_Handle3 );
	gTitleButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton3.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton3.Flags = FLAG_SHADOW;
	gTitleButton3.Visible = false;
	
	/* Server settings button */
	gTitleButton4 = GUIButton( VectorScreen( twButton4[0], twButton4[1] ), ScreenSize( twButton4[2], twButton4[3] ), twButton4[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton4.Colour = GUI_BUTTON_COLOR;
	gTitleButton4.FontTags = TAG_BOLD;
	gTitleButton4.SetCallbackFunc( Menu1_Handle4 );
	gTitleButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton4.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton4.Flags = FLAG_SHADOW;
	gTitleButton4.Visible = false;
	
	/* Game Settings button */
	gTitleButton5 = GUIButton( VectorScreen( twButton5[0], twButton5[1] ), ScreenSize( twButton5[2], twButton5[3] ), twButton5[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton5.Colour = GUI_BUTTON_COLOR;
	gTitleButton5.FontTags = TAG_BOLD;
	gTitleButton5.SetCallbackFunc( Menu1_Handle5 );
	gTitleButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton5.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton5.Flags = FLAG_SHADOW;
	gTitleButton5.Visible = false;
		
	AddGUILayer( gTitleWindow );
	gTitleWindow.AddChild( gTitleButton0 );
	gTitleWindow.AddChild( gTitleButton1 );
	gTitleWindow.AddChild( gTitleButton2 );
	gTitleWindow.AddChild( gTitleButton3 );
	gTitleWindow.AddChild( gTitleButton4 );
	gTitleWindow.AddChild( gTitleButton5 );
	
	
	// ------------------------------- Time & Weather Window
	gTimeWeatherWindow = GUIWindow( VectorScreen( timeweatherWindow[0], timeweatherWindow[1] ), ScreenSize( timeweatherWindow[2], timeweatherWindow[3] ), timeweatherWindow[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherWindow.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherWindow.Titlebar = GUI_TITLE_BAR;
	gTimeWeatherWindow.Alpha = GUI_WINDOW_ALPHA;
	gTimeWeatherWindow.Visible = false;
	
	/* Time Lock label */
	gTimeWeatherLabel1 = GUILabel( VectorScreen( timeweatherLabel1[0], timeweatherLabel1[1] ), ScreenSize( timeweatherLabel1[2], timeweatherLabel1[3] ), timeweatherLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel1.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel1.FontTags = TAG_BOLD;
	gTimeWeatherLabel1.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel1.Alpha = GUI_LABEL_ALPHA;
	gTimeWeatherLabel1.Flags = FLAG_SHADOW;
	gTimeWeatherLabel1.Visible = false;
	
	/* Weather Lock label */
	gTimeWeatherLabel2 = GUILabel( VectorScreen( timeweatherLabel2[0], timeweatherLabel2[1] ), ScreenSize( timeweatherLabel2[2], timeweatherLabel2[3] ), timeweatherLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel2.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel2.FontTags = TAG_BOLD;
	gTimeWeatherLabel2.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel2.Alpha = GUI_LABEL_ALPHA;
	gTimeWeatherLabel2.Flags = FLAG_SHADOW;
	gTimeWeatherLabel2.Visible = false;
	
	/* Set Time label */
	gTimeWeatherLabel3 = GUILabel( VectorScreen( timeweatherLabel3[0], timeweatherLabel3[1] ), ScreenSize( timeweatherLabel3[2], timeweatherLabel3[3] ), timeweatherLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel3.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel3.FontTags = TAG_BOLD;
	gTimeWeatherLabel3.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel3.Alpha = GUI_LABEL_ALPHA;
	gTimeWeatherLabel3.Flags = FLAG_SHADOW;
	gTimeWeatherLabel3.Visible = false;
	
	/* Set Weather label */
	gTimeWeatherLabel4 = GUILabel( VectorScreen( timeweatherLabel4[0], timeweatherLabel4[1] ), ScreenSize( timeweatherLabel4[2], timeweatherLabel4[3] ), timeweatherLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel4.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel4.FontTags = TAG_BOLD;
	gTimeWeatherLabel4.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel4.Alpha = GUI_LABEL_ALPHA;
	gTimeWeatherLabel4.Flags = FLAG_SHADOW;
	gTimeWeatherLabel4.Visible = false;
	
	/* Time Lock checkbox */
	gTimeWeatherCheckbox1 = GUICheckbox( VectorScreen( timeweatherCheckbox1[0], timeweatherCheckbox1[1] ), ScreenSize( timeweatherCheckbox1[2], timeweatherCheckbox1[3] ), timeweatherCheckbox1[4] );
	gTimeWeatherCheckbox1.Alpha = 200;
	gTimeWeatherCheckbox1.Visible = false;
	
	/* Weather Lock checkbox */
	gTimeWeatherCheckbox2 = GUICheckbox( VectorScreen( timeweatherCheckbox2[0], timeweatherCheckbox2[1] ), ScreenSize( timeweatherCheckbox2[2], timeweatherCheckbox2[3] ), timeweatherCheckbox1[4] );
	gTimeWeatherCheckbox2.Alpha = 200;
	gTimeWeatherCheckbox2.Visible = false;
	
	/* Hours editbox */
	gTimeWeatherEditbox1 = GUIEditbox( VectorScreen( timeweatherEditbox1[0], timeweatherEditbox1[1] ), ScreenSize( timeweatherEditbox1[2], timeweatherEditbox1[3] ) );
	gTimeWeatherEditbox1.Text = "12";
	gTimeWeatherEditbox1.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherEditbox1.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherEditbox1.Visible = false;
	
	/* Minutes editbox */
	gTimeWeatherEditbox2 = GUIEditbox( VectorScreen( timeweatherEditbox2[0], timeweatherEditbox2[1] ), ScreenSize( timeweatherEditbox2[2], timeweatherEditbox2[3] ) );
	gTimeWeatherEditbox2.Text = "00";
	gTimeWeatherEditbox2.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherEditbox2.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherEditbox2.Visible = false;
	
	/* Weather editbox */
	gTimeWeatherEditbox3 = GUIEditbox( VectorScreen( timeweatherEditbox3[0], timeweatherEditbox3[1] ), ScreenSize( timeweatherEditbox3[2], timeweatherEditbox3[3] ) );
	gTimeWeatherEditbox3.Text = "0";
	gTimeWeatherEditbox3.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherEditbox3.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherEditbox3.Visible = false;
	
	/* + button */
	gTimeWeatherButton1 = GUIButton( VectorScreen( timeweatherButton1[0], timeweatherButton1[1] ), ScreenSize( timeweatherButton1[2], timeweatherButton1[3] ), timeweatherButton1[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton1.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton1.FontTags = TAG_BOLD;
	gTimeWeatherButton1.SetCallbackFunc( Menu2_Handle2 );
	gTimeWeatherButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton1.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton1.Flags = FLAG_SHADOW;
	gTimeWeatherButton1.Visible = false;
	
	/* - button */
	gTimeWeatherButton2 = GUIButton( VectorScreen( timeweatherButton2[0], timeweatherButton2[1] ), ScreenSize( timeweatherButton2[2], timeweatherButton2[3] ), timeweatherButton2[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton2.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton2.FontTags = TAG_BOLD;
	gTimeWeatherButton2.SetCallbackFunc( Menu2_Handle3 );
	gTimeWeatherButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton2.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton2.Flags = FLAG_SHADOW;
	gTimeWeatherButton2.Visible = false;
	
	/* Accept button */
	gTimeWeatherButton3 = GUIButton( VectorScreen( timeweatherButton3[0], timeweatherButton3[1] ), ScreenSize( timeweatherButton3[2], timeweatherButton3[3] ), timeweatherButton3[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton3.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton3.FontTags = TAG_BOLD;
	gTimeWeatherButton3.SetCallbackFunc( Menu2_Handle1 );
	gTimeWeatherButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton3.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton3.Flags = FLAG_SHADOW;
	gTimeWeatherButton3.Visible = false;
	
	/* Cancel button */
	gTimeWeatherButton4 = GUIButton( VectorScreen( timeweatherButton4[0], timeweatherButton4[1] ), ScreenSize( timeweatherButton4[2], timeweatherButton4[3] ), timeweatherButton4[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton4.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton4.FontTags = TAG_BOLD;
	gTimeWeatherButton4.SetCallbackFunc( Menu2_Handle0 );
	gTimeWeatherButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton4.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton4.Flags = FLAG_SHADOW;
	gTimeWeatherButton4.Visible = true;
	
	AddGUILayer( gTimeWeatherWindow );
	gTimeWeatherWindow.AddChild( gTimeWeatherLabel1 );
	gTimeWeatherWindow.AddChild( gTimeWeatherLabel2 );
	gTimeWeatherWindow.AddChild( gTimeWeatherLabel3 );
	gTimeWeatherWindow.AddChild( gTimeWeatherLabel4 );
	gTimeWeatherWindow.AddChild( gTimeWeatherCheckbox1 );
	gTimeWeatherWindow.AddChild( gTimeWeatherCheckbox2 );
	gTimeWeatherWindow.AddChild( gTimeWeatherEditbox1 );
	gTimeWeatherWindow.AddChild( gTimeWeatherEditbox2 );
	gTimeWeatherWindow.AddChild( gTimeWeatherEditbox3 );
	gTimeWeatherWindow.AddChild( gTimeWeatherButton1 );
	gTimeWeatherWindow.AddChild( gTimeWeatherButton2 );
	gTimeWeatherWindow.AddChild( gTimeWeatherButton3 );
	gTimeWeatherWindow.AddChild( gTimeWeatherButton4 );
	
	
	// ------------------------------- Player Manager Window
	gPlayerManagerWindow = GUIWindow( VectorScreen( playermanagerWindow[0], playermanagerWindow[1] ), ScreenSize( playermanagerWindow[2], playermanagerWindow[3] ), playermanagerWindow[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerWindow.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerWindow.Titlebar = GUI_TITLE_BAR;
	gPlayerManagerWindow.Alpha = GUI_WINDOW_ALPHA;
	gPlayerManagerWindow.Visible = false;
	
	/* < button */
	gPlayerManagerButton1 = GUIButton( VectorScreen( playermanagerButton1[0], playermanagerButton1[1] ), ScreenSize( playermanagerButton1[2], playermanagerButton1[3] ), playermanagerButton1[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton1.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton1.FontTags = TAG_BOLD;
	gPlayerManagerButton1.SetCallbackFunc( Menu3_Handle2 );
	gPlayerManagerButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton1.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton1.Flags = FLAG_SHADOW;
	gPlayerManagerButton1.Visible = true;
	
	/* > button */
	gPlayerManagerButton2 = GUIButton( VectorScreen( playermanagerButton2[0], playermanagerButton2[1] ), ScreenSize( playermanagerButton2[2], playermanagerButton2[3] ), playermanagerButton2[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton2.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton2.FontTags = TAG_BOLD;
	gPlayerManagerButton2.SetCallbackFunc( Menu3_Handle3 );
	gPlayerManagerButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton2.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton2.Flags = FLAG_SHADOW;
	gPlayerManagerButton2.Visible = true;
	
	/* Kick button */
	gPlayerManagerButton3 = GUIButton( VectorScreen( playermanagerButton3[0], playermanagerButton3[1] ), ScreenSize( playermanagerButton3[2], playermanagerButton3[3] ), playermanagerButton3[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton3.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton3.FontTags = TAG_BOLD;
	gPlayerManagerButton3.SetCallbackFunc( Menu3_Handle4 );
	gPlayerManagerButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton3.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton3.Flags = FLAG_SHADOW;
	gPlayerManagerButton3.Visible = false;
	
	/* Kill button */
	gPlayerManagerButton4 = GUIButton( VectorScreen( playermanagerButton4[0], playermanagerButton4[1] ), ScreenSize( playermanagerButton4[2], playermanagerButton4[3] ), playermanagerButton4[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton4.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton4.FontTags = TAG_BOLD;
	gPlayerManagerButton4.SetCallbackFunc( Menu3_Handle5 );
	gPlayerManagerButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton4.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton4.Flags = FLAG_SHADOW;
	gPlayerManagerButton4.Visible = false;
	
	/* Freeze button */
	gPlayerManagerButton5 = GUIButton( VectorScreen( playermanagerButton5[0], playermanagerButton5[1] ), ScreenSize( playermanagerButton5[2], playermanagerButton5[3] ), playermanagerButton5[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton5.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton5.FontTags = TAG_BOLD;
	gPlayerManagerButton5.SetCallbackFunc( Menu3_Handle6 );
	gPlayerManagerButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton5.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton5.Flags = FLAG_SHADOW;
	gPlayerManagerButton5.Visible = false;
	
	/* Heal button */
	gPlayerManagerButton6 = GUIButton( VectorScreen( playermanagerButton6[0], playermanagerButton6[1] ), ScreenSize( playermanagerButton6[2], playermanagerButton6[3] ), playermanagerButton6[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton6.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton6.FontTags = TAG_BOLD;
	gPlayerManagerButton6.SetCallbackFunc( Menu3_Handle7 );
	gPlayerManagerButton6.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton6.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton6.Flags = FLAG_SHADOW;
	gPlayerManagerButton6.Visible = false;

	/* Cancel button */
	gPlayerManagerButton7 = GUIButton( VectorScreen( playermanagerButton7[0], playermanagerButton7[1] ), ScreenSize( playermanagerButton7[2], playermanagerButton7[3] ), playermanagerButton7[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton7.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton7.FontTags = TAG_BOLD;
	gPlayerManagerButton7.SetCallbackFunc( Menu3_Handle0 );
	gPlayerManagerButton7.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton7.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton7.Flags = FLAG_SHADOW;
	gPlayerManagerButton7.Visible = true;
	
	/* Ban button */
	gPlayerManagerButton8 = GUIButton( VectorScreen( playermanagerButton8[0], playermanagerButton8[1] ), ScreenSize( playermanagerButton8[2], playermanagerButton8[3] ), playermanagerButton8[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton8.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton8.FontTags = TAG_BOLD;
	gPlayerManagerButton8.SetCallbackFunc( Menu3_Handle8 );
	gPlayerManagerButton8.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton8.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton8.Flags = FLAG_SHADOW;
	gPlayerManagerButton8.Visible = false;
	
	/* Teleport button */
	gPlayerManagerButton9 = GUIButton( VectorScreen( playermanagerButton9[0], playermanagerButton9[1] ), ScreenSize( playermanagerButton9[2], playermanagerButton9[3] ), playermanagerButton9[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton9.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton9.FontTags = TAG_BOLD;
	gPlayerManagerButton9.SetCallbackFunc( Menu3_Handle9 );
	gPlayerManagerButton9.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton9.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton9.Flags = FLAG_SHADOW;
	gPlayerManagerButton9.Visible = false;
	
	/* Bring button */
	gPlayerManagerButton10 = GUIButton( VectorScreen( playermanagerButton10[0], playermanagerButton10[1] ), ScreenSize( playermanagerButton10[2], playermanagerButton10[3] ), playermanagerButton10[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton10.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton10.FontTags = TAG_BOLD;
	gPlayerManagerButton10.SetCallbackFunc( Menu3_Handle10 );
	gPlayerManagerButton10.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton10.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton10.Flags = FLAG_SHADOW;
	gPlayerManagerButton10.Visible = false;

	/* Nickname label */
	gPlayerManagerLabel1 = GUILabel( VectorScreen( playermanagerLabel1[0], playermanagerLabel1[1] ), ScreenSize( playermanagerLabel1[2], playermanagerLabel1[3] ), playermanagerLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel1.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel1.FontTags = TAG_BOLD;
	gPlayerManagerLabel1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerLabel1.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel1.Flags = FLAG_SHADOW;
	gPlayerManagerLabel1.Visible = true;
	
	/* Health label */
	gPlayerManagerLabel2 = GUILabel( VectorScreen( playermanagerLabel2[0], playermanagerLabel2[1] ), ScreenSize( playermanagerLabel2[2], playermanagerLabel2[3] ), playermanagerLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel2.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel2.FontTags = TAG_BOLD;
	gPlayerManagerLabel2.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel2.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel2.Flags = FLAG_SHADOW;
	gPlayerManagerLabel2.Visible = false;
	
	/* Armor label */
	gPlayerManagerLabel3 = GUILabel( VectorScreen( playermanagerLabel3[0], playermanagerLabel3[1] ), ScreenSize( playermanagerLabel3[2], playermanagerLabel3[3] ), playermanagerLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel3.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel3.FontTags = TAG_BOLD;
	gPlayerManagerLabel3.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel3.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel3.Flags = FLAG_SHADOW;
	gPlayerManagerLabel3.Visible = false;
	
	/* Skin label */
	gPlayerManagerLabel4 = GUILabel( VectorScreen( playermanagerLabel4[0], playermanagerLabel4[1] ), ScreenSize( playermanagerLabel4[2], playermanagerLabel4[3] ), playermanagerLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel4.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel4.FontTags = TAG_BOLD;
	gPlayerManagerLabel4.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel4.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel4.Flags = FLAG_SHADOW;
	gPlayerManagerLabel4.Visible = false;
	
	/* Ping label */
	gPlayerManagerLabel5 = GUILabel( VectorScreen( playermanagerLabel5[0], playermanagerLabel5[1] ), ScreenSize( playermanagerLabel5[2], playermanagerLabel5[3] ), playermanagerLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel5.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel5.FontTags = TAG_BOLD;
	gPlayerManagerLabel5.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel5.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel5.Flags = FLAG_SHADOW;
	gPlayerManagerLabel5.Visible = false;
	
	/* IP label */
	gPlayerManagerLabel6 = GUILabel( VectorScreen( playermanagerLabel6[0], playermanagerLabel6[1] ), ScreenSize( playermanagerLabel6[2], playermanagerLabel6[3] ), playermanagerLabel6[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel6.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel6.FontTags = TAG_BOLD;
	gPlayerManagerLabel6.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel6.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel6.Flags = FLAG_SHADOW;
	gPlayerManagerLabel6.Visible = false;
	
	/* Mode label */
	gPlayerManagerLabel7 = GUILabel( VectorScreen( playermanagerLabel7[0], playermanagerLabel7[1] ), ScreenSize( playermanagerLabel7[2], playermanagerLabel7[3] ), playermanagerLabel7[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel7.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel7.FontTags = TAG_BOLD;
	gPlayerManagerLabel7.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel7.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel7.Flags = FLAG_SHADOW;
	gPlayerManagerLabel7.Visible = true;
	
	/* All label */
	gPlayerManagerLabel8 = GUILabel( VectorScreen( playermanagerLabel8[0], playermanagerLabel8[1] ), ScreenSize( playermanagerLabel8[2], playermanagerLabel8[3] ), playermanagerLabel8[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel8.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel8.FontTags = TAG_BOLD;
	gPlayerManagerLabel8.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel8.Alpha = GUI_LABEL_ALPHA;
	gPlayerManagerLabel8.Flags = FLAG_SHADOW;
	gPlayerManagerLabel8.Visible = false;
	
	/* All checkbox */
	gPlayerManagerCheckbox1 = GUICheckbox( VectorScreen( playermanagerCheckbox1[0], playermanagerCheckbox1[1] ), ScreenSize( playermanagerCheckbox1[2], playermanagerCheckbox1[3] ), playermanagerCheckbox1[4] );
	gPlayerManagerCheckbox1.Alpha = 200;
	gPlayerManagerCheckbox1.Visible = false;
	
	/* Console editbox */
	gPlayerManagerEditbox1 = GUIEditbox( VectorScreen( playermanagerEditbox1[0], playermanagerEditbox1[1] ), ScreenSize( playermanagerEditbox1[2], playermanagerEditbox1[3] ) );
	gPlayerManagerEditbox1.Text = "";
	gPlayerManagerEditbox1.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerEditbox1.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerEditbox1.Visible = true;
	gPlayerManagerEditbox1.Active = true;
	
	/* Player health progressbar */
	gPlayerManagerProgressbar1 = GUIProgressBar( VectorScreen( playermanagerProgressbar1[0], playermanagerProgressbar1[1] ), ScreenSize( playermanagerProgressbar1[2], playermanagerProgressbar1[3] ) );
	gPlayerManagerProgressbar1.MaxValue = 100;
	gPlayerManagerProgressbar1.Value = 0;
	gPlayerManagerProgressbar1.StartColour = GUI_HEALTHBAR_COLOR;
	gPlayerManagerProgressbar1.EndColour = GUI_HEALTHBAR_COLOR;
	gPlayerManagerProgressbar1.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerProgressbar1.Visible = true;
	
	/* Player armor progressbar */
	gPlayerManagerProgressbar2 = GUIProgressBar( VectorScreen( playermanagerProgressbar2[0], playermanagerProgressbar2[1] ), ScreenSize( playermanagerProgressbar2[2], playermanagerProgressbar2[3] ) );
	gPlayerManagerProgressbar2.MaxValue = 100;
	gPlayerManagerProgressbar2.Value = 0;
	gPlayerManagerProgressbar2.StartColour = GUI_ARMORBAR_COLOR;
	gPlayerManagerProgressbar2.EndColour = GUI_ARMORBAR_COLOR;
	gPlayerManagerProgressbar2.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerProgressbar2.Visible = true;
	
	
	AddGUILayer( gPlayerManagerWindow );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton2 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton3 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton4 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton5 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton6 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton7 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton8 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton9 );
	gPlayerManagerWindow.AddChild( gPlayerManagerButton10 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel2 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel3 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel4 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel5 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel6 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel7 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel8 );
	gPlayerManagerWindow.AddChild( gPlayerManagerCheckbox1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerEditbox1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerProgressbar1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerProgressbar2 );
	
	
	// ------------------------------- Ban Type Selection Window
	gBanSelectionWindow = GUIWindow( VectorScreen( banselectionWindow[0], banselectionWindow[1] ), ScreenSize( banselectionWindow[2], banselectionWindow[3] ), banselectionWindow[4] );
	if ( GUI_WINDOW_COLOR ) gBanSelectionWindow.Colour = GUI_WINDOW_COLOR;
	gBanSelectionWindow.Titlebar = GUI_TITLE_BAR;
	gBanSelectionWindow.Alpha = 255;
	gBanSelectionWindow.Visible = false;
	
	/* Cancel button */
	gBanSelectionButton1 = GUIButton( VectorScreen( banselectionButton0[0], banselectionButton0[1] ), ScreenSize( banselectionButton0[2], banselectionButton0[3] ), banselectionButton0[4] );
	if ( GUI_BUTTON_COLOR ) gBanSelectionButton1.Colour = GUI_BUTTON_COLOR;
	gBanSelectionButton1.FontTags = TAG_BOLD;
	gBanSelectionButton1.SetCallbackFunc( Menu9_Handle0 );
	gBanSelectionButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gBanSelectionButton1.Alpha = GUI_ELEMENT_ALPHA;
	gBanSelectionButton1.Flags = FLAG_SHADOW;
	gBanSelectionButton1.Visible = true;
	
	/* Add ban button */
	gBanSelectionButton2 = GUIButton( VectorScreen( banselectionButton1[0], banselectionButton1[1] ), ScreenSize( banselectionButton1[2], banselectionButton1[3] ), banselectionButton1[4] );
	if ( GUI_BUTTON_COLOR ) gBanSelectionButton2.Colour = GUI_BUTTON_COLOR;
	gBanSelectionButton2.FontTags = TAG_BOLD;
	gBanSelectionButton2.SetCallbackFunc( Menu9_Handle1 );
	gBanSelectionButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gBanSelectionButton2.Alpha = GUI_ELEMENT_ALPHA;
	gBanSelectionButton2.Flags = FLAG_SHADOW;
	gBanSelectionButton2.Visible = false;
	
	/* Ban Name label */
	gBanSelectionLabel1 = GUILabel( VectorScreen( banselectionLabel1[0], banselectionLabel1[1] ), ScreenSize( banselectionLabel1[2], banselectionLabel1[3] ), banselectionLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gBanSelectionLabel1.Colour = GUI_WINDOW_COLOR;
	gBanSelectionLabel1.FontTags = TAG_BOLD;
	gBanSelectionLabel1.TextColour = GUI_TEXT_COLOR;
	gBanSelectionLabel1.Alpha = GUI_LABEL_ALPHA;
	gBanSelectionLabel1.Flags = FLAG_SHADOW;
	gBanSelectionLabel1.Visible = false;
	
	/* Ban IP label */
	gBanSelectionLabel2 = GUILabel( VectorScreen( banselectionLabel2[0], banselectionLabel2[1] ), ScreenSize( banselectionLabel2[2], banselectionLabel2[3] ), banselectionLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gBanSelectionLabel2.Colour = GUI_WINDOW_COLOR;
	gBanSelectionLabel2.FontTags = TAG_BOLD;
	gBanSelectionLabel2.TextColour = GUI_TEXT_COLOR;
	gBanSelectionLabel2.Alpha = GUI_LABEL_ALPHA;
	gBanSelectionLabel2.Flags = FLAG_SHADOW;
	gBanSelectionLabel2.Visible = false;
	
	/* Ban LUID label */
	gBanSelectionLabel3 = GUILabel( VectorScreen( banselectionLabel3[0], banselectionLabel3[1] ), ScreenSize( banselectionLabel3[2], banselectionLabel3[3] ), banselectionLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gBanSelectionLabel3.Colour = GUI_WINDOW_COLOR;
	gBanSelectionLabel3.FontTags = TAG_BOLD;
	gBanSelectionLabel3.TextColour = GUI_TEXT_COLOR;
	gBanSelectionLabel3.Alpha = GUI_LABEL_ALPHA;
	gBanSelectionLabel3.Flags = FLAG_SHADOW;
	gBanSelectionLabel3.Visible = false;
	
	/* Ban name checkbox */
	gBanSelectionCheckbox1 = GUICheckbox( VectorScreen( banselectionCheckbox1[0], banselectionCheckbox1[1] ), ScreenSize( banselectionCheckbox1[2], banselectionCheckbox1[3] ), banselectionCheckbox1[4] );
	gBanSelectionCheckbox1.Alpha = 200;
	gBanSelectionCheckbox1.Visible = false;
	
	/* Ban ip checkbox */
	gBanSelectionCheckbox2 = GUICheckbox( VectorScreen( banselectionCheckbox2[0], banselectionCheckbox2[1] ), ScreenSize( banselectionCheckbox2[2], banselectionCheckbox2[3] ), banselectionCheckbox2[4] );
	gBanSelectionCheckbox2.Alpha = 200;
	gBanSelectionCheckbox2.Visible = false;
	
	/* Ban luid checkbox */
	gBanSelectionCheckbox3 = GUICheckbox( VectorScreen( banselectionCheckbox3[0], banselectionCheckbox3[1] ), ScreenSize( banselectionCheckbox3[2], banselectionCheckbox3[3] ), banselectionCheckbox3[4] );
	gBanSelectionCheckbox3.Alpha = 200;
	gBanSelectionCheckbox3.Visible = false;
	
	AddGUILayer( gBanSelectionWindow );
	gBanSelectionWindow.AddChild( gBanSelectionButton1 );
	gBanSelectionWindow.AddChild( gBanSelectionButton2 );
	gBanSelectionWindow.AddChild( gBanSelectionLabel1 );
	gBanSelectionWindow.AddChild( gBanSelectionLabel2 );
	gBanSelectionWindow.AddChild( gBanSelectionLabel3 );
	gBanSelectionWindow.AddChild( gBanSelectionCheckbox1 );
	gBanSelectionWindow.AddChild( gBanSelectionCheckbox2 );
	gBanSelectionWindow.AddChild( gBanSelectionCheckbox3 );
	
	
	
	// ------------------------------- Vehicle Manager Window
	gVehicleManagerWindow = GUIWindow( VectorScreen( vehiclemanagerWindow[0], vehiclemanagerWindow[1] ), ScreenSize( vehiclemanagerWindow[2], vehiclemanagerWindow[3] ), vehiclemanagerWindow[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerWindow.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerWindow.Titlebar = GUI_TITLE_BAR;
	gVehicleManagerWindow.Alpha = GUI_WINDOW_ALPHA;
	gVehicleManagerWindow.Visible = false;
	
	/* Cancel button */
	gVehicleManagerButton0 = GUIButton( VectorScreen( vehiclemanagerButton0[0], vehiclemanagerButton0[1] ), ScreenSize( vehiclemanagerButton0[2], vehiclemanagerButton0[3] ), vehiclemanagerButton0[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton0.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton0.FontTags = TAG_BOLD;
	gVehicleManagerButton0.SetCallbackFunc( Menu6_Handle0 );
	gVehicleManagerButton0.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton0.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton0.Flags = FLAG_SHADOW;
	gVehicleManagerButton0.Visible = true;
	
	/* Accept button */
	gVehicleManagerButton1 = GUIButton( VectorScreen( vehiclemanagerButton1[0], vehiclemanagerButton1[1] ), ScreenSize( vehiclemanagerButton1[2], vehiclemanagerButton1[3] ), vehiclemanagerButton1[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton1.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton1.FontTags = TAG_BOLD;
	gVehicleManagerButton1.SetCallbackFunc( Menu6_Handle1 );
	gVehicleManagerButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton1.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton1.Flags = FLAG_SHADOW;
	gVehicleManagerButton1.Visible = true;
	
	/* < button */
	gVehicleManagerButton2 = GUIButton( VectorScreen( vehiclemanagerButton2[0], vehiclemanagerButton2[1] ), ScreenSize( vehiclemanagerButton2[2], vehiclemanagerButton2[3] ), vehiclemanagerButton2[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton2.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton2.FontTags = TAG_BOLD;
	gVehicleManagerButton2.SetCallbackFunc( Menu6_Handle2 );
	gVehicleManagerButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton2.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton2.Flags = FLAG_SHADOW;
	gVehicleManagerButton2.Visible = true;
	
	/* > button */
	gVehicleManagerButton3 = GUIButton( VectorScreen( vehiclemanagerButton3[0], vehiclemanagerButton3[1] ), ScreenSize( vehiclemanagerButton3[2], vehiclemanagerButton3[3] ), vehiclemanagerButton3[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton3.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton3.FontTags = TAG_BOLD;
	gVehicleManagerButton3.SetCallbackFunc( Menu6_Handle3 );
	gVehicleManagerButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton3.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton3.Flags = FLAG_SHADOW;
	gVehicleManagerButton3.Visible = true;
	
	/* Fix button */
	gVehicleManagerButton4 = GUIButton( VectorScreen( vehiclemanagerButton4[0], vehiclemanagerButton4[1] ), ScreenSize( vehiclemanagerButton4[2], vehiclemanagerButton4[3] ), vehiclemanagerButton4[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton4.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton4.FontTags = TAG_BOLD;
	gVehicleManagerButton4.SetCallbackFunc( Menu6_Handle4 );
	gVehicleManagerButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton4.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton4.Flags = FLAG_SHADOW;
	gVehicleManagerButton4.Visible = false;
	
	/* Explode button */
	gVehicleManagerButton5 = GUIButton( VectorScreen( vehiclemanagerButton5[0], vehiclemanagerButton5[1] ), ScreenSize( vehiclemanagerButton5[2], vehiclemanagerButton5[3] ), vehiclemanagerButton5[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton5.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton5.FontTags = TAG_BOLD;
	gVehicleManagerButton5.SetCallbackFunc( Menu6_Handle5 );
	gVehicleManagerButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton5.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton5.Flags = FLAG_SHADOW;
	gVehicleManagerButton5.Visible = false;
	
	/* Respawn button */
	gVehicleManagerButton6 = GUIButton( VectorScreen( vehiclemanagerButton6[0], vehiclemanagerButton6[1] ), ScreenSize( vehiclemanagerButton6[2], vehiclemanagerButton6[3] ), vehiclemanagerButton6[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton6.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton6.FontTags = TAG_BOLD;
	gVehicleManagerButton6.SetCallbackFunc( Menu6_Handle6 );
	gVehicleManagerButton6.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton6.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton6.Flags = FLAG_SHADOW;
	gVehicleManagerButton6.Visible = false;

	/* Remove button */
	gVehicleManagerButton7 = GUIButton( VectorScreen( vehiclemanagerButton7[0], vehiclemanagerButton7[1] ), ScreenSize( vehiclemanagerButton7[2], vehiclemanagerButton7[3] ), vehiclemanagerButton7[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton7.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton7.FontTags = TAG_BOLD;
	gVehicleManagerButton7.SetCallbackFunc( Menu6_Handle7 );
	gVehicleManagerButton7.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton7.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton7.Flags = FLAG_SHADOW;
	gVehicleManagerButton7.Visible = false;
	
	/* Teleport button */
	gVehicleManagerButton8 = GUIButton( VectorScreen( vehiclemanagerButton8[0], vehiclemanagerButton8[1] ), ScreenSize( vehiclemanagerButton8[2], vehiclemanagerButton8[3] ), vehiclemanagerButton8[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton8.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton8.FontTags = TAG_BOLD;
	gVehicleManagerButton8.SetCallbackFunc( Menu6_Handle8 );
	gVehicleManagerButton8.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton8.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton8.Flags = FLAG_SHADOW;
	gVehicleManagerButton8.Visible = false;
	
	/* Color1 button */
	gVehicleManagerButton9 = GUIButton( VectorScreen( vehiclemanagerButton9[0], vehiclemanagerButton9[1] ), ScreenSize( vehiclemanagerButton9[2], vehiclemanagerButton9[3] ), vehiclemanagerButton9[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton9.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton9.FontTags = TAG_BOLD;
	gVehicleManagerButton9.SetCallbackFunc( Menu6_Handle9 );
	gVehicleManagerButton9.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton9.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton9.Flags = FLAG_SHADOW;
	gVehicleManagerButton9.Visible = false;
	
	/* Color2 button */
	gVehicleManagerButton10 = GUIButton( VectorScreen( vehiclemanagerButton10[0], vehiclemanagerButton10[1] ), ScreenSize( vehiclemanagerButton10[2], vehiclemanagerButton10[3] ), vehiclemanagerButton10[4] );
	if ( GUI_BUTTON_COLOR ) gVehicleManagerButton10.Colour = GUI_BUTTON_COLOR;
	gVehicleManagerButton10.FontTags = TAG_BOLD;
	gVehicleManagerButton10.SetCallbackFunc( Menu6_Handle10 );
	gVehicleManagerButton10.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerButton10.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerButton10.Flags = FLAG_SHADOW;
	gVehicleManagerButton10.Visible = false;
	
	/* Name label */
	gVehicleManagerLabel1 = GUILabel( VectorScreen( vehiclemanagerLabel1[0], vehiclemanagerLabel1[1] ), ScreenSize( vehiclemanagerLabel1[2], vehiclemanagerLabel1[3] ), vehiclemanagerLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerLabel1.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerLabel1.FontTags = TAG_BOLD;
	gVehicleManagerLabel1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gVehicleManagerLabel1.Alpha = GUI_LABEL_ALPHA;
	gVehicleManagerLabel1.Flags = FLAG_SHADOW;
	gVehicleManagerLabel1.Visible = true;
	
	/* Health label */
	gVehicleManagerLabel2 = GUILabel( VectorScreen( vehiclemanagerLabel2[0], vehiclemanagerLabel2[1] ), ScreenSize( vehiclemanagerLabel2[2], vehiclemanagerLabel2[3] ), vehiclemanagerLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerLabel2.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerLabel2.FontTags = TAG_BOLD;
	gVehicleManagerLabel2.TextColour = GUI_TEXT_COLOR;
	gVehicleManagerLabel2.Alpha = GUI_LABEL_ALPHA;
	gVehicleManagerLabel2.Flags = FLAG_SHADOW;
	gVehicleManagerLabel2.Visible = true;
	
	/* Locked label */
	gVehicleManagerLabel3 = GUILabel( VectorScreen( vehiclemanagerLabel3[0], vehiclemanagerLabel3[1] ), ScreenSize( vehiclemanagerLabel3[2], vehiclemanagerLabel3[3] ), vehiclemanagerLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerLabel3.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerLabel3.FontTags = TAG_BOLD;
	gVehicleManagerLabel3.TextColour = GUI_TEXT_COLOR;
	gVehicleManagerLabel3.Alpha = GUI_LABEL_ALPHA;
	gVehicleManagerLabel3.Flags = FLAG_SHADOW;
	gVehicleManagerLabel3.Visible = true;
	
	/* Lights label */
	gVehicleManagerLabel4 = GUILabel( VectorScreen( vehiclemanagerLabel4[0], vehiclemanagerLabel4[1] ), ScreenSize( vehiclemanagerLabel4[2], vehiclemanagerLabel4[3] ), vehiclemanagerLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerLabel4.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerLabel4.FontTags = TAG_BOLD;
	gVehicleManagerLabel4.TextColour = GUI_TEXT_COLOR;
	gVehicleManagerLabel4.Alpha = GUI_LABEL_ALPHA;
	gVehicleManagerLabel4.Flags = FLAG_SHADOW;
	gVehicleManagerLabel4.Visible = true;
	
	/* Engine label */
	gVehicleManagerLabel5 = GUILabel( VectorScreen( vehiclemanagerLabel5[0], vehiclemanagerLabel5[1] ), ScreenSize( vehiclemanagerLabel5[2], vehiclemanagerLabel5[3] ), vehiclemanagerLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gVehicleManagerLabel5.Colour = GUI_WINDOW_COLOR;
	gVehicleManagerLabel5.FontTags = TAG_BOLD;
	gVehicleManagerLabel5.TextColour = GUI_TEXT_COLOR;
	gVehicleManagerLabel5.Alpha = GUI_LABEL_ALPHA;
	gVehicleManagerLabel5.Flags = FLAG_SHADOW;
	gVehicleManagerLabel5.Visible = true;
	
	
	/* Vehicle health progressbar */
	gVehicleManagerProgressbar1 = GUIProgressBar( VectorScreen( vehiclemanagerProgressbar1[0], vehiclemanagerProgressbar1[1] ), ScreenSize( vehiclemanagerProgressbar1[2], vehiclemanagerProgressbar1[3] ) );
	gVehicleManagerProgressbar1.MaxValue = 1000;
	gVehicleManagerProgressbar1.Value = 0;
	gVehicleManagerProgressbar1.StartColour = GUI_HEALTHBAR_COLOR;
	gVehicleManagerProgressbar1.EndColour = GUI_HEALTHBAR_COLOR;
	gVehicleManagerProgressbar1.Alpha = GUI_ELEMENT_ALPHA;
	gVehicleManagerProgressbar1.Visible = true;	
	
	/* Locked checkbox */
	gVehicleManagerCheckbox1 = GUICheckbox( VectorScreen( vehiclemanagerCheckbox1[0], vehiclemanagerCheckbox1[1] ), ScreenSize( vehiclemanagerCheckbox1[2], vehiclemanagerCheckbox1[3] ), vehiclemanagerCheckbox1[4] );
	gVehicleManagerCheckbox1.Alpha = 200;
	gVehicleManagerCheckbox1.Visible = true;
	
	/* Lights checkbox */
	gVehicleManagerCheckbox2 = GUICheckbox( VectorScreen( vehiclemanagerCheckbox2[0], vehiclemanagerCheckbox2[1] ), ScreenSize( vehiclemanagerCheckbox2[2], vehiclemanagerCheckbox2[3] ), vehiclemanagerCheckbox2[4] );
	gVehicleManagerCheckbox2.Alpha = 200;
	gVehicleManagerCheckbox2.Visible = true;
	
	/* Engine checkbox */
	gVehicleManagerCheckbox3 = GUICheckbox( VectorScreen( vehiclemanagerCheckbox3[0], vehiclemanagerCheckbox3[1] ), ScreenSize( vehiclemanagerCheckbox3[2], vehiclemanagerCheckbox3[3] ), vehiclemanagerCheckbox3[4] );
	gVehicleManagerCheckbox3.Alpha = 200;
	gVehicleManagerCheckbox3.Visible = true;
	
	AddGUILayer( gVehicleManagerWindow );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton0 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton1 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton2 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton3 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton4 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton5 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton6 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton7 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton8 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton9 );
	gVehicleManagerWindow.AddChild( gVehicleManagerButton10 );
	gVehicleManagerWindow.AddChild( gVehicleManagerLabel1 );
	gVehicleManagerWindow.AddChild( gVehicleManagerLabel2 );
	gVehicleManagerWindow.AddChild( gVehicleManagerLabel3 );
	gVehicleManagerWindow.AddChild( gVehicleManagerLabel4 );
	gVehicleManagerWindow.AddChild( gVehicleManagerLabel5 );
	gVehicleManagerWindow.AddChild( gVehicleManagerProgressbar1 );
	gVehicleManagerWindow.AddChild( gVehicleManagerCheckbox1 );
	gVehicleManagerWindow.AddChild( gVehicleManagerCheckbox2 );
	gVehicleManagerWindow.AddChild( gVehicleManagerCheckbox3 );
	
	
	// ------------------------------- Server Settings Window
	gServerSettingsWindow = GUIWindow( VectorScreen( serversettingsWindow[0], serversettingsWindow[1] ), ScreenSize( serversettingsWindow[2], serversettingsWindow[3] ), serversettingsWindow[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsWindow.Colour = GUI_WINDOW_COLOR;
	gServerSettingsWindow.Titlebar = GUI_TITLE_BAR;
	gServerSettingsWindow.Alpha = GUI_WINDOW_ALPHA;
	gServerSettingsWindow.Visible = false;
	
	/* Server name label */
	gServerSettingsLabel1 = GUILabel( VectorScreen( serversettingsLabel1[0], serversettingsLabel1[1] ), ScreenSize( serversettingsLabel1[2], serversettingsLabel1[3] ), serversettingsLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel1.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel1.FontTags = TAG_BOLD;
	gServerSettingsLabel1.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel1.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel1.Flags = FLAG_SHADOW;
	gServerSettingsLabel1.Visible = false;
	
	/* Map name label */
	gServerSettingsLabel2 = GUILabel( VectorScreen( serversettingsLabel2[0], serversettingsLabel2[1] ), ScreenSize( serversettingsLabel2[2], serversettingsLabel2[3] ), serversettingsLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel2.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel2.FontTags = TAG_BOLD;
	gServerSettingsLabel2.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel2.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel2.Flags = FLAG_SHADOW;
	gServerSettingsLabel2.Visible = false;
	
	/* Gamemode name label */
	gServerSettingsLabel3 = GUILabel( VectorScreen( serversettingsLabel3[0], serversettingsLabel3[1] ), ScreenSize( serversettingsLabel3[2], serversettingsLabel3[3] ), serversettingsLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel3.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel3.FontTags = TAG_BOLD;
	gServerSettingsLabel3.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel3.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel3.Flags = FLAG_SHADOW;
	gServerSettingsLabel3.Visible = false;
	
	/* Max players label */
	gServerSettingsLabel4 = GUILabel( VectorScreen( serversettingsLabel4[0], serversettingsLabel4[1] ), ScreenSize( serversettingsLabel4[2], serversettingsLabel4[3] ), serversettingsLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel4.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel4.FontTags = TAG_BOLD;
	gServerSettingsLabel4.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel4.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel4.Flags = FLAG_SHADOW;
	gServerSettingsLabel4.Visible = false;
	
	/* Password label */
	gServerSettingsLabel5 = GUILabel( VectorScreen( serversettingsLabel5[0], serversettingsLabel5[1] ), ScreenSize( serversettingsLabel5[2], serversettingsLabel5[3] ), serversettingsLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel5.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel5.FontTags = TAG_BOLD;
	gServerSettingsLabel5.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel5.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel5.Flags = FLAG_SHADOW;
	gServerSettingsLabel5.Visible = false;
	
	/* Port label */
	gServerSettingsLabel6 = GUILabel( VectorScreen( serversettingsLabel6[0], serversettingsLabel6[1] ), ScreenSize( serversettingsLabel6[2], serversettingsLabel6[3] ), serversettingsLabel6[4] );
	if ( GUI_WINDOW_COLOR ) gServerSettingsLabel6.Colour = GUI_WINDOW_COLOR;
	gServerSettingsLabel6.FontTags = TAG_BOLD;
	gServerSettingsLabel6.TextColour = GUI_TEXT_COLOR;
	gServerSettingsLabel6.Alpha = GUI_LABEL_ALPHA;
	gServerSettingsLabel6.Flags = FLAG_SHADOW;
	gServerSettingsLabel6.Visible = false;
	
	/* Server name editbox */
	gServerSettingsEditbox1 = GUIEditbox( VectorScreen( serversettingsEditbox1[0], serversettingsEditbox1[1] ), ScreenSize( serversettingsEditbox1[2], serversettingsEditbox1[3] ) );
	gServerSettingsEditbox1.Text = "Liberty Unleashed Server";
	gServerSettingsEditbox1.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox1.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox1.Visible = false;
	
	/* Map name editbox */
	gServerSettingsEditbox2 = GUIEditbox( VectorScreen( serversettingsEditbox2[0], serversettingsEditbox2[1] ), ScreenSize( serversettingsEditbox2[2], serversettingsEditbox2[3] ) );
	gServerSettingsEditbox2.Text = "Liberty City";
	gServerSettingsEditbox2.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox2.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox2.Visible = false;
	
	/* Gamemode name editbox */
	gServerSettingsEditbox3 = GUIEditbox( VectorScreen( serversettingsEditbox3[0], serversettingsEditbox3[1] ), ScreenSize( serversettingsEditbox3[2], serversettingsEditbox3[3] ) );
	gServerSettingsEditbox3.Text = "Deathmatch";
	gServerSettingsEditbox3.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox3.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox3.Visible = false;
	
	/* Max players editbox */
	gServerSettingsEditbox4 = GUIEditbox( VectorScreen( serversettingsEditbox4[0], serversettingsEditbox4[1] ), ScreenSize( serversettingsEditbox4[2], serversettingsEditbox4[3] ) );
	gServerSettingsEditbox4.Text = "128";
	gServerSettingsEditbox4.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox4.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox4.Visible = false;

	/* Password editbox */
	gServerSettingsEditbox5 = GUIEditbox( VectorScreen( serversettingsEditbox5[0], serversettingsEditbox5[1] ), ScreenSize( serversettingsEditbox5[2], serversettingsEditbox5[3] ) );
	gServerSettingsEditbox5.Text = "";
	gServerSettingsEditbox5.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox5.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox5.Visible = false;
	
	/* Port editbox */
	gServerSettingsEditbox6 = GUIEditbox( VectorScreen( serversettingsEditbox6[0], serversettingsEditbox6[1] ), ScreenSize( serversettingsEditbox6[2], serversettingsEditbox6[3] ) );
	gServerSettingsEditbox6.Text = "2004";
	gServerSettingsEditbox6.TextColour = GUI_TEXT_COLOR;
	gServerSettingsEditbox6.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsEditbox6.Visible = false;
	
	/* Cancel button */
	gServerSettingsButton0 = GUIButton( VectorScreen( serversettingsButton0[0], serversettingsButton0[1] ), ScreenSize( serversettingsButton0[2], serversettingsButton0[3] ), serversettingsButton0[4] );
	if ( GUI_BUTTON_COLOR ) gServerSettingsButton0.Colour = GUI_BUTTON_COLOR;
	gServerSettingsButton0.FontTags = TAG_BOLD;
	gServerSettingsButton0.SetCallbackFunc( Menu5_Handle0 );
	gServerSettingsButton0.TextColour = GUI_BUTTON_TEXT_COLOR;
	gServerSettingsButton0.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsButton0.Flags = FLAG_SHADOW;
	gServerSettingsButton0.Visible = true;
	
	/* Accept button */
	gServerSettingsButton1 = GUIButton( VectorScreen( serversettingsButton1[0], serversettingsButton1[1] ), ScreenSize( serversettingsButton1[2], serversettingsButton1[3] ), serversettingsButton1[4] );
	if ( GUI_BUTTON_COLOR ) gServerSettingsButton1.Colour = GUI_BUTTON_COLOR;
	gServerSettingsButton1.FontTags = TAG_BOLD;
	gServerSettingsButton1.SetCallbackFunc( Menu5_Handle1 );
	gServerSettingsButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gServerSettingsButton1.Alpha = GUI_ELEMENT_ALPHA;
	gServerSettingsButton1.Flags = FLAG_SHADOW;
	gServerSettingsButton1.Visible = false;	
	
	
	AddGUILayer( gServerSettingsWindow );
	gServerSettingsWindow.AddChild( gServerSettingsLabel1 );
	gServerSettingsWindow.AddChild( gServerSettingsLabel2 );
	gServerSettingsWindow.AddChild( gServerSettingsLabel3 );
	gServerSettingsWindow.AddChild( gServerSettingsLabel4 );
	gServerSettingsWindow.AddChild( gServerSettingsLabel5 );
	gServerSettingsWindow.AddChild( gServerSettingsLabel6 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox1 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox2 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox3 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox4 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox5 );
	gServerSettingsWindow.AddChild( gServerSettingsEditbox6 );
	gServerSettingsWindow.AddChild( gServerSettingsButton0 );
	gServerSettingsWindow.AddChild( gServerSettingsButton1 );
	
	
	
	
	// ------------------------------- Game Settings Window
	gGameSettingsWindow = GUIWindow( VectorScreen( gamesettingsWindow[0], gamesettingsWindow[1] ), ScreenSize( gamesettingsWindow[2], gamesettingsWindow[3] ), gamesettingsWindow[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsWindow.Colour = GUI_WINDOW_COLOR;
	gGameSettingsWindow.Titlebar = GUI_TITLE_BAR;
	gGameSettingsWindow.Alpha = GUI_WINDOW_ALPHA;
	gGameSettingsWindow.Visible = false;
	
	/* Game speed label */
	gGameSettingsLabel1 = GUILabel( VectorScreen( gamesettingsLabel1[0], gamesettingsLabel1[1] ), ScreenSize( gamesettingsLabel1[2], gamesettingsLabel1[3] ), gamesettingsLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel1.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel1.FontTags = TAG_BOLD;
	gGameSettingsLabel1.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel1.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel1.Flags = FLAG_SHADOW;
	gGameSettingsLabel1.Visible = false;
	
	/* Game gravity label */
	gGameSettingsLabel2 = GUILabel( VectorScreen( gamesettingsLabel2[0], gamesettingsLabel2[1] ), ScreenSize( gamesettingsLabel2[2], gamesettingsLabel2[3] ), gamesettingsLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel2.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel2.FontTags = TAG_BOLD;
	gGameSettingsLabel2.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel2.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel2.Flags = FLAG_SHADOW;
	gGameSettingsLabel2.Visible = false;
	
	/* Flying cars label */
	gGameSettingsLabel3 = GUILabel( VectorScreen( gamesettingsLabel3[0], gamesettingsLabel3[1] ), ScreenSize( gamesettingsLabel3[2], gamesettingsLabel3[3] ), gamesettingsLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel3.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel3.FontTags = TAG_BOLD;
	gGameSettingsLabel3.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel3.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel3.Flags = FLAG_SHADOW;
	gGameSettingsLabel3.Visible = false;
	
	/* Handling cheat label */
	gGameSettingsLabel4 = GUILabel( VectorScreen( gamesettingsLabel4[0], gamesettingsLabel4[1] ), ScreenSize( gamesettingsLabel4[2], gamesettingsLabel4[3] ), gamesettingsLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel4.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel4.FontTags = TAG_BOLD;
	gGameSettingsLabel4.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel4.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel4.Flags = FLAG_SHADOW;
	gGameSettingsLabel4.Visible = false;
	
	/* Friendly fire label */
	gGameSettingsLabel5 = GUILabel( VectorScreen( gamesettingsLabel5[0], gamesettingsLabel5[1] ), ScreenSize( gamesettingsLabel5[2], gamesettingsLabel5[3] ), gamesettingsLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel5.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel5.FontTags = TAG_BOLD;
	gGameSettingsLabel5.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel5.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel5.Flags = FLAG_SHADOW;
	gGameSettingsLabel5.Visible = false;
	
	/* SSV Bridge label */
	gGameSettingsLabel6 = GUILabel( VectorScreen( gamesettingsLabel6[0], gamesettingsLabel6[1] ), ScreenSize( gamesettingsLabel6[2], gamesettingsLabel6[3] ), gamesettingsLabel6[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel6.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel6.FontTags = TAG_BOLD;
	gGameSettingsLabel6.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel6.Alpha = GUI_LABEL_ALPHA;
	gGameSettingsLabel6.Flags = FLAG_SHADOW;
	gGameSettingsLabel6.Visible = false;
	
	/* Game Speed editbox */
	gGameSettingsEditbox1 = GUIEditbox( VectorScreen( gamesettingsEditbox1[0], gamesettingsEditbox1[1] ), ScreenSize( gamesettingsEditbox1[2], gamesettingsEditbox1[3] ) );
	gGameSettingsEditbox1.Text = "1";
	gGameSettingsEditbox1.TextColour = GUI_TEXT_COLOR;
	gGameSettingsEditbox1.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsEditbox1.Visible = false;
	
	/* Game Grav editbox */
	gGameSettingsEditbox2 = GUIEditbox( VectorScreen( gamesettingsEditbox2[0], gamesettingsEditbox2[1] ), ScreenSize( gamesettingsEditbox2[2], gamesettingsEditbox2[3] ) );
	gGameSettingsEditbox2.Text = "0.008";
	gGameSettingsEditbox2.TextColour = GUI_TEXT_COLOR;
	gGameSettingsEditbox2.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsEditbox2.Visible = false;
	
	/* Flying Cars checkbox */
	gGameSettingsCheckbox1 = GUICheckbox( VectorScreen( gamesettingsCheckbox1[0], gamesettingsCheckbox1[1] ), ScreenSize( gamesettingsCheckbox1[2], gamesettingsCheckbox1[3] ), gamesettingsCheckbox1[4] );
	gGameSettingsCheckbox1.Alpha = 200;
	gGameSettingsCheckbox1.Visible = false;
	
	/* Handling cheat checkbox */
	gGameSettingsCheckbox2 = GUICheckbox( VectorScreen( gamesettingsCheckbox2[0], gamesettingsCheckbox2[1] ), ScreenSize( gamesettingsCheckbox2[2], gamesettingsCheckbox2[3] ), gamesettingsCheckbox2[4] );
	gGameSettingsCheckbox2.Alpha = 200;
	gGameSettingsCheckbox2.Visible = false;
	
	/* Friendly Fire checkbox */
	gGameSettingsCheckbox3 = GUICheckbox( VectorScreen( gamesettingsCheckbox3[0], gamesettingsCheckbox3[1] ), ScreenSize( gamesettingsCheckbox3[2], gamesettingsCheckbox3[3] ), gamesettingsCheckbox3[4] );
	gGameSettingsCheckbox3.Alpha = 200;
	gGameSettingsCheckbox3.Visible = false;
	
	/* SSV Bridge checkbox */
	gGameSettingsCheckbox4 = GUICheckbox( VectorScreen( gamesettingsCheckbox4[0], gamesettingsCheckbox4[1] ), ScreenSize( gamesettingsCheckbox4[2], gamesettingsCheckbox4[3] ), gamesettingsCheckbox4[4] );
	gGameSettingsCheckbox4.Alpha = 200;
	gGameSettingsCheckbox4.Visible = false;
	
	/* Cancel button */
	gGameSettingsButton0 = GUIButton( VectorScreen( gamesettingsButton0[0], gamesettingsButton0[1] ), ScreenSize( gamesettingsButton0[2], gamesettingsButton0[3] ), gamesettingsButton0[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton0.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton0.FontTags = TAG_BOLD;
	gGameSettingsButton0.SetCallbackFunc( Menu4_Handle0 );
	gGameSettingsButton0.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton0.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton0.Flags = FLAG_SHADOW;
	gGameSettingsButton0.Visible = true;
	
	/* Accept button */
	gGameSettingsButton1 = GUIButton( VectorScreen( gamesettingsButton1[0], gamesettingsButton1[1] ), ScreenSize( gamesettingsButton1[2], gamesettingsButton1[3] ), gamesettingsButton1[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton1.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton1.FontTags = TAG_BOLD;
	gGameSettingsButton1.SetCallbackFunc( Menu4_Handle1 );
	gGameSettingsButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton1.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton1.Flags = FLAG_SHADOW;
	gGameSettingsButton1.Visible = false;
	
	/* Game speed + button */
	gGameSettingsButton2 = GUIButton( VectorScreen( gamesettingsButton2[0], gamesettingsButton2[1] ), ScreenSize( gamesettingsButton2[2], gamesettingsButton2[3] ), gamesettingsButton2[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton2.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton2.FontTags = TAG_BOLD;
	gGameSettingsButton2.SetCallbackFunc( Menu4_Handle2 );
	gGameSettingsButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton2.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton2.Flags = FLAG_SHADOW;
	gGameSettingsButton2.Visible = false;
	
	/* Game speed - button */
	gGameSettingsButton3 = GUIButton( VectorScreen( gamesettingsButton3[0], gamesettingsButton3[1] ), ScreenSize( gamesettingsButton3[2], gamesettingsButton3[3] ), gamesettingsButton3[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton3.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton3.FontTags = TAG_BOLD;
	gGameSettingsButton3.SetCallbackFunc( Menu4_Handle3 );
	gGameSettingsButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton3.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton3.Flags = FLAG_SHADOW;
	gGameSettingsButton3.Visible = false;
	
	/* Gravity + button */
	gGameSettingsButton4 = GUIButton( VectorScreen( gamesettingsButton4[0], gamesettingsButton4[1] ), ScreenSize( gamesettingsButton4[2], gamesettingsButton4[3] ), gamesettingsButton4[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton4.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton4.FontTags = TAG_BOLD;
	gGameSettingsButton4.SetCallbackFunc( Menu4_Handle4 );
	gGameSettingsButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton4.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton4.Flags = FLAG_SHADOW;
	gGameSettingsButton4.Visible = false;
	
	/* Gravity ++ button */
	gGameSettingsButton5 = GUIButton( VectorScreen( gamesettingsButton5[0], gamesettingsButton5[1] ), ScreenSize( gamesettingsButton5[2], gamesettingsButton5[3] ), gamesettingsButton5[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton5.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton5.FontTags = TAG_BOLD;
	gGameSettingsButton5.SetCallbackFunc( Menu4_Handle5 );
	gGameSettingsButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton5.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton5.Flags = FLAG_SHADOW;
	gGameSettingsButton5.Visible = false;
	
	/* Gravity - button */
	gGameSettingsButton6 = GUIButton( VectorScreen( gamesettingsButton6[0], gamesettingsButton6[1] ), ScreenSize( gamesettingsButton6[2], gamesettingsButton6[3] ), gamesettingsButton6[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton6.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton6.FontTags = TAG_BOLD;
	gGameSettingsButton6.SetCallbackFunc( Menu4_Handle6 );
	gGameSettingsButton6.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton6.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton6.Flags = FLAG_SHADOW;
	gGameSettingsButton6.Visible = false;
	
	/* Gravity -- button */
	gGameSettingsButton7 = GUIButton( VectorScreen( gamesettingsButton7[0], gamesettingsButton7[1] ), ScreenSize( gamesettingsButton7[2], gamesettingsButton7[3] ), gamesettingsButton7[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton7.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton7.FontTags = TAG_BOLD;
	gGameSettingsButton7.SetCallbackFunc( Menu4_Handle7 );
	gGameSettingsButton7.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton7.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton7.Flags = FLAG_SHADOW;
	gGameSettingsButton7.Visible = false;
	
	AddGUILayer( gGameSettingsWindow );
	gGameSettingsWindow.AddChild( gGameSettingsLabel1 );
	gGameSettingsWindow.AddChild( gGameSettingsLabel2 );
	gGameSettingsWindow.AddChild( gGameSettingsLabel3 );
	gGameSettingsWindow.AddChild( gGameSettingsLabel4 );
	gGameSettingsWindow.AddChild( gGameSettingsLabel5 );
	gGameSettingsWindow.AddChild( gGameSettingsLabel6 );
	gGameSettingsWindow.AddChild( gGameSettingsEditbox1 );
	gGameSettingsWindow.AddChild( gGameSettingsEditbox2 );
	gGameSettingsWindow.AddChild( gGameSettingsCheckbox1 );
	gGameSettingsWindow.AddChild( gGameSettingsCheckbox2 );
	gGameSettingsWindow.AddChild( gGameSettingsCheckbox3 );
	gGameSettingsWindow.AddChild( gGameSettingsCheckbox4 );
	gGameSettingsWindow.AddChild( gGameSettingsButton0 );
	gGameSettingsWindow.AddChild( gGameSettingsButton1 );
	gGameSettingsWindow.AddChild( gGameSettingsButton2 );
	gGameSettingsWindow.AddChild( gGameSettingsButton3 );
	gGameSettingsWindow.AddChild( gGameSettingsButton4 );
	gGameSettingsWindow.AddChild( gGameSettingsButton5 );
	gGameSettingsWindow.AddChild( gGameSettingsButton6 );
	gGameSettingsWindow.AddChild( gGameSettingsButton7 );
	
	
	// ------------------------------- Message Window, for future use
	gMessageWindow = GUIWindow( VectorScreen( messageWindow[0], messageWindow[1] ), ScreenSize( messageWindow[2], messageWindow[3] ), messageWindow[4] );
	if ( GUI_WINDOW_COLOR ) gMessageWindow.Colour = GUI_WINDOW_COLOR;
	gMessageWindow.Titlebar = GUI_TITLE_BAR;
	gMessageWindow.Alpha = GUI_WINDOW_ALPHA;
	gMessageWindow.Visible = false;
	
	/* Are you sure label? :) */
	gMessageLabel1 = GUILabel( VectorScreen( messageWindowLabel1[0], messageWindowLabel1[1] ), ScreenSize( messageWindowLabel1[2], messageWindowLabel1[3] ), messageWindowLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gMessageLabel1.Colour = GUI_WINDOW_COLOR;
	gMessageLabel1.FontTags = TAG_BOLD;
	gMessageLabel1.TextColour = GUI_TEXT_COLOR;
	gMessageLabel1.Alpha = GUI_LABEL_ALPHA;
	gMessageLabel1.Flags = FLAG_SHADOW;
	gMessageLabel1.Visible = true;
	
	/* Yes button */
	gMessageButton0 = GUIButton( VectorScreen( messageWindowButton0[0], messageWindowButton0[1] ), ScreenSize( messageWindowButton0[2], messageWindowButton0[3] ), messageWindowButton0[4] );
	if ( GUI_BUTTON_COLOR ) gMessageButton0.Colour = GUI_BUTTON_COLOR;
	gMessageButton0.FontTags = TAG_BOLD;
	//gMessageButton0.SetCallbackFunc( Menu7_Handle0 );
	gMessageButton0.TextColour = GUI_BUTTON_TEXT_COLOR;
	gMessageButton0.Alpha = GUI_ELEMENT_ALPHA;
	gMessageButton0.Flags = FLAG_SHADOW;
	gMessageButton0.Visible = true;

	/* No button */
	gMessageButton1 = GUIButton( VectorScreen( messageWindowButton1[0], messageWindowButton1[1] ), ScreenSize( messageWindowButton1[2], messageWindowButton1[3] ), messageWindowButton1[4] );
	if ( GUI_BUTTON_COLOR ) gMessageButton1.Colour = GUI_BUTTON_COLOR;
	gMessageButton1.FontTags = TAG_BOLD;
	//gMessageButton1.SetCallbackFunc( Menu7_Handle1 );
	gMessageButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gMessageButton1.Alpha = GUI_ELEMENT_ALPHA;
	gMessageButton1.Flags = FLAG_SHADOW;
	gMessageButton1.Visible = true;
	
	AddGUILayer( gMessageWindow );
	gMessageWindow.AddChild( gMessageLabel1 );
	gMessageWindow.AddChild( gMessageButton0 );
	gMessageWindow.AddChild( gMessageButton1 );
	
	
	// ------------------------------- Color palette window
	gColorPaletteWindow = GUIWindow( VectorScreen( colorpaletteWindow[0], colorpaletteWindow[1] ), ScreenSize( colorpaletteWindow[2], colorpaletteWindow[3] ), colorpaletteWindow[4] );
	if ( GUI_WINDOW_COLOR ) gColorPaletteWindow.Colour = GUI_WINDOW_COLOR;
	gColorPaletteWindow.Titlebar = true;
	gColorPaletteWindow.Moveable = true;
	gColorPaletteWindow.Alpha = GUI_WINDOW_ALPHA;
	gColorPaletteWindow.Visible = false;
	
	/* button */
	gColorPaletteButton1 = GUIButton( VectorScreen( colorpaletteButton1[0], colorpaletteButton1[1] ), ScreenSize( colorpaletteButton1[2], colorpaletteButton1[3] ), colorpaletteButton1[4] );
	if ( paletteColor1 ) gColorPaletteButton1.Colour = paletteColor1;
	gColorPaletteButton1.FontTags = TAG_BOLD;
	gColorPaletteButton1.SetCallbackFunc( Menu8_Handle1 );
	gColorPaletteButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton1.Alpha = 255;
	gColorPaletteButton1.Flags = FLAG_SHADOW;
	gColorPaletteButton1.Visible = true;
	
	/* button */
	gColorPaletteButton2 = GUIButton( VectorScreen( colorpaletteButton2[0], colorpaletteButton2[1] ), ScreenSize( colorpaletteButton2[2], colorpaletteButton2[3] ), colorpaletteButton2[4] );
	if ( paletteColor2 ) gColorPaletteButton2.Colour = paletteColor2;
	gColorPaletteButton2.FontTags = TAG_BOLD;
	gColorPaletteButton2.SetCallbackFunc( Menu8_Handle2 );
	gColorPaletteButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton2.Alpha = 255;
	gColorPaletteButton2.Flags = FLAG_SHADOW;
	gColorPaletteButton2.Visible = true;
	
	/* button */
	gColorPaletteButton3 = GUIButton( VectorScreen( colorpaletteButton3[0], colorpaletteButton3[1] ), ScreenSize( colorpaletteButton3[2], colorpaletteButton3[3] ), colorpaletteButton3[4] );
	if ( paletteColor3 ) gColorPaletteButton3.Colour = paletteColor3;
	gColorPaletteButton3.FontTags = TAG_BOLD;
	gColorPaletteButton3.SetCallbackFunc( Menu8_Handle3 );
	gColorPaletteButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton3.Alpha = 255;
	gColorPaletteButton3.Flags = FLAG_SHADOW;
	gColorPaletteButton3.Visible = true;
	
	/* button */
	gColorPaletteButton4 = GUIButton( VectorScreen( colorpaletteButton4[0], colorpaletteButton4[1] ), ScreenSize( colorpaletteButton4[2], colorpaletteButton4[3] ), colorpaletteButton4[4] );
	if ( paletteColor4 ) gColorPaletteButton4.Colour = paletteColor4;
	gColorPaletteButton4.FontTags = TAG_BOLD;
	gColorPaletteButton4.SetCallbackFunc( Menu8_Handle4 );
	gColorPaletteButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton4.Alpha = 255;
	gColorPaletteButton4.Flags = FLAG_SHADOW;
	gColorPaletteButton4.Visible = true;
	
	/* button */
	gColorPaletteButton5 = GUIButton( VectorScreen( colorpaletteButton5[0], colorpaletteButton5[1] ), ScreenSize( colorpaletteButton5[2], colorpaletteButton5[3] ), colorpaletteButton5[4] );
	if ( paletteColor5 ) gColorPaletteButton5.Colour = paletteColor5;
	gColorPaletteButton5.FontTags = TAG_BOLD;
	gColorPaletteButton5.SetCallbackFunc( Menu8_Handle5 );
	gColorPaletteButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton5.Alpha = 255;
	gColorPaletteButton5.Flags = FLAG_SHADOW;
	gColorPaletteButton5.Visible = true;
	
	/* button */
	gColorPaletteButton6 = GUIButton( VectorScreen( colorpaletteButton6[0], colorpaletteButton6[1] ), ScreenSize( colorpaletteButton6[2], colorpaletteButton6[3] ), colorpaletteButton6[4] );
	if ( paletteColor6 ) gColorPaletteButton6.Colour = paletteColor6;
	gColorPaletteButton6.FontTags = TAG_BOLD;
	gColorPaletteButton6.SetCallbackFunc( Menu8_Handle6 );
	gColorPaletteButton6.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton6.Alpha = 255;
	gColorPaletteButton6.Flags = FLAG_SHADOW;
	gColorPaletteButton6.Visible = true;
	
	/* button */
	gColorPaletteButton7 = GUIButton( VectorScreen( colorpaletteButton7[0], colorpaletteButton7[1] ), ScreenSize( colorpaletteButton7[2], colorpaletteButton7[3] ), colorpaletteButton7[4] );
	if ( paletteColor7 ) gColorPaletteButton7.Colour = paletteColor7;
	gColorPaletteButton7.FontTags = TAG_BOLD;
	gColorPaletteButton7.SetCallbackFunc( Menu8_Handle7 );
	gColorPaletteButton7.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton7.Alpha = 255;
	gColorPaletteButton7.Flags = FLAG_SHADOW;
	gColorPaletteButton7.Visible = true;
	
	/* button */
	gColorPaletteButton8 = GUIButton( VectorScreen( colorpaletteButton8[0], colorpaletteButton8[1] ), ScreenSize( colorpaletteButton8[2], colorpaletteButton8[3] ), colorpaletteButton8[4] );
	if ( paletteColor8 ) gColorPaletteButton8.Colour = paletteColor8;
	gColorPaletteButton8.FontTags = TAG_BOLD;
	gColorPaletteButton8.SetCallbackFunc( Menu8_Handle8 );
	gColorPaletteButton8.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton8.Alpha = 255;
	gColorPaletteButton8.Flags = FLAG_SHADOW;
	gColorPaletteButton8.Visible = true;
	
	/* button */
	gColorPaletteButton9 = GUIButton( VectorScreen( colorpaletteButton9[0], colorpaletteButton9[1] ), ScreenSize( colorpaletteButton9[2], colorpaletteButton9[3] ), colorpaletteButton9[4] );
	if ( paletteColor9 ) gColorPaletteButton9.Colour = paletteColor9;
	gColorPaletteButton9.FontTags = TAG_BOLD;
	gColorPaletteButton9.SetCallbackFunc( Menu8_Handle9 );
	gColorPaletteButton9.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton9.Alpha = 255;
	gColorPaletteButton9.Flags = FLAG_SHADOW;
	gColorPaletteButton9.Visible = true;
	
	/* button */
	gColorPaletteButton10 = GUIButton( VectorScreen( colorpaletteButton10[0], colorpaletteButton10[1] ), ScreenSize( colorpaletteButton10[2], colorpaletteButton10[3] ), colorpaletteButton10[4] );
	if ( paletteColor10 ) gColorPaletteButton10.Colour = paletteColor10;
	gColorPaletteButton10.FontTags = TAG_BOLD;
	gColorPaletteButton10.SetCallbackFunc( Menu8_Handle10 );
	gColorPaletteButton10.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton10.Alpha = 255;
	gColorPaletteButton10.Flags = FLAG_SHADOW;
	gColorPaletteButton10.Visible = true;
	
	/* button */
	gColorPaletteButton11 = GUIButton( VectorScreen( colorpaletteButton11[0], colorpaletteButton11[1] ), ScreenSize( colorpaletteButton11[2], colorpaletteButton11[3] ), colorpaletteButton11[4] );
	if ( paletteColor11 ) gColorPaletteButton11.Colour = paletteColor11;
	gColorPaletteButton11.FontTags = TAG_BOLD;
	gColorPaletteButton11.SetCallbackFunc( Menu8_Handle11 );
	gColorPaletteButton11.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton11.Alpha = 255;
	gColorPaletteButton11.Flags = FLAG_SHADOW;
	gColorPaletteButton11.Visible = true;
	
	/* button */
	gColorPaletteButton12 = GUIButton( VectorScreen( colorpaletteButton12[0], colorpaletteButton12[1] ), ScreenSize( colorpaletteButton12[2], colorpaletteButton12[3] ), colorpaletteButton12[4] );
	if ( paletteColor12 ) gColorPaletteButton12.Colour = paletteColor12;
	gColorPaletteButton12.FontTags = TAG_BOLD;
	gColorPaletteButton12.SetCallbackFunc( Menu8_Handle12 );
	gColorPaletteButton12.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton12.Alpha = 255;
	gColorPaletteButton12.Flags = FLAG_SHADOW;
	gColorPaletteButton12.Visible = true;
	
	/* button */
	gColorPaletteButton13 = GUIButton( VectorScreen( colorpaletteButton13[0], colorpaletteButton13[1] ), ScreenSize( colorpaletteButton13[2], colorpaletteButton13[3] ), colorpaletteButton13[4] );
	if ( paletteColor13 ) gColorPaletteButton13.Colour = paletteColor13;
	gColorPaletteButton13.FontTags = TAG_BOLD;
	gColorPaletteButton13.SetCallbackFunc( Menu8_Handle13 );
	gColorPaletteButton13.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton13.Alpha = 255;
	gColorPaletteButton13.Flags = FLAG_SHADOW;
	gColorPaletteButton13.Visible = true;
	
	/* button */
	gColorPaletteButton14 = GUIButton( VectorScreen( colorpaletteButton14[0], colorpaletteButton14[1] ), ScreenSize( colorpaletteButton14[2], colorpaletteButton14[3] ), colorpaletteButton14[4] );
	if ( paletteColor14 ) gColorPaletteButton14.Colour = paletteColor14;
	gColorPaletteButton14.FontTags = TAG_BOLD;
	gColorPaletteButton14.SetCallbackFunc( Menu8_Handle14 );
	gColorPaletteButton14.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton14.Alpha = 255;
	gColorPaletteButton14.Flags = FLAG_SHADOW;
	gColorPaletteButton14.Visible = true;
	
	/* button */
	gColorPaletteButton15 = GUIButton( VectorScreen( colorpaletteButton15[0], colorpaletteButton15[1] ), ScreenSize( colorpaletteButton15[2], colorpaletteButton15[3] ), colorpaletteButton15[4] );
	if ( paletteColor15 ) gColorPaletteButton15.Colour = paletteColor15;
	gColorPaletteButton15.FontTags = TAG_BOLD;
	gColorPaletteButton15.SetCallbackFunc( Menu8_Handle15 );
	gColorPaletteButton15.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton15.Alpha = 255;
	gColorPaletteButton15.Flags = FLAG_SHADOW;
	gColorPaletteButton15.Visible = true;
	
	/* button */
	gColorPaletteButton16 = GUIButton( VectorScreen( colorpaletteButton16[0], colorpaletteButton16[1] ), ScreenSize( colorpaletteButton16[2], colorpaletteButton16[3] ), colorpaletteButton16[4] );
	if ( paletteColor16 ) gColorPaletteButton16.Colour = paletteColor16;
	gColorPaletteButton16.FontTags = TAG_BOLD;
	gColorPaletteButton16.SetCallbackFunc( Menu8_Handle16 );
	gColorPaletteButton16.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton16.Alpha = 255;
	gColorPaletteButton16.Flags = FLAG_SHADOW;
	gColorPaletteButton16.Visible = true;
	
	/* button */
	gColorPaletteButton17 = GUIButton( VectorScreen( colorpaletteButton17[0], colorpaletteButton17[1] ), ScreenSize( colorpaletteButton17[2], colorpaletteButton17[3] ), colorpaletteButton17[4] );
	if ( paletteColor17 ) gColorPaletteButton17.Colour = paletteColor17;
	gColorPaletteButton17.FontTags = TAG_BOLD;
	gColorPaletteButton17.SetCallbackFunc( Menu8_Handle17 );
	gColorPaletteButton17.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton17.Alpha = 255;
	gColorPaletteButton17.Flags = FLAG_SHADOW;
	gColorPaletteButton17.Visible = true;
	
	/* button */
	gColorPaletteButton18 = GUIButton( VectorScreen( colorpaletteButton18[0], colorpaletteButton18[1] ), ScreenSize( colorpaletteButton18[2], colorpaletteButton18[3] ), colorpaletteButton18[4] );
	if ( paletteColor18 ) gColorPaletteButton18.Colour = paletteColor18;
	gColorPaletteButton18.FontTags = TAG_BOLD;
	gColorPaletteButton18.SetCallbackFunc( Menu8_Handle18 );
	gColorPaletteButton18.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton18.Alpha = 255;
	gColorPaletteButton18.Flags = FLAG_SHADOW;
	gColorPaletteButton18.Visible = true;
	
	/* button */
	gColorPaletteButton19 = GUIButton( VectorScreen( colorpaletteButton19[0], colorpaletteButton19[1] ), ScreenSize( colorpaletteButton19[2], colorpaletteButton19[3] ), colorpaletteButton19[4] );
	if ( paletteColor19 ) gColorPaletteButton19.Colour = paletteColor19;
	gColorPaletteButton19.FontTags = TAG_BOLD;
	gColorPaletteButton19.SetCallbackFunc( Menu8_Handle19 );
	gColorPaletteButton19.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton19.Alpha = 255;
	gColorPaletteButton19.Flags = FLAG_SHADOW;
	gColorPaletteButton19.Visible = true;
	
	/* button */
	gColorPaletteButton20 = GUIButton( VectorScreen( colorpaletteButton20[0], colorpaletteButton20[1] ), ScreenSize( colorpaletteButton20[2], colorpaletteButton20[3] ), colorpaletteButton20[4] );
	if ( paletteColor20 ) gColorPaletteButton20.Colour = paletteColor20;
	gColorPaletteButton20.FontTags = TAG_BOLD;
	gColorPaletteButton20.SetCallbackFunc( Menu8_Handle20 );
	gColorPaletteButton20.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton20.Alpha = 255;
	gColorPaletteButton20.Flags = FLAG_SHADOW;
	gColorPaletteButton20.Visible = true;
	
	/* button */
	gColorPaletteButton21 = GUIButton( VectorScreen( colorpaletteButton21[0], colorpaletteButton21[1] ), ScreenSize( colorpaletteButton21[2], colorpaletteButton21[3] ), colorpaletteButton21[4] );
	if ( paletteColor21 ) gColorPaletteButton21.Colour = paletteColor21;
	gColorPaletteButton21.FontTags = TAG_BOLD;
	gColorPaletteButton21.SetCallbackFunc( Menu8_Handle21 );
	gColorPaletteButton21.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton21.Alpha = 255;
	gColorPaletteButton21.Flags = FLAG_SHADOW;
	gColorPaletteButton21.Visible = true;
	
	/* button */
	gColorPaletteButton22 = GUIButton( VectorScreen( colorpaletteButton22[0], colorpaletteButton22[1] ), ScreenSize( colorpaletteButton22[2], colorpaletteButton22[3] ), colorpaletteButton22[4] );
	if ( paletteColor22 ) gColorPaletteButton22.Colour = paletteColor22;
	gColorPaletteButton22.FontTags = TAG_BOLD;
	gColorPaletteButton22.SetCallbackFunc( Menu8_Handle22 );
	gColorPaletteButton22.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton22.Alpha = 255;
	gColorPaletteButton22.Flags = FLAG_SHADOW;
	gColorPaletteButton22.Visible = true;
	
	/* button */
	gColorPaletteButton23 = GUIButton( VectorScreen( colorpaletteButton23[0], colorpaletteButton23[1] ), ScreenSize( colorpaletteButton23[2], colorpaletteButton23[3] ), colorpaletteButton23[4] );
	if ( paletteColor23 ) gColorPaletteButton23.Colour = paletteColor23;
	gColorPaletteButton23.FontTags = TAG_BOLD;
	gColorPaletteButton23.SetCallbackFunc( Menu8_Handle23 );
	gColorPaletteButton23.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton23.Alpha = 255;
	gColorPaletteButton23.Flags = FLAG_SHADOW;
	gColorPaletteButton23.Visible = true;
	
	/* button */
	gColorPaletteButton24 = GUIButton( VectorScreen( colorpaletteButton24[0], colorpaletteButton24[1] ), ScreenSize( colorpaletteButton24[2], colorpaletteButton24[3] ), colorpaletteButton24[4] );
	if ( paletteColor24 ) gColorPaletteButton24.Colour = paletteColor24;
	gColorPaletteButton24.FontTags = TAG_BOLD;
	gColorPaletteButton24.SetCallbackFunc( Menu8_Handle24 );
	gColorPaletteButton24.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton24.Alpha = 255;
	gColorPaletteButton24.Flags = FLAG_SHADOW;
	gColorPaletteButton24.Visible = true;
	
	/* button */
	gColorPaletteButton25 = GUIButton( VectorScreen( colorpaletteButton25[0], colorpaletteButton25[1] ), ScreenSize( colorpaletteButton25[2], colorpaletteButton25[3] ), colorpaletteButton25[4] );
	if ( paletteColor25 ) gColorPaletteButton25.Colour = paletteColor25;
	gColorPaletteButton25.FontTags = TAG_BOLD;
	gColorPaletteButton25.SetCallbackFunc( Menu8_Handle25 );
	gColorPaletteButton25.TextColour = GUI_BUTTON_TEXT_COLOR;
	gColorPaletteButton25.Alpha = 255;
	gColorPaletteButton25.Flags = FLAG_SHADOW;
	gColorPaletteButton25.Visible = true;
	
	AddGUILayer( gColorPaletteWindow );
	gColorPaletteWindow.AddChild( gColorPaletteButton1 );
	gColorPaletteWindow.AddChild( gColorPaletteButton2 );
	gColorPaletteWindow.AddChild( gColorPaletteButton3 );
	gColorPaletteWindow.AddChild( gColorPaletteButton4 );
	gColorPaletteWindow.AddChild( gColorPaletteButton5 );
	gColorPaletteWindow.AddChild( gColorPaletteButton6 );
	gColorPaletteWindow.AddChild( gColorPaletteButton7 );
	gColorPaletteWindow.AddChild( gColorPaletteButton8 );
	gColorPaletteWindow.AddChild( gColorPaletteButton9 );
	gColorPaletteWindow.AddChild( gColorPaletteButton10 );
	gColorPaletteWindow.AddChild( gColorPaletteButton11 );
	gColorPaletteWindow.AddChild( gColorPaletteButton12 );
	gColorPaletteWindow.AddChild( gColorPaletteButton13 );
	gColorPaletteWindow.AddChild( gColorPaletteButton14 );
	gColorPaletteWindow.AddChild( gColorPaletteButton15 );
	gColorPaletteWindow.AddChild( gColorPaletteButton16 );
	gColorPaletteWindow.AddChild( gColorPaletteButton17 );
	gColorPaletteWindow.AddChild( gColorPaletteButton18 );
	gColorPaletteWindow.AddChild( gColorPaletteButton19 );
	gColorPaletteWindow.AddChild( gColorPaletteButton20 );
	gColorPaletteWindow.AddChild( gColorPaletteButton21 );
	gColorPaletteWindow.AddChild( gColorPaletteButton22 );
	gColorPaletteWindow.AddChild( gColorPaletteButton23 );
	gColorPaletteWindow.AddChild( gColorPaletteButton24 );
	gColorPaletteWindow.AddChild( gColorPaletteButton25 );
	
	return 1;
}

function SetSpawnState( bState )
{
	bSpawnState = bState;
}

function SetAdminLevel( iLevel, iMaxPlr )
{
	iAdminLevel = iLevel;
	iMaxPlayers = iMaxPlr;
	
	if ( iLevel >= PANEL_ACCESS )
	{
		BindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
		Message( CONSOLE_PREFIX + " You can access panel by pressing " + BIND_KEY + " button." );
	}
	else UnindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
}

local iConsoleMode = 0;

function ProcessConsoleMessage()
{
	if ( !gPlayerManagerWindow.Visible ) return 1;
	
	if ( iConsoleMode == 0 ) SearchPlayer();
	else if (( iConsoleMode == 1 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE1 )) SendPrivateMessage();
	else if (( iConsoleMode == 2 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE2 )) SetHealth();
	else if (( iConsoleMode == 3 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE3 )) SetArmor();
	else if (( iConsoleMode == 4 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE4 )) SetSkin();
	else if (( iConsoleMode == 5 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE5 )) BanIP();
	else if (( iConsoleMode == 6 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE6 )) UnbanIP();
	else if (( iConsoleMode == 7 ) && ( iAdminLevel >= PLAYER_CONSOLE_MODE7 )) SetPlayerLevel();
}

function ChangeMode()
{
	local pPlayer = FindPlayer( iPlayerID );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	
	if ( iConsoleMode == 0 )
	{
		iConsoleMode = 1;
		gPlayerManagerLabel7.Text = "[2/8] Mode: Private message";
		gPlayerManagerEditbox1.Text = "";
		UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		if (( iAdminLevel < PLAYER_CONSOLE_MODE1 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 1 )
	{
		iConsoleMode = 2;
		gPlayerManagerLabel7.Text = "[3/8] Mode: Set health";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE2 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 2 )
	{
		iConsoleMode = 3;
		gPlayerManagerLabel7.Text = "[4/8] Mode: Set armor";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE3 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 3 )
	{
		iConsoleMode = 4;
		gPlayerManagerLabel7.Text = "[5/8] Mode: Set skin";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE4 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 4 )
	{
		iConsoleMode = 5;
		gPlayerManagerLabel7.Text = "[6/8] Mode: Ban IP";
		gPlayerManagerEditbox1.Text = "";
		if ( iAdminLevel < PLAYER_CONSOLE_MODE5 ) ChangeMode();
	}
	else if ( iConsoleMode == 5 )
	{
		iConsoleMode = 6;
		gPlayerManagerLabel7.Text = "[7/8] Mode: Unban IP";
		gPlayerManagerEditbox1.Text = "";
		if ( iAdminLevel < PLAYER_CONSOLE_MODE6 ) ChangeMode();
	}
	else if ( iConsoleMode == 6 )
	{
		iConsoleMode = 7;
		gPlayerManagerLabel7.Text = "[8/8] Mode: Set admin level";
		gPlayerManagerEditbox1.Text = "";
		if ( iAdminLevel < PLAYER_CONSOLE_MODE7 ) ChangeMode();
	}
	else if ( iConsoleMode == 7 )
	{
		iConsoleMode = 0;
		gPlayerManagerLabel7.Text = "[1/8] Mode: Find player";
		gPlayerManagerEditbox1.Text = "";
		UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	}
}

function SendPrivateMessage()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_Message", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text );
	
	gPlayerManagerEditbox1.Text = "";
	Message( CONSOLE_PREFIX	+ " Private message sent." );
}

function SetHealth()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetHealth", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger(), gPlayerManagerCheckbox1.Checked );
	
	gPlayerManagerEditbox1.Text = "";
}

function SetArmor()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetArmor", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger(), gPlayerManagerCheckbox1.Checked );
	
	gPlayerManagerEditbox1.Text = "";
}

function SetSkin()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetSkin", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger(), gPlayerManagerCheckbox1.Checked );
	
	gPlayerManagerEditbox1.Text = "";
}

function BanIP()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_BanIP", pLocalPlayer, gPlayerManagerEditbox1.Text );
	
	gPlayerManagerEditbox1.Text = "";
}
function UnbanIP()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_UnbanIP", pLocalPlayer, gPlayerManagerEditbox1.Text );
	
	gPlayerManagerEditbox1.Text = "";
}

function SetPlayerLevel()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "CLIENT_SetAdminLevel", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger() );
	
	gPlayerManagerEditbox1.Text = "";
}

function SearchPlayer()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( gPlayerManagerEditbox1.Text );
	if ( !pPlayer ) return 1;
	
	gPlayerManagerEditbox1.Text = "";
	
	iPlayerID = pPlayer.ID;
	PlayerMenagerRefresh()
}

function SpectatePlayer_Process( pPlayer )
{
	if ( !bSpawnState ) return 0;
	if ( !pPlayer ) return 0;
	
	local vCameraPosition = pPlayer.Pos;
	local vCameraPointAt = pPlayer.Pos;
	
	vCameraPosition.x += 20.0;
	vCameraPosition.z += 20.0;
	
	SetCameraMatrix( vCameraPosition, vCameraPointAt );
}

function SpectateVehicle_Process( pVehicle )
{
	if ( !bSpawnState ) return 0;
	if ( !pVehicle ) return 0;
	
	pLocalPlayer.Health = fHealth;
	
	local vCameraPosition = pVehicle.Pos;
	local vCameraPointAt = pVehicle.Pos;
	
	vCameraPosition.x -= 1.7;
	vCameraPosition.y -= 1.7;
	vCameraPosition.z += 0.2;
	
	pLocalPlayer.Pos = vCameraPosition;
	
	vCameraPosition.x += 5.0;
	vCameraPosition.y += 5.0;
	vCameraPosition.z += 5.0;
	
	SetCameraMatrix( vCameraPosition, vCameraPointAt );
}

function SpectatePlayer_Stop( )
{
	if ( bSpawnState ) RestoreCamera();
}

function TimeAndWeather_Update( iWeather, iHour, iMin, bTimeLock, bWeatherLock )
{
	iWeatherID = iWeather;
	gTimeWeatherEditbox1.Text = iHour.tostring();
	gTimeWeatherEditbox2.Text = iMin.tostring();
	gTimeWeatherEditbox3.Text = iWeather.tostring();
	gTimeWeatherCheckbox1.Checked = bTimeLock;
	gTimeWeatherCheckbox2.Checked = bWeatherLock;
}

function PlayerManager_Update( szIP )
{
	gPlayerManagerLabel6.Text = "IP:" + szIP;
}


function VehicleManager_Update( iCount )
{
	iVehicleCount = iCount;
}

function GameSettings_Update( fGameSpeed, fGameGravity, bFlyingCarsCheat, bHandlingCheat, bFriendlyFire, bSSVBridge )
{
	gGameSettingsEditbox1.Text = fGameSpeed.tostring();
	gGameSettingsEditbox2.Text = fGameGravity.tostring();
	gGameSettingsCheckbox1.Checked = bFlyingCarsCheat;
	gGameSettingsCheckbox2.Checked = bHandlingCheat;
	gGameSettingsCheckbox3.Checked = bFriendlyFire;
	gGameSettingsCheckbox4.Checked = bSSVBridge;
}

function ServerSettings_Update( szServerName, szMapName, szGamemodeName, iMaxPlayers, szPassword, iPort )
{
	gServerSettingsEditbox1.Text = szServerName;
	gServerSettingsEditbox2.Text = szMapName;
	gServerSettingsEditbox3.Text = szGamemodeName;
	gServerSettingsEditbox4.Text = iMaxPlayers.tostring();
	if ( szPassword ) gServerSettingsEditbox5.Text = szPassword;
	gServerSettingsEditbox6.Text = iPort.tostring();
}

bLocalPlayerFrozen <- false;

function ShowAdminPanel()
{	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
	
	//ShowTimeAndWheaterSettings()						// Set your default tab here
	
	if ( iAdminLevel >= TIME_WEATHER_ACCESS ) gTitleButton1.Visible = true;
	else  gTitleButton1.Visible = false;
	
	if ( iAdminLevel >= PLAYER_MANAGER_ACCESS ) gTitleButton2.Visible = true;
	else  gTitleButton2.Visible = false;
	
	if ( iAdminLevel >= VEHICLE_MANAGER_ACCESS ) gTitleButton3.Visible = true;
	else  gTitleButton3.Visible = false;
	
	if ( iAdminLevel >= SERVER_ACCESS ) gTitleButton4.Visible = true;
	else  gTitleButton4.Visible = false;
	
	if ( iAdminLevel >= GAME_ACCESS ) gTitleButton5.Visible = true;
	else  gTitleButton5.Visible = false;
	
	ShowMouseCursor( true );
	SetHUDItemEnabled( HUD_RADAR, false );
	bLocalPlayerFrozen = pLocalPlayer.Frozen;
	pLocalPlayer.Frozen = true;
	
	gTitleWindow.Visible = true;
	
	SpectatePlayer_Process( pLocalPlayer );
	
	UnbindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	BindKey( KEY_ESCAPE, BINDTYPE_DOWN, "HideAdminPanel" );
}

function HideAdminPanel()
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
	if (( gVehicleManagerWindow.Visible ) && ( bSpawnState )) pLocalPlayer.Pos = vLocalPlayerPos;
	
	gTitleWindow.Visible = false;
	gTimeWeatherWindow.Visible = false;
	gPlayerManagerWindow.Visible = false;
	gGameSettingsWindow.Visible = false;
	gServerSettingsWindow.Visible = false;
	gVehicleManagerWindow.Visible = false;
	gBanSelectionWindow.Visible = false;
	
	ShowMouseCursor( false );
	SetHUDItemEnabled( HUD_RADAR, true );
	pLocalPlayer.Frozen = bLocalPlayerFrozen;
	
	SpectatePlayer_Stop();
	
	UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
	if ( iLevel < PANEL_ACCESS ) UnbindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
}

function ShowTimeAndWheaterSettings()
{
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	
	if ( gTimeWeatherWindow.Visible ) // close
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		gTimeWeatherWindow.Visible = false;
		
		SpectatePlayer_Process( pLocalPlayer );
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_LoadData", pLocalPlayer );
		
		if ( iAdminLevel >= TIME_WEATHER_TLOCK )
		{		
			gTimeWeatherLabel1.Visible = true;
			gTimeWeatherCheckbox1.Visible = true;
			gTimeWeatherButton3.Visible = true;
		}
		if ( iAdminLevel >= TIME_WEATHER_WLOCK )
		{		
			gTimeWeatherLabel2.Visible = true;
			gTimeWeatherCheckbox2.Visible = true;
			gTimeWeatherButton3.Visible = true;
		}
		if ( iAdminLevel >= TIME_WEATHER_TIME )
		{		
			gTimeWeatherLabel3.Visible = true;
			gTimeWeatherEditbox1.Visible = true;
			gTimeWeatherEditbox2.Visible = true;
			gTimeWeatherButton3.Visible = true;
		}
		if ( iAdminLevel >= TIME_WEATHER_WEATHER )
		{		
			gTimeWeatherLabel4.Visible = true;
			gTimeWeatherEditbox3.Visible = true;
			gTimeWeatherButton1.Visible = true;
			gTimeWeatherButton2.Visible = true;
			gTimeWeatherButton3.Visible = true;
		}
		
		gPlayerManagerWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gServerSettingsWindow.Visible = false;
		gVehicleManagerWindow.Visible = false;
		gBanSelectionWindow.Visible = false;
		gTimeWeatherWindow.Visible = true;
		
		if ( bSpawnState ) SetCameraMatrix( Vector( -739.0, 480.0, 132.0 ), Vector( -653.0, -575.0, 29.0 ) );
	}
}

function PlayerMenagerRefresh()
{
	local pPlayer = FindPlayer( iPlayerID );
		
	if ( !pPlayer )
	{
		gPlayerManagerLabel1.Text = "Free Slot (" + iPlayerID + "/" + iMaxPlayers + ")";
		gPlayerManagerLabel2.Text = "Health: 100";
		gPlayerManagerLabel3.Text = "Armor: 100";
		gPlayerManagerLabel4.Text = "Skin: 0";
		gPlayerManagerLabel5.Text = "Ping: 0ms";
		gPlayerManagerLabel6.Text = "IP:";
		gPlayerManagerButton3.Visible = false;
		gPlayerManagerButton4.Visible = false;
		gPlayerManagerButton5.Visible = false;
		gPlayerManagerButton6.Visible = false;
		gPlayerManagerButton8.Visible = false;
		gPlayerManagerButton9.Visible = false;
		gPlayerManagerButton10.Visible = false;
		gPlayerManagerLabel2.Visible = false;
		gPlayerManagerLabel3.Visible = false;
		gPlayerManagerLabel4.Visible = false;
		gPlayerManagerLabel5.Visible = false;
		gPlayerManagerLabel6.Visible = false;
		gPlayerManagerLabel8.Visible = false;
		gPlayerManagerProgressbar1.Visible = false;
		gPlayerManagerProgressbar2.Visible = false;
		gPlayerManagerCheckbox1.Visible = false;
		
		SpectatePlayer_Process( pLocalPlayer );
		
		if ( iConsoleMode ==  0 || 5 || 6 ) return 1;
		
		else ChangeMode();
	}
	else
	{
		gPlayerManagerLabel1.Text = pPlayer.Name + " (" + iPlayerID + "/" + iMaxPlayers + ")";
		gPlayerManagerLabel2.Text = "Health: " + pPlayer.Health;
		gPlayerManagerLabel3.Text = "Armor: " + pPlayer.Armour;
		gPlayerManagerLabel4.Text = "Skin: " + pPlayer.Skin;
		gPlayerManagerLabel5.Text = "Ping: " + pPlayer.Ping + "ms";
		//gPlayerManagerLabel6.Text = "IP: 0.0.0.0";
		gPlayerManagerProgressbar1.Value = pPlayer.Health;
		gPlayerManagerProgressbar2.Value = pPlayer.Armour;
		if ( pPlayer.Frozen ) gPlayerManagerButton5.Text = "Unfreeze";
		else gPlayerManagerButton5.Text = "Freeze";

		if ( iAdminLevel >= PLAYER_MANAGER_KICK ) gPlayerManagerButton3.Visible = true;
		else gPlayerManagerButton3.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_KILL ) gPlayerManagerButton4.Visible = true;
		else gPlayerManagerButton4.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_FREEZE ) gPlayerManagerButton5.Visible = true;
		else gPlayerManagerButton5.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_HEAL ) gPlayerManagerButton6.Visible = true;
		else gPlayerManagerButton6.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_BAN ) gPlayerManagerButton8.Visible = true;
		else gPlayerManagerButton8.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_GOTO ) gPlayerManagerButton9.Visible = true;
		else gPlayerManagerButton9.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_BRING ) gPlayerManagerButton10.Visible = true;
		else gPlayerManagerButton10.Visible = false;
		
		if ( iAdminLevel >= PLAYER_MANAGER_ALL )
		{
			gPlayerManagerCheckbox1.Visible = true;
			gPlayerManagerLabel8.Visible = true;
		}
		else
		{
			gPlayerManagerCheckbox1.Visible = false;
			gPlayerManagerLabel8.Visible = false;
		}

		gPlayerManagerLabel2.Visible = true;
		gPlayerManagerLabel3.Visible = true;
		gPlayerManagerLabel4.Visible = true;
		gPlayerManagerLabel5.Visible = true;
		gPlayerManagerLabel6.Visible = true;
		gPlayerManagerProgressbar1.Visible = true;
		gPlayerManagerProgressbar2.Visible = true;
		
		if ( iConsoleMode == 1 ) UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		
		SpectatePlayer_Process( pPlayer );
	}
}

function ShowPlayerManager()
{
	BindKey( KEY_RETURN, BINDTYPE_DOWN, "ProcessConsoleMessage" );
	BindKey( KEY_END, BINDTYPE_DOWN, "ChangeMode" );
	
	PlayerMenagerRefresh();
	
	if ( gPlayerManagerWindow.Visible )
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		UnbindKey( KEY_RETURN, BINDTYPE_DOWN, "ProcessConsoleMessage" );
		UnbindKey( KEY_END, BINDTYPE_DOWN, "ChangeMode" );
		BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		gPlayerManagerWindow.Visible = false;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		if ( iConsoleMode == 0 ) UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		
		local pPlayer = FindPlayer( iPlayerID );
		if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_LoadData", pLocalPlayer, pPlayer );
		
		gTimeWeatherWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gServerSettingsWindow.Visible = false;
		gVehicleManagerWindow.Visible = false;
		gBanSelectionWindow.Visible = false;
		gPlayerManagerWindow.Visible = true;
	}
}

function ShowVehicleManager()
{
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		
	if ( gVehicleManagerWindow.Visible )
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		if ( bSpawnState ) pLocalPlayer.Pos = vLocalPlayerPos;
		gVehicleManagerWindow.Visible = false;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		
		if ( bSpawnState )
		{
			fHealth = pLocalPlayer.Health;
			vLocalPlayerPos = pLocalPlayer.Pos;
		}
		CallServerFunc( "adminpanel/server.nut", "VehicleManager_LoadData", pLocalPlayer );
		
		if ( iAdminLevel >= VEHICLE_MANAGER_FIX ) gVehicleManagerButton4.Visible = true;
		if ( iAdminLevel >= VEHICLE_MANAGER_EXPLODE ) gVehicleManagerButton5.Visible = true;
		if ( iAdminLevel >= VEHICLE_MANAGER_RESPAWN ) gVehicleManagerButton6.Visible = true;
		if ( iAdminLevel >= VEHICLE_MANAGER_REMOVE ) gVehicleManagerButton7.Visible = true;
		if ( iAdminLevel >= VEHICLE_MANAGER_TELEPORT ) gVehicleManagerButton8.Visible = true;
		if ( iAdminLevel >= VEHICLE_MANAGER_COLOR )
		{
			gVehicleManagerButton9.Visible = true;
			gVehicleManagerButton10.Visible = true;
		}
		
		gTimeWeatherWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gServerSettingsWindow.Visible = false;
		gPlayerManagerWindow.Visible = false;
		gBanSelectionWindow.Visible = false;
		gVehicleManagerWindow.Visible = true;
		
		local pVehicle = FindVehicle( iVehicleID );
		if ( pVehicle )
		{
			gVehicleManagerCheckbox1.Checked = pVehicle.Locked;
			gVehicleManagerCheckbox2.Checked = pVehicle.LightState;
			gVehicleManagerCheckbox3.Checked = pVehicle.EngineState;
			gVehicleManagerLabel1.Text = GetVehicleName( pVehicle ) + " (" + (iVehicleID+1).tostring() + "/" + iVehicleCount + ")";
			SpectateVehicle_Process( pVehicle );
		}
	}
}

function VehicleMenagerRefresh()
{
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle  )
	{
		gVehicleManagerLabel2.Text = "Health: " + pVehicle.Health;
		gVehicleManagerProgressbar1.Value = pVehicle.Health;
		SpectateVehicle_Process( pVehicle )
	}
}

function ShowGameSettings()
{
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	SpectatePlayer_Process( pLocalPlayer );
	
	if ( gGameSettingsWindow.Visible )
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		gGameSettingsWindow.Visible = false;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		CallServerFunc( "adminpanel/server.nut", "GameSettings_LoadData", pLocalPlayer );
		
		if ( iAdminLevel >= GAME_SETTINGS_SPEED )
		{	
			gGameSettingsLabel1.Visible = true;		
			gGameSettingsEditbox1.Visible = true;
			gGameSettingsButton1.Visible = true;
			gGameSettingsButton2.Visible = true;
			gGameSettingsButton3.Visible = true;
		}
		if ( iAdminLevel >= GAME_SETTINGS_GRAVITY )
		{	
			gGameSettingsLabel2.Visible = true;		
			gGameSettingsEditbox2.Visible = true;
			gGameSettingsButton1.Visible = true;
			gGameSettingsButton4.Visible = true;
			gGameSettingsButton5.Visible = true;
			gGameSettingsButton6.Visible = true;
			gGameSettingsButton7.Visible = true;
		}
		if ( iAdminLevel >= GAME_SETTINGS_FLYINGC )
		{	
			gGameSettingsLabel3.Visible = true;		
			gGameSettingsCheckbox1.Visible = true;
			gGameSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= GAME_SETTINGS_HANGLINGC )
		{	
			gGameSettingsLabel4.Visible = true;		
			gGameSettingsCheckbox2.Visible = true;
			gGameSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= GAME_SETTINGS_FRIENDLYF )
		{	
			gGameSettingsLabel5.Visible = true;		
			gGameSettingsCheckbox3.Visible = true;
			gGameSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= GAME_SETTINGS_SSVBRIDGE )
		{	
			gGameSettingsLabel6.Visible = true;		
			gGameSettingsCheckbox4.Visible = true;
			gGameSettingsButton1.Visible = true;
		}
		
		gTimeWeatherWindow.Visible = false;
		gPlayerManagerWindow.Visible = false;
		gVehicleManagerWindow.Visible = false;
		gServerSettingsWindow.Visible = false;
		gBanSelectionWindow.Visible = false;
		gGameSettingsWindow.Visible = true;
	}
}

function ShowServerSettings()
{
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	SpectatePlayer_Process( pLocalPlayer );
	
	if ( gServerSettingsWindow.Visible )
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		gServerSettingsWindow.Visible = false;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		CallServerFunc( "adminpanel/server.nut", "ServerSettings_LoadData", pLocalPlayer );

		if ( iAdminLevel >= SERVER_SETTINGS_SNAME )
		{
			gServerSettingsLabel1.Visible = true;
			gServerSettingsEditbox1.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= SERVER_SETTINGS_MNAME )
		{
			gServerSettingsLabel2.Visible = true;
			gServerSettingsEditbox2.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= SERVER_SETTINGS_GNAME )
		{
			gServerSettingsLabel3.Visible = true;
			gServerSettingsEditbox3.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= SERVER_SETTINGS_MPLAYERS )
		{
			gServerSettingsLabel4.Visible = true;
			gServerSettingsEditbox4.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= SERVER_SETTINGS_PASSWORD )
		{
			gServerSettingsLabel5.Visible = true;
			gServerSettingsEditbox5.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		if ( iAdminLevel >= SERVER_SETTINGS_PORT )
		{
			gServerSettingsLabel6.Visible = true;
			gServerSettingsEditbox6.Visible = true;
			gServerSettingsButton1.Visible = true;
		}
		
		gTimeWeatherWindow.Visible = false;
		gPlayerManagerWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gVehicleManagerWindow.Visible = false;
		gBanSelectionWindow.Visible = false;
		gServerSettingsWindow.Visible = true;
	}
}

function ShowBanTypeSelection()
{
	if ( gBanSelectionWindow.Visible )
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
		gBanSelectionWindow.Visible = false;
		gTitleWindow.Visible = true;
		gPlayerManagerWindow.Visible = true;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );

		if ( iAdminLevel >= PLAYER_MANAGER_BANTYPE_1 )	// Name
		{
			gBanSelectionLabel1.Visible = true;
			gBanSelectionCheckbox1.Visible = true;
			gBanSelectionButton2.Visible = true;
		}
		if ( iAdminLevel >= PLAYER_MANAGER_BANTYPE_2 )	// IP
		{
			gBanSelectionLabel2.Visible = true;
			gBanSelectionCheckbox2.Visible = true;
			gBanSelectionButton2.Visible = true;
		}
		if ( iAdminLevel >= PLAYER_MANAGER_BANTYPE_3 )	// LUID
		{
			gBanSelectionLabel3.Visible = true;
			gBanSelectionCheckbox3.Visible = true;
			gBanSelectionButton2.Visible = true;
		}
		
		gTitleWindow.Visible = false;
		gTimeWeatherWindow.Visible = false;
		gPlayerManagerWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gVehicleManagerWindow.Visible = false;
		gServerSettingsWindow.Visible = false;
		gBanSelectionWindow.Visible = true;
	}
}

// ---------------------------------------- Menu1 Handler
// ---------------------------------------- Main Menu
function Menu1_Handle0()		// Exit
{
	HideAdminPanel();
}

function Menu1_Handle1()		// Time & Weather
{
	if ( !gTitleButton1.Visible ) return;
	
	if ( gVehicleManagerWindow.Visible ) pLocalPlayer.Pos = vLocalPlayerPos;
	
	ShowTimeAndWheaterSettings();
}

function Menu1_Handle2()		// Player Manager
{
	if ( !gTitleButton2.Visible ) return;
	
	if ( gVehicleManagerWindow.Visible ) pLocalPlayer.Pos = vLocalPlayerPos;
	
	ShowPlayerManager();
}

function Menu1_Handle3()		// Vehicle Manager
{
	if ( !gTitleButton3.Visible ) return;
	
	ShowVehicleManager();
}

function Menu1_Handle4()		// Server Settings
{
	if ( !gTitleButton4.Visible ) return;
	
	if ( gVehicleManagerWindow.Visible ) pLocalPlayer.Pos = vLocalPlayerPos;
	
	ShowServerSettings();
}
function Menu1_Handle5()		// Game Setting
{
	if ( !gTitleButton5.Visible ) return;
	
	if ( gVehicleManagerWindow.Visible ) pLocalPlayer.Pos = vLocalPlayerPos;
	
	ShowGameSettings();
}


// ---------------------------------------- Menu2 Handler
// ---------------------------------------- Time & Weather Menu
function Menu2_Handle0()		// Cancel
{
	ShowTimeAndWheaterSettings();
}

function Menu2_Handle1()		// Accept
{
	if ( !gTimeWeatherButton3.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_ACCEPT );
	
	local iHour = gTimeWeatherEditbox1.Text.tointeger();
	local iMin = gTimeWeatherEditbox2.Text.tointeger();
	iWeatherID = gTimeWeatherEditbox3.Text.tointeger();
	
	CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_Accept", pLocalPlayer, iWeatherID, iHour, iMin, gTimeWeatherCheckbox1.Checked, gTimeWeatherCheckbox2.Checked );
}

function Menu2_Handle2()		// +
{
	if ( !gTimeWeatherButton1.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	iWeatherID++;
	gTimeWeatherEditbox3.Text = iWeatherID.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_SetWeather", pLocalPlayer, iWeatherID );
}

function Menu2_Handle3()		// -
{
	if ( !gTimeWeatherButton2.Visible ) return 1;
	if ( iWeatherID == 0 ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	iWeatherID--;
	gTimeWeatherEditbox3.Text = iWeatherID.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_SetWeather", pLocalPlayer, iWeatherID );
}


// ---------------------------------------- Menu3 Handler
// ---------------------------------------- Player Manager
function Menu3_Handle0()		// Cancel
{
	ShowPlayerManager();
}
function Menu3_Handle1()		// Accept, useless
{
}
function Menu3_Handle2()		// <
{
	if ( iPlayerID == 0 ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local pPlayer = FindPlayer( iPlayerID-- );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_LoadData", pLocalPlayer, pPlayer );
	
	PlayerMenagerRefresh();
}
function Menu3_Handle3()		// >
{
	if ( iPlayerID == iMaxPlayers ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
		
	local pPlayer = FindPlayer( iPlayerID++ );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_LoadData", pLocalPlayer, pPlayer );
	
	PlayerMenagerRefresh();
}
function Menu3_Handle4()		// Kick
{
	if ( !gPlayerManagerButton3.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Kick", pLocalPlayer, pPlayer );
}
function Menu3_Handle5()		// Kill/ALL
{	
	if ( !gPlayerManagerButton4.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer )  CallServerFunc( "adminpanel/server.nut", "PlayerManager_Kill", pLocalPlayer, pPlayer, gPlayerManagerCheckbox1.Checked );
}
function Menu3_Handle6()		// Freeze/ALL
{	
	if ( !gPlayerManagerButton5.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetFreeze", pLocalPlayer, pPlayer, !pPlayer.Frozen, gPlayerManagerCheckbox1.Checked );
}
function Menu3_Handle7()		// Heal/ALL
{	
	if ( !gPlayerManagerButton6.Visible ) return 1;
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Heal", pLocalPlayer, pPlayer, gPlayerManagerCheckbox1.Checked );
}
function Menu3_Handle8()		// Ban
{	
	if ( !gPlayerManagerButton8.Visible ) return;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) ShowBanTypeSelection();
}
function Menu3_Handle9()		// Go to/ALL
{	
	if ( !gPlayerManagerButton9.Visible ) return 1;	
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Teleport", pLocalPlayer, pPlayer, gPlayerManagerCheckbox1.Checked );
}
function Menu3_Handle10()		// Bring/ALL
{
	if ( !gPlayerManagerButton10.Visible ) return 1;	
	
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iAdminLevel < PLAYER_MANAGER_ALL ) gPlayerManagerCheckbox1.Checked = false;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Bring", pLocalPlayer, pPlayer, gPlayerManagerCheckbox1.Checked );
}


// ---------------------------------------- Menu4 Handler
// ---------------------------------------- Game Settings Menu
function Menu4_Handle0()		// Cancel
{
	ShowGameSettings();
}

function Menu4_Handle1()		// Accept
{
	if ( !gGameSettingsButton1.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_ACCEPT );
	
	local fGameSpeed = gGameSettingsEditbox1.Text.tofloat();
	local fGameGravity = gGameSettingsEditbox2.Text.tofloat();
	local bFlyingCarsCheat = gGameSettingsCheckbox1.Checked;
	local bHandlingCheat = gGameSettingsCheckbox2.Checked;
	local bFriendlyFire = gGameSettingsCheckbox3.Checked;
	local bSSVBridge = gGameSettingsCheckbox4.Checked;
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_Accept", pLocalPlayer, fGameSpeed, fGameGravity, bFlyingCarsCheat, bHandlingCheat, bFriendlyFire, bSSVBridge );
}
function Menu4_Handle2()		// Speed +
{
	if ( !gGameSettingsButton2.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGameSpeed = gGameSettingsEditbox1.Text.tofloat();
	fGameSpeed+=0.1;
	gGameSettingsEditbox1.Text = fGameSpeed.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetSpeed", pLocalPlayer, fGameSpeed );
}
function Menu4_Handle3()		// Speed -
{
	if ( !gGameSettingsButton3.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGameSpeed = gGameSettingsEditbox1.Text.tofloat();
	fGameSpeed-=0.1;
	gGameSettingsEditbox1.Text = fGameSpeed.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetSpeed", pLocalPlayer, fGameSpeed );
}
function Menu4_Handle4()		// Gravity +
{
	if ( !gGameSettingsButton4.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGravity = gGameSettingsEditbox2.Text.tofloat();
	fGravity+=0.001;
	gGameSettingsEditbox2.Text = fGravity.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetGravity", pLocalPlayer, fGravity );
}
function Menu4_Handle5()		// Gravity ++
{
	if ( !gGameSettingsButton3.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGravity = gGameSettingsEditbox2.Text.tofloat();
	fGravity+=0.1;
	gGameSettingsEditbox2.Text = fGravity.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetGravity", pLocalPlayer, fGravity );
}
function Menu4_Handle6()		// Gravity -
{
	if ( !gGameSettingsButton3.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGravity = gGameSettingsEditbox2.Text.tofloat();
	fGravity-=0.001;
	gGameSettingsEditbox2.Text = fGravity.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetGravity", pLocalPlayer, fGravity );
}
function Menu4_Handle7()		// Gravity --
{
	if ( !gGameSettingsButton3.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local fGravity = gGameSettingsEditbox2.Text.tofloat();
	fGravity-=0.1;
	gGameSettingsEditbox2.Text = fGravity.tostring();
	
	CallServerFunc( "adminpanel/server.nut", "GameSettings_SetGravity", pLocalPlayer, fGravity );
}


// ---------------------------------------- Menu5 Handler
// ---------------------------------------- Server Settings Menu
function Menu5_Handle0()		// Cancel
{
	ShowServerSettings();
}

function Menu5_Handle1()		// Accept
{
	if ( !gServerSettingsButton1.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_ACCEPT );
	
	local szServerName = gServerSettingsEditbox1.Text;
	local szMapName = gServerSettingsEditbox2.Text;
	local szGamemodeName = gServerSettingsEditbox3.Text;
	local iMaxPlayers = gServerSettingsEditbox4.Text.tointeger();
	local szPassword = gServerSettingsEditbox5.Text;
	local iPort = gServerSettingsEditbox6.Text.tointeger();
	
	CallServerFunc( "adminpanel/server.nut", "ServerSettings_Accept", pLocalPlayer, szServerName, szMapName, szGamemodeName, iMaxPlayers, szPassword, iPort );
}


// ---------------------------------------- Menu6 Handler
// ---------------------------------------- Vehicle Manager
function Menu6_Handle0()		// Cancel
{
	ShowVehicleManager();
}
function Menu6_Handle1()		// Accept
{
	if ( !gVehicleManagerButton1.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	local pVehicle = FindVehicle( iVehicleID );
	CallServerFunc( "adminpanel/server.nut", "VehicleManager_Accept", pLocalPlayer, pVehicle, gVehicleManagerCheckbox1.Checked, gVehicleManagerCheckbox2.Checked, gVehicleManagerCheckbox3.Checked );
}
function Menu6_Handle2()		// <
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	
	CallServerFunc( "adminpanel/server.nut", "VehicleManager_LoadData", pLocalPlayer );
	
	if ( iVehicleID == 0 ) return 1;
	
	iVehicleID--;
	
	local pVehicle = FindVehicle( iVehicleID );
	
	if ( pVehicle )
	{
		gVehicleManagerCheckbox1.Checked = pVehicle.Locked;
		gVehicleManagerCheckbox2.Checked = pVehicle.LightState;
		gVehicleManagerCheckbox3.Checked = pVehicle.EngineState;
		gVehicleManagerLabel1.Text = GetVehicleName( pVehicle ) + " (" + (iVehicleID+1).tostring() + "/" + iVehicleCount + ")";
		SpectateVehicle_Process( pVehicle );
	}
}
function Menu6_Handle3()		// >
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	CallServerFunc( "adminpanel/server.nut", "VehicleManager_LoadData", pLocalPlayer );
	
	if ( iVehicleID == (iVehicleCount - 1) ) return 1;
	
	iVehicleID++;
	local pVehicle = FindVehicle( iVehicleID );
	
	if ( pVehicle )
	{
		gVehicleManagerCheckbox1.Checked = pVehicle.Locked;
		gVehicleManagerCheckbox2.Checked = pVehicle.LightState;
		gVehicleManagerCheckbox3.Checked = pVehicle.EngineState;
		gVehicleManagerLabel1.Text = GetVehicleName( pVehicle ) + " (" + (iVehicleID+1).tostring() + "/" + iVehicleCount + ")";
		SpectateVehicle_Process( pVehicle );
	}
}
function Menu6_Handle4()		// Fix
{
	if ( !gVehicleManagerButton4.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_Fix", pLocalPlayer, pVehicle );
}
function Menu6_Handle5()		// Explode
{
	if ( !gVehicleManagerButton5.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_Explode", pLocalPlayer, pVehicle );
}
function Menu6_Handle6()		// Respawn
{
	if ( !gVehicleManagerButton6.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_Respawn", pLocalPlayer, pVehicle );
}
function Menu6_Handle7()		// Remove
{
	if ( !gVehicleManagerButton7.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_Remove", pLocalPlayer, pVehicle );
}
function Menu6_Handle8()		// Teleport
{
	if ( !gVehicleManagerButton8.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );

	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )
	{
		local vVehiclePosition = pVehicle.Pos;
		
		vVehiclePosition.x -= 1.5;
		vVehiclePosition.y -= 1.5;
		vVehiclePosition.z += 0.5;
		vLocalPlayerPos = vVehiclePosition;
	}
}
function Menu6_Handle9()		// Color1
{
	if ( !gVehicleManagerButton9.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	iColorID = 1;
	gColorPaletteWindow.Visible = true;
}
function Menu6_Handle10()		// Color2
{
	if ( !gVehicleManagerButton10.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	iColorID = 2;
	gColorPaletteWindow.Visible = true;
}


// ---------------------------------------- Menu7 Handler
// ---------------------------------------- Messagebox, for future use
function Menu7_Handle0()		// Yes
{
	gMessageWindow.Visible = false;
	return 1;
}
function Menu7_Handle1()		// No
{
	gMessageWindow.Visible = false;
	return 0;
}
function ShowMessageBox()
{
	gMessageWindow.Visible = true;
}


// ---------------------------------------- Menu8 Handler
// ---------------------------------------- Color Picker
function Menu8_Handle1()		// Color 1
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor1.r, paletteColor1.g, paletteColor1.b );
}
function Menu8_Handle2()		// Color 2
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor2.r, paletteColor2.g, paletteColor2.b );
}
function Menu8_Handle3()		// Color 3
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor3.r, paletteColor3.g, paletteColor3.b );
}
function Menu8_Handle4()		// Color 4
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor4.r, paletteColor4.g, paletteColor4.b );
}
function Menu8_Handle5()		// Color 5
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor5.r, paletteColor5.g, paletteColor5.b );
}
function Menu8_Handle6()		// Color 6
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor6.r, paletteColor6.g, paletteColor6.b );
}
function Menu8_Handle7()		// Color 7
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor7.r, paletteColor7.g, paletteColor7.b );
}
function Menu8_Handle8()		// Color 8
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor8.r, paletteColor8.g, paletteColor8.b );
}
function Menu8_Handle9()		// Color 9
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor9.r, paletteColor9.g, paletteColor9.b );
}
function Menu8_Handle10()		// Color 10
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor10.r, paletteColor10.g, paletteColor10.b );
}
function Menu8_Handle11()		// Color 11
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor11.r, paletteColor11.g, paletteColor11.b );
}
function Menu8_Handle12()		// Color 12
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor12.r, paletteColor12.g, paletteColor12.b );
}
function Menu8_Handle13()		// Color 13
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor13.r, paletteColor13.g, paletteColor13.b );
}
function Menu8_Handle14()		// Color 14
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor14.r, paletteColor14.g, paletteColor14.b );
}
function Menu8_Handle15()		// Color 15
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor15.r, paletteColor15.g, paletteColor15.b );
}
function Menu8_Handle16()		// Color 16
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor16.r, paletteColor16.g, paletteColor16.b );
}
function Menu8_Handle17()		// Color 17
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor17.r, paletteColor17.g, paletteColor17.b );
}
function Menu8_Handle18()		// Color 18
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor18.r, paletteColor18.g, paletteColor18.b );
}
function Menu8_Handle19()		// Color 19
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor19.r, paletteColor19.g, paletteColor19.b );
}
function Menu8_Handle20()		// Color 20
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor20.r, paletteColor20.g, paletteColor20.b );
}
function Menu8_Handle21()		// Color 21
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor21.r, paletteColor21.g, paletteColor21.b );
}
function Menu8_Handle22()		// Color 22
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor22.r, paletteColor22.g, paletteColor22.b );
}
function Menu8_Handle23()		// Color 23
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor23.r, paletteColor23.g, paletteColor23.b );
}
function Menu8_Handle24()		// Color 24
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor24.r, paletteColor24.g, paletteColor20.b );
}
function Menu8_Handle25()		// Color 25
{
	gColorPaletteWindow.Visible = false;
	
	local pVehicle = FindVehicle( iVehicleID );
	if ( pVehicle )	CallServerFunc( "adminpanel/server.nut", "VehicleManager_SetColor", pLocalPlayer, pVehicle, iColorID, paletteColor25.r, paletteColor25.g, paletteColor25.b );
}

// ---------------------------------------- Menu9 Handler
// ---------------------------------------- Ban type selection
function Menu9_Handle0()		// Cancel
{
	ShowBanTypeSelection();
}

function Menu9_Handle1()		// Add ban
{
	if (( !gBanSelectionCheckbox1.Checked ) && ( !gBanSelectionCheckbox2.Checked ) && ( !gBanSelectionCheckbox3.Checked ))
	{
		Message( "Error: please select at least one type of ban.", Colour( 255, 0, 0 ) );
		return;
	}

	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Ban", pLocalPlayer, pPlayer, gBanSelectionCheckbox1.Checked, gBanSelectionCheckbox2.Checked, gBanSelectionCheckbox3.Checked );
	
	ShowBanTypeSelection();
}


function onClientRender()
{
	local pPlayer = FindPlayer( iPlayerID );
	
	if ( gTimeWeatherWindow.Visible ) return 1;
	if ( gPlayerManagerWindow.Visible ) PlayerMenagerRefresh();
	if ( gVehicleManagerWindow.Visible ) VehicleMenagerRefresh();
	else if ( gTitleWindow.Visible )
	{
		pLocalPlayer.Frozen = true;
		if ( pPlayer ) SpectatePlayer_Process( pPlayer );
		else SpectatePlayer_Process( pLocalPlayer );
	}
	return 1;
}
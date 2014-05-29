/* ############################################################## */
/* #			Admin Panel v1.0 by Stoku						# */
/* #					Have fun!								# */
/* ############################################################## */

/* Author and versioning info */
local SCRIPT_VERSION			= "1.0";
local SCRIPT_AUTHOR				= "Stoku";
local LANGUAGE_NAME				= "english";
local LANGUAGE_AUTHOR			= "Stoku";

/* Basic settings */
local CONSOLE_PREFIX			= "[AdminPanel]";	// Console prefix
local BIND_KEY					= 'P';				// Keybind to access panel
local iAdminLevel				= 0;				// Don't change it
local SOUND_ENABLED				= true;				// Enable/disable admin panel sounds

/* Admin access configuration */
local PANEL_ACCESS				= 1;				// Admin panel access level
local TIME_WEATHER_ACCESS 		= 1;				// Access to Time & Weather settings
local PLAYER_MANAGER_ACCESS 	= 1;				// Player Manager
local GAME_ACCESS				= 1;				// Game settings
local MISC_ACCESS				= 2;				// Misc settings, for future use
// Time & Weather
local TIME_WEATHER_TLOCK		= 1;				// Time lock
local TIME_WEATHER_WLOCK		= 1;				// Weather lock
local TIME_WEATHER_TIME			= 1;				// Set time
local TIME_WEATHER_WEATHER		= 1;				// Set weather
// Player Manager
local PLAYER_MANAGER_KICK		= 1;				// Kick player
local PLAYER_MANAGER_KILL		= 1;				// Kill player
local PLAYER_MANAGER_FREEZE		= 1;				// Freeze/unfreeze
local PLAYER_MANAGER_HEAL		= 1;				// Heal player
local PLAYER_CONSOLE_MODE1		= 1;				// Private message
local PLAYER_CONSOLE_MODE2		= 1;				// Set health
local PLAYER_CONSOLE_MODE3		= 1;				// Set Armor
local PLAYER_CONSOLE_MODE4		= 1;				// SetSkin
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


/* GUI Color schemes */
/* Oldschool GTAIII Color Scheme (default) */
local GUI_WINDOW_ALPHA 			= 200;							// Window alpha channel
local GUI_ELEMENT_ALPHA 		= 50;							// Elements alpha channel
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
local twButton3 = [ 5, 65, 100, 25, "Vehicle Manager" ];											// X pos, Y pos, X Size, Y Size, Text
local twButton4 = [ 5, 95, 190, 25, "Misc" ];														// X pos, Y pos, X Size, Y Size, Text
local twButton5 = [ 5, 125, 190, 25, "Game Settings" ];												// X pos, Y pos, X Size, Y Size, Text

local timeweatherWindow = [ 200, ScreenHeight - 310, 400, 300, "Time & Weather Settings" ];			// X pos, Y pos, X Size, Y Size, Text
local timeweatherLabel1 = [ 5, 5, 100, 25, "Time Lock:" ];											// X pos, Y pos, X Size, Y Size, Text
local timeweatherLabel2 = [ 5, 35, 100, 25, "Weather Lock:" ];										// X pos, Y pos, X Size, Y Size, Text
local timeweatherLabel3 = [ 5, 65, 100, 25, "Set Time:" ];											// X pos, Y pos, X Size, Y Size, Text
local timeweatherLabel4 = [ 5, 95, 100, 25, "Set Weather:" ];										// X pos, Y pos, X Size, Y Size, Text
local timeweatherCheckbox1 = [ 140, 10, 10, 10, true ];												// X pos, Y pos, X Size, Y Size, bChecked
local timeweatherCheckbox2 = [ 140, 40, 10, 10, true ];												// X pos, Y pos, X Size, Y Size, bChecked
local timeweatherEditbox1 = [ 140, 65, 35, 25 ];													// X pos, Y pos, X Size, Y Size
local timeweatherEditbox2 = [ 175, 65, 35, 25 ];													// X pos, Y pos, X Size, Y Size
local timeweatherEditbox3 = [ 140, 95, 35, 25 ];													// X pos, Y pos, X Size, Y Size
local timeweatherButton1 = [ 175, 95, 25, 25, "+" ];												// X pos, Y pos, X Size, Y Size, Text
local timeweatherButton2 = [ 200, 95, 25, 25, "-" ];												// X pos, Y pos, X Size, Y Size, Text
local timeweatherButton3 = [ 5, timeweatherWindow[3] - 60, (timeweatherWindow[2]/2)-10, 25, "Accept" ];							// X pos, Y pos, X Size, Y Size, Text
local timeweatherButton4 = [ timeweatherWindow[3]-100, timeweatherWindow[3] - 60, (timeweatherWindow[2]/2)-10, 25, "Cancel" ];	// X pos, Y pos, X Size, Y Size, Text

local playermanagerWindow = [ 200, ScreenHeight - 310, 400, 300, "Player Manager" ];				// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton1 = [ 5, 5, 25, 25, "<" ];													// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton2 = [ playermanagerWindow[2]-30, 5, 25, 25, ">" ];							// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton3 = [ 5, 35, 100, 25, "Kick" ];											// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton4 = [ 5, 65, 100, 25, "Kill" ];											// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton5 = [ 5, 95, 100, 25, "Freeze" ];											// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton6 = [ 5, 125, 100, 25, "Heal" ];											// X pos, Y pos, X Size, Y Size, Text
local playermanagerButton7 = [ 5, playermanagerWindow[3] - 60, 390, 25, "Cancel" ];					// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel1 = [ playermanagerWindow[2]/2-70, 8, 100, 25, "Free Slot (0/0)" ];			// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel2 = [ 115, 38, 100, 25, "Health: 0" ];										// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel3 = [ 115, 68, 100, 25, "Armor: 0" ];										// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel4 = [ 110, 95, 100, 25, "Skin: 0" ];										// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel5 = [ 110, 125, 100, 25, "Ping: 0ms" ];										// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel6 = [ 110, 155, 100, 25, "Vehicle: 0" ];									// X pos, Y pos, X Size, Y Size, Text
local playermanagerLabel7 = [ 5, playermanagerWindow[3] - 110, 390, 25, "[1/5] Mode: Find player [Press END to change]" ];	// X pos, Y pos, X Size, Y Size, Text
local playermanagerEditbox1 = [ 5, playermanagerWindow[3] - 90, 390, 25 ];							// X pos, Y pos, X Size, Y Size
local playermanagerProgressbar1 = [ 110, 35, 285, 25 ];												// X pos, Y pos, X Size, Y Size
local playermanagerProgressbar2 = [ 110, 65, 285, 25 ];												// X pos, Y pos, X Size, Y Size

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
/* --- End of theme --- */

/* Dont touch it! */
local pLocalPlayer = FindLocalPlayer();

local gTitleWindow = null;
local gTitleButton0 = null;
local gTitleButton1 = null;
local gTitleButton2 = null;
local gTitleButton3 = null;
local gTitleButton4 = null;
local gTitleButton5 = null;

local gTimeWeatherWindow = null;
local gTimeWeatherLabel1 = null;
local gTimeWeatherLabel2 = null;
local gTimeWeatherLabel3 = null;
local gTimeWeatherLabel4 = null;
local gTimeWeatherCheckbox1 = null;
local gTimeWeatherCheckbox2 = null;
local gTimeWeatherEditbox1 = null;
local gTimeWeatherEditbox2 = null;
local gTimeWeatherEditbox3 = null;
local gTimeWeatherButton1 = null;
local gTimeWeatherButton2 = null;
local gTimeWeatherButton3 = null;
local gTimeWeatherButton4 = null;

local gPlayerManagerWindow = null;
local gPlayerManagerButton1 = null;
local gPlayerManagerButton2 = null;
local gPlayerManagerButton3 = null;
local gPlayerManagerButton4 = null;
local gPlayerManagerButton5 = null;
local gPlayerManagerButton6 = null;
local gPlayerManagerButton7 = null;
local gPlayerManagerLabel1 = null;
local gPlayerManagerLabel2 = null;
local gPlayerManagerLabel3 = null;
local gPlayerManagerLabel4 = null;
local gPlayerManagerLabel5 = null;
local gPlayerManagerLabel6 = null;
local gPlayerManagerLabel7 = null;
local gPlayerManagerEditbox1 = null;
local gPlayerManagerProgressbar1 = null;
local gPlayerManagerProgressbar2 = null;

//local gMiscWindow = null; // for future use

local gGameSettingsWindow = null;
local gGameSettingsLabel1 = null;
local gGameSettingsLabel2 = null;
local gGameSettingsLabel3 = null;
local gGameSettingsLabel4 = null;
local gGameSettingsLabel5 = null;
local gGameSettingsLabel6 = null;
local gGameSettingsEditbox1 = null;
local gGameSettingsEditbox2 = null;
local gGameSettingsCheckbox1 = null;
local gGameSettingsCheckbox2 = null;
local gGameSettingsCheckbox3 = null;
local gGameSettingsCheckbox4 = null;
local gGameSettingsButton0 = null;
local gGameSettingsButton1 = null;

local iMaxPlayers = 0;
local iWeatherID = 0;
local iPlayerID = 0;

function onScriptLoad()
{
	ConsoleMessage( "This server is using AdminPanel v" + SCRIPT_VERSION + " by " + SCRIPT_AUTHOR + "." );
	ConsoleMessage( CONSOLE_PREFIX + " Using language: " + LANGUAGE_NAME + " by " + LANGUAGE_AUTHOR + "." );
	
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
	gTitleButton0.Visible = true;
	
	/* Time & Weather button */
	gTitleButton1 = GUIButton( VectorScreen( twButton1[0], twButton1[1] ), ScreenSize( twButton1[2], twButton1[3] ), twButton1[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton1.Colour = GUI_BUTTON_COLOR;
	gTitleButton1.FontTags = TAG_BOLD;
	gTitleButton1.SetCallbackFunc( Menu1_Handle1 );
	gTitleButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton1.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton1.Visible = false;
	
	/* Player Manager button */
	gTitleButton2 = GUIButton( VectorScreen( twButton2[0], twButton2[1] ), ScreenSize( twButton2[2], twButton2[3] ), twButton2[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton2.Colour = GUI_BUTTON_COLOR;
	gTitleButton2.FontTags = TAG_BOLD;
	gTitleButton2.SetCallbackFunc( Menu1_Handle2 );
	gTitleButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton2.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton2.Visible = false;
	
	/* Vehicle Manager button */
	gTitleButton3 = GUIButton( VectorScreen( twButton3[0], twButton3[1] ), ScreenSize( twButton3[2], twButton3[3] ), twButton3[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton3.Colour = GUI_BUTTON_COLOR;
	gTitleButton3.FontTags = TAG_BOLD;
	//gTitleButton3.SetCallbackFunc( Menu1_Handle3 );
	gTitleButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton3.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton3.Visible = false;
	
	/* Misc button */
	gTitleButton4 = GUIButton( VectorScreen( twButton4[0], twButton4[1] ), ScreenSize( twButton4[2], twButton4[3] ), twButton4[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton4.Colour = GUI_BUTTON_COLOR;
	gTitleButton4.FontTags = TAG_BOLD;
	gTitleButton4.SetCallbackFunc( Menu1_Handle4 );
	gTitleButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton4.Alpha = GUI_ELEMENT_ALPHA;
	gTitleButton4.Visible = false;
	
	/* Game Settings button */
	gTitleButton5 = GUIButton( VectorScreen( twButton5[0], twButton5[1] ), ScreenSize( twButton5[2], twButton5[3] ), twButton5[4] );
	if ( GUI_BUTTON_COLOR ) gTitleButton5.Colour = GUI_BUTTON_COLOR;
	gTitleButton5.FontTags = TAG_BOLD;
	gTitleButton5.SetCallbackFunc( Menu1_Handle5 );
	gTitleButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTitleButton5.Alpha = GUI_ELEMENT_ALPHA;
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
	gTimeWeatherLabel1.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherLabel1.Visible = false;
	
	/* Weather Lock label */
	gTimeWeatherLabel2 = GUILabel( VectorScreen( timeweatherLabel2[0], timeweatherLabel2[1] ), ScreenSize( timeweatherLabel2[2], timeweatherLabel2[3] ), timeweatherLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel2.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel2.FontTags = TAG_BOLD;
	gTimeWeatherLabel2.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel2.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherLabel2.Visible = false;
	
	/* Set Time label */
	gTimeWeatherLabel3 = GUILabel( VectorScreen( timeweatherLabel3[0], timeweatherLabel3[1] ), ScreenSize( timeweatherLabel3[2], timeweatherLabel3[3] ), timeweatherLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel3.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel3.FontTags = TAG_BOLD;
	gTimeWeatherLabel3.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel3.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherLabel3.Visible = false;
	
	/* Set Weather label */
	gTimeWeatherLabel4 = GUILabel( VectorScreen( timeweatherLabel4[0], timeweatherLabel4[1] ), ScreenSize( timeweatherLabel4[2], timeweatherLabel4[3] ), timeweatherLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gTimeWeatherLabel4.Colour = GUI_WINDOW_COLOR;
	gTimeWeatherLabel4.FontTags = TAG_BOLD;
	gTimeWeatherLabel4.TextColour = GUI_TEXT_COLOR;
	gTimeWeatherLabel4.Alpha = GUI_ELEMENT_ALPHA;
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
	gTimeWeatherButton1.Visible = false;
	
	/* - button */
	gTimeWeatherButton2 = GUIButton( VectorScreen( timeweatherButton2[0], timeweatherButton2[1] ), ScreenSize( timeweatherButton2[2], timeweatherButton2[3] ), timeweatherButton2[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton2.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton2.FontTags = TAG_BOLD;
	gTimeWeatherButton2.SetCallbackFunc( Menu2_Handle3 );
	gTimeWeatherButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton2.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton2.Visible = false;
	
	/* Accept button */
	gTimeWeatherButton3 = GUIButton( VectorScreen( timeweatherButton3[0], timeweatherButton3[1] ), ScreenSize( timeweatherButton3[2], timeweatherButton3[3] ), timeweatherButton3[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton3.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton3.FontTags = TAG_BOLD;
	gTimeWeatherButton3.SetCallbackFunc( Menu2_Handle1 );
	gTimeWeatherButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton3.Alpha = GUI_ELEMENT_ALPHA;
	gTimeWeatherButton3.Visible = false;
	
	/* Cancel button */
	gTimeWeatherButton4 = GUIButton( VectorScreen( timeweatherButton4[0], timeweatherButton4[1] ), ScreenSize( timeweatherButton4[2], timeweatherButton4[3] ), timeweatherButton4[4] );
	if ( GUI_BUTTON_COLOR ) gTimeWeatherButton4.Colour = GUI_BUTTON_COLOR;
	gTimeWeatherButton4.FontTags = TAG_BOLD;
	gTimeWeatherButton4.SetCallbackFunc( Menu2_Handle0 );
	gTimeWeatherButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gTimeWeatherButton4.Alpha = GUI_ELEMENT_ALPHA;
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
	gPlayerManagerButton1.Visible = true;
	
	/* > button */
	gPlayerManagerButton2 = GUIButton( VectorScreen( playermanagerButton2[0], playermanagerButton2[1] ), ScreenSize( playermanagerButton2[2], playermanagerButton2[3] ), playermanagerButton2[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton2.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton2.FontTags = TAG_BOLD;
	gPlayerManagerButton2.SetCallbackFunc( Menu3_Handle3 );
	gPlayerManagerButton2.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton2.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton2.Visible = true;
	
	/* Kick button */
	gPlayerManagerButton3 = GUIButton( VectorScreen( playermanagerButton3[0], playermanagerButton3[1] ), ScreenSize( playermanagerButton3[2], playermanagerButton3[3] ), playermanagerButton3[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton3.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton3.FontTags = TAG_BOLD;
	gPlayerManagerButton3.SetCallbackFunc( Menu3_Handle4 );
	gPlayerManagerButton3.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton3.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton3.Visible = false;
	
	/* Kill button */
	gPlayerManagerButton4 = GUIButton( VectorScreen( playermanagerButton4[0], playermanagerButton4[1] ), ScreenSize( playermanagerButton4[2], playermanagerButton4[3] ), playermanagerButton4[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton4.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton4.FontTags = TAG_BOLD;
	gPlayerManagerButton4.SetCallbackFunc( Menu3_Handle5 );
	gPlayerManagerButton4.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton4.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton4.Visible = false;
	
	/* Freeze button */
	gPlayerManagerButton5 = GUIButton( VectorScreen( playermanagerButton5[0], playermanagerButton5[1] ), ScreenSize( playermanagerButton5[2], playermanagerButton5[3] ), playermanagerButton5[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton5.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton5.FontTags = TAG_BOLD;
	gPlayerManagerButton5.SetCallbackFunc( Menu3_Handle6 );
	gPlayerManagerButton5.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton5.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton5.Visible = false;
	
	/* Heal button */
	gPlayerManagerButton6 = GUIButton( VectorScreen( playermanagerButton6[0], playermanagerButton6[1] ), ScreenSize( playermanagerButton6[2], playermanagerButton6[3] ), playermanagerButton6[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton6.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton6.FontTags = TAG_BOLD;
	gPlayerManagerButton6.SetCallbackFunc( Menu3_Handle7 );
	gPlayerManagerButton6.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton6.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton6.Visible = false;

	/* Cancel button */
	gPlayerManagerButton7 = GUIButton( VectorScreen( playermanagerButton7[0], playermanagerButton7[1] ), ScreenSize( playermanagerButton7[2], playermanagerButton7[3] ), playermanagerButton7[4] );
	if ( GUI_BUTTON_COLOR ) gPlayerManagerButton7.Colour = GUI_BUTTON_COLOR;
	gPlayerManagerButton7.FontTags = TAG_BOLD;
	gPlayerManagerButton7.SetCallbackFunc( Menu3_Handle0 );
	gPlayerManagerButton7.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerButton7.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerButton7.Visible = true;
	
	/* Nickname label */
	gPlayerManagerLabel1 = GUILabel( VectorScreen( playermanagerLabel1[0], playermanagerLabel1[1] ), ScreenSize( playermanagerLabel1[2], playermanagerLabel1[3] ), playermanagerLabel1[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel1.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel1.FontTags = TAG_BOLD;
	gPlayerManagerLabel1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gPlayerManagerLabel1.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel1.Visible = true;
	
	/* Health label */
	gPlayerManagerLabel2 = GUILabel( VectorScreen( playermanagerLabel2[0], playermanagerLabel2[1] ), ScreenSize( playermanagerLabel2[2], playermanagerLabel2[3] ), playermanagerLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel2.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel2.FontTags = TAG_BOLD;
	gPlayerManagerLabel2.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel2.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel2.Visible = false;
	
	/* Armor label */
	gPlayerManagerLabel3 = GUILabel( VectorScreen( playermanagerLabel3[0], playermanagerLabel3[1] ), ScreenSize( playermanagerLabel3[2], playermanagerLabel3[3] ), playermanagerLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel3.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel3.FontTags = TAG_BOLD;
	gPlayerManagerLabel3.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel3.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel3.Visible = false;
	
	/* Skin label */
	gPlayerManagerLabel4 = GUILabel( VectorScreen( playermanagerLabel4[0], playermanagerLabel4[1] ), ScreenSize( playermanagerLabel4[2], playermanagerLabel4[3] ), playermanagerLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel4.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel4.FontTags = TAG_BOLD;
	gPlayerManagerLabel4.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel4.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel4.Visible = false;
	
	/* Ping label */
	gPlayerManagerLabel5 = GUILabel( VectorScreen( playermanagerLabel5[0], playermanagerLabel5[1] ), ScreenSize( playermanagerLabel5[2], playermanagerLabel5[3] ), playermanagerLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel5.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel5.FontTags = TAG_BOLD;
	gPlayerManagerLabel5.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel5.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel5.Visible = false;
	
	/* Vehicle label */
	gPlayerManagerLabel6 = GUILabel( VectorScreen( playermanagerLabel6[0], playermanagerLabel6[1] ), ScreenSize( playermanagerLabel6[2], playermanagerLabel6[3] ), playermanagerLabel6[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel6.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel6.FontTags = TAG_BOLD;
	gPlayerManagerLabel6.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel6.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel6.Visible = false;
	
	/* Mode label */
	gPlayerManagerLabel7 = GUILabel( VectorScreen( playermanagerLabel7[0], playermanagerLabel7[1] ), ScreenSize( playermanagerLabel7[2], playermanagerLabel7[3] ), playermanagerLabel7[4] );
	if ( GUI_WINDOW_COLOR ) gPlayerManagerLabel7.Colour = GUI_WINDOW_COLOR;
	gPlayerManagerLabel7.FontTags = TAG_BOLD;
	gPlayerManagerLabel7.TextColour = GUI_TEXT_COLOR;
	gPlayerManagerLabel7.Alpha = GUI_ELEMENT_ALPHA;
	gPlayerManagerLabel7.Visible = true;
	
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
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel2 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel3 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel4 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel5 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel6 );
	gPlayerManagerWindow.AddChild( gPlayerManagerLabel7 );
	gPlayerManagerWindow.AddChild( gPlayerManagerEditbox1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerProgressbar1 );
	gPlayerManagerWindow.AddChild( gPlayerManagerProgressbar2 );
	
	
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
	gGameSettingsLabel1.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsLabel1.Visible = false;
	
	/* Game gravity label */
	gGameSettingsLabel2 = GUILabel( VectorScreen( gamesettingsLabel2[0], gamesettingsLabel2[1] ), ScreenSize( gamesettingsLabel2[2], gamesettingsLabel2[3] ), gamesettingsLabel2[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel2.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel2.FontTags = TAG_BOLD;
	gGameSettingsLabel2.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel2.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsLabel2.Visible = false;
	
	/* Flying cars label */
	gGameSettingsLabel3 = GUILabel( VectorScreen( gamesettingsLabel3[0], gamesettingsLabel3[1] ), ScreenSize( gamesettingsLabel3[2], gamesettingsLabel3[3] ), gamesettingsLabel3[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel3.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel3.FontTags = TAG_BOLD;
	gGameSettingsLabel3.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel3.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsLabel3.Visible = false;
	
	/* Handling cheat label */
	gGameSettingsLabel4 = GUILabel( VectorScreen( gamesettingsLabel4[0], gamesettingsLabel4[1] ), ScreenSize( gamesettingsLabel4[2], gamesettingsLabel4[3] ), gamesettingsLabel4[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel4.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel4.FontTags = TAG_BOLD;
	gGameSettingsLabel4.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel4.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsLabel4.Visible = false;
	
	/* Friendly fire label */
	gGameSettingsLabel5 = GUILabel( VectorScreen( gamesettingsLabel5[0], gamesettingsLabel5[1] ), ScreenSize( gamesettingsLabel5[2], gamesettingsLabel5[3] ), gamesettingsLabel5[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel5.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel5.FontTags = TAG_BOLD;
	gGameSettingsLabel5.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel5.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsLabel5.Visible = false;
	
	/* SSV Bridge label */
	gGameSettingsLabel6 = GUILabel( VectorScreen( gamesettingsLabel6[0], gamesettingsLabel6[1] ), ScreenSize( gamesettingsLabel6[2], gamesettingsLabel6[3] ), gamesettingsLabel6[4] );
	if ( GUI_WINDOW_COLOR ) gGameSettingsLabel6.Colour = GUI_WINDOW_COLOR;
	gGameSettingsLabel6.FontTags = TAG_BOLD;
	gGameSettingsLabel6.TextColour = GUI_TEXT_COLOR;
	gGameSettingsLabel6.Alpha = GUI_ELEMENT_ALPHA;
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
	gGameSettingsButton0.Visible = true;
	
	/* Accept button */
	gGameSettingsButton1 = GUIButton( VectorScreen( gamesettingsButton1[0], gamesettingsButton1[1] ), ScreenSize( gamesettingsButton1[2], gamesettingsButton1[3] ), gamesettingsButton1[4] );
	if ( GUI_BUTTON_COLOR ) gGameSettingsButton1.Colour = GUI_BUTTON_COLOR;
	gGameSettingsButton1.FontTags = TAG_BOLD;
	gGameSettingsButton1.SetCallbackFunc( Menu4_Handle1 );
	gGameSettingsButton1.TextColour = GUI_BUTTON_TEXT_COLOR;
	gGameSettingsButton1.Alpha = GUI_ELEMENT_ALPHA;
	gGameSettingsButton1.Visible = false;
	
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
	
	return 1;
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
}

function ChangeMode()
{
	local pPlayer = FindPlayer( iPlayerID );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	
	if ( iConsoleMode == 0 )
	{
		iConsoleMode = 1;
		gPlayerManagerLabel7.Text = "[2/5] Mode: Private message";
		gPlayerManagerEditbox1.Text = "";
		UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
		if (( iAdminLevel < PLAYER_CONSOLE_MODE1 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 1 )
	{
		iConsoleMode = 2;
		gPlayerManagerLabel7.Text = "[3/5] Mode: Set health";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE2 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 2 )
	{
		iConsoleMode = 3;
		gPlayerManagerLabel7.Text = "[4/5] Mode: Set armor";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE3 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 3 )
	{
		iConsoleMode = 4;
		gPlayerManagerLabel7.Text = "[5/5] Mode: Set skin";
		gPlayerManagerEditbox1.Text = "";
		if (( iAdminLevel < PLAYER_CONSOLE_MODE4 ) || ( !pPlayer )) ChangeMode();
	}
	else if ( iConsoleMode == 4 )
	{
		iConsoleMode = 0;
		gPlayerManagerLabel7.Text = "[1/5] Mode: Find player";
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
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetHealth", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger() );
	
	gPlayerManagerEditbox1.Text = "";
}

function SetArmor()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetArmor", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger() );
	
	gPlayerManagerEditbox1.Text = "";
}

function SetSkin()
{
	if ( gPlayerManagerEditbox1.Text == "" ) return 1;
	
	local pPlayer = FindPlayer( iPlayerID );
	if ( !pPlayer ) return 1;
	
	CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetSkin", pLocalPlayer, pPlayer, gPlayerManagerEditbox1.Text.tointeger() );
	
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
	if ( !pPlayer ) return 1;
	
	local vCameraPosition = pPlayer.Pos;
	local vCameraPointAt = pPlayer.Pos;
	
	vCameraPosition.z += 20.0;
	
	SetCameraMatrix( vCameraPosition, vCameraPointAt );
}

function SpectatePlayer_Stop( )
{
	RestoreCamera();
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

function GameSettings_Update( fGameSpeed, fGameGravity, bFlyingCarsCheat, bHandlingCheat, bFriendlyFire, bSSVBridge )
{
	gGameSettingsEditbox1.Text = fGameSpeed.tostring();
	gGameSettingsEditbox2.Text = fGameGravity.tostring();
	gGameSettingsCheckbox1.Checked = bFlyingCarsCheat;
	gGameSettingsCheckbox2.Checked = bHandlingCheat;
	gGameSettingsCheckbox3.Checked = bFriendlyFire;
	gGameSettingsCheckbox4.Checked = bSSVBridge;
}

function ShowAdminPanel()
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
	
	//ShowTimeAndWheaterSettings()						// Set your default tab here
	
	if ( iAdminLevel >= TIME_WEATHER_ACCESS ) gTitleButton1.Visible = true;
	if ( iAdminLevel >= PLAYER_MANAGER_ACCESS ) gTitleButton2.Visible = true;
	//if ( iAdminLevel >= VEHICLE_MANAGER_ACCESS ) gTitleButton3.Visible = true; // for future use
	if ( iAdminLevel >= MISC_ACCESS ) gTitleButton4.Visible = true;
	if ( iAdminLevel >= GAME_ACCESS ) gTitleButton5.Visible = true;
	
	ShowMouseCursor( true );
	SetHUDItemEnabled( HUD_RADAR, false );
	pLocalPlayer.Frozen = true;
	
	gTitleWindow.Visible = true;
	
	SpectatePlayer_Process( pLocalPlayer );
	
	UnbindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
}

function HideAdminPanel()
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
	
	gTitleWindow.Visible = false;
	gTimeWeatherWindow.Visible = false;
	gPlayerManagerWindow.Visible = false;
	gGameSettingsWindow.Visible = false;
	
	ShowMouseCursor( false );
	SetHUDItemEnabled( HUD_RADAR, true );
	pLocalPlayer.Frozen = false;
	
	SpectatePlayer_Stop();
	
	UnbindKey( BIND_KEY, BINDTYPE_DOWN, "HideAdminPanel" );
	BindKey( BIND_KEY, BINDTYPE_DOWN, "ShowAdminPanel" );
}

function ShowTimeAndWheaterSettings()
{
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
		gTimeWeatherWindow.Visible = true;
		
		SetCameraMatrix( Vector( -739.0, 480.0, 132.0 ), Vector( -653.0, -575.0, 29.0 ) );
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
		gPlayerManagerLabel6.Text = "Vehicle: 0";
		gPlayerManagerButton3.Visible = false;
		gPlayerManagerButton4.Visible = false;
		gPlayerManagerButton5.Visible = false;
		gPlayerManagerButton6.Visible = false;
		gPlayerManagerLabel2.Visible = false;
		gPlayerManagerLabel3.Visible = false;
		gPlayerManagerLabel4.Visible = false;
		gPlayerManagerLabel5.Visible = false;
		gPlayerManagerLabel6.Visible = false;
		gPlayerManagerProgressbar1.Visible = false;
		gPlayerManagerProgressbar2.Visible = false;
		
		ChangeMode();
		
		SpectatePlayer_Process( pLocalPlayer );
	}
	else
	{
		gPlayerManagerLabel1.Text = pPlayer.Name + " (" + iPlayerID + "/" + iMaxPlayers + ")";
		gPlayerManagerLabel2.Text = "Health: " + pPlayer.Health;
		gPlayerManagerLabel3.Text = "Armor: " + pPlayer.Armour;
		gPlayerManagerLabel4.Text = "Skin: " + pPlayer.Skin;
		gPlayerManagerLabel5.Text = "Ping: " + pPlayer.Ping + "ms";
		//gPlayerManagerLabel6.Text = "Vehicle: " + pPlayer.Vehicle.Model;
		gPlayerManagerProgressbar1.Value = pPlayer.Health;
		gPlayerManagerProgressbar2.Value = pPlayer.Armour;
		if ( pPlayer.Frozen ) gPlayerManagerButton5.Text = "Unfreeze";
		else gPlayerManagerButton5.Text = "Freeze";

		if ( iAdminLevel >= PLAYER_MANAGER_KICK ) gPlayerManagerButton3.Visible = true;
		if ( iAdminLevel >= PLAYER_MANAGER_KILL ) gPlayerManagerButton4.Visible = true;
		if ( iAdminLevel >= PLAYER_MANAGER_FREEZE ) gPlayerManagerButton5.Visible = true;
		if ( iAdminLevel >= PLAYER_MANAGER_HEAL ) gPlayerManagerButton6.Visible = true;

		gPlayerManagerLabel2.Visible = true;
		gPlayerManagerLabel3.Visible = true;
		gPlayerManagerLabel4.Visible = true;
		gPlayerManagerLabel5.Visible = true;
		//gPlayerManagerLabel6.Visible = true;
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
		gPlayerManagerWindow.Visible = false;
	}
	else
	{
		if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_MENU );
		gTimeWeatherWindow.Visible = false;
		gGameSettingsWindow.Visible = false;
		gPlayerManagerWindow.Visible = true;
	}
}

function ShowGameSettings()
{
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
		}
		if ( iAdminLevel >= GAME_SETTINGS_GRAVITY )
		{	
			gGameSettingsLabel2.Visible = true;		
			gGameSettingsEditbox2.Visible = true;
			gGameSettingsButton1.Visible = true;
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
		gGameSettingsWindow.Visible = true;
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
	ShowTimeAndWheaterSettings();
}

function Menu1_Handle2()		// Player Manager
{
	if ( !gTitleButton2.Visible ) return;
	ShowPlayerManager();
}

function Menu1_Handle3()		// Vehicle Manager, future use
{
	if ( !gTitleButton3.Visible ) return;
}

local isnd = 0;
function Menu1_Handle4()		// Misc, future use
{
	if ( !gTitleButton4.Visible ) return;
	isnd++;
	Message( isnd.tostring() );
	PlayFrontEndSound( isnd );
}
function Menu1_Handle5()		// Game Setting
{
	if ( !gTitleButton5.Visible ) return;
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
	local iWeID = gTimeWeatherEditbox3.Text.tointeger();
	local iHour = gTimeWeatherEditbox1.Text.tointeger();
	local iMin = gTimeWeatherEditbox2.Text.tointeger();
	iWeatherID = iWeID;
	
	CallServerFunc( "adminpanel/server.nut", "TimeAndWeather_Accept", pLocalPlayer, iWeID, iHour, iMin, gTimeWeatherCheckbox1.Checked, gTimeWeatherCheckbox2.Checked );
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
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_EXIT );
	UnbindKey( KEY_RETURN, BINDTYPE_DOWN, "ProcessConsoleMessage" );
	UnbindKey( KEY_END, BINDTYPE_DOWN, "ChangeMode" );
	gPlayerManagerWindow.Visible = false;
}

function Menu3_Handle1()		// Accept, for future use?
{
}

function Menu3_Handle2()		// <
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iPlayerID == 0 ) return 1;
	
	iPlayerID--;
	local pPlayer = FindPlayer( iPlayerID );
	
	PlayerMenagerRefresh();
}

function Menu3_Handle3()		// >
{
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	if ( iPlayerID == iMaxPlayers ) return 1;
	
	iPlayerID++;
	
	PlayerMenagerRefresh();
}

function Menu3_Handle4()		// Kick
{
	if ( !gPlayerManagerButton3.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Kick", pLocalPlayer, pPlayer );
}

function Menu3_Handle5()		// Kill
{
	if ( !gPlayerManagerButton4.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer )  CallServerFunc( "adminpanel/server.nut", "PlayerManager_Kill", pLocalPlayer, pPlayer );
}

function Menu3_Handle6()		// Freeze
{
	if ( !gPlayerManagerButton5.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_SetFreeze", pLocalPlayer, pPlayer, !pPlayer.Frozen );
}

function Menu3_Handle7()		// Heal
{
	if ( !gPlayerManagerButton6.Visible ) return 1;
	if ( SOUND_ENABLED ) PlayFrontEndSound( SOUND_CLICK );
	local pPlayer = FindPlayer( iPlayerID );
	if ( pPlayer ) CallServerFunc( "adminpanel/server.nut", "PlayerManager_Heal", pLocalPlayer, pPlayer );
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


function onClientRender()
{
	if ( gPlayerManagerWindow.Visible ) PlayerMenagerRefresh();
	if ( gGameSettingsWindow.Visible ) SpectatePlayer_Process( pLocalPlayer );
	if ( gTitleWindow.Visible ) pLocalPlayer.Frozen = true;
	return 1;
}
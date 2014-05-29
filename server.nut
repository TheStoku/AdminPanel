/* ############################################################## */
/* #			Admin Panel v1.0 by Stoku						# */
/* #					Have fun!								# */
/* ############################################################## */

local ADMIN_ECHO 			= 2; // admin action echo: 0=off / 1=action / 2=action+admin nickname
local CONSOLE_PREFIX		= "[AP]";

function onScriptLoad()
{
	print("Admin Panel v1.0 - Loaded!");
	return 1;
}

function onPlayerJoin( pPlayer )
{
	//SetAdminLevel( pPlayer, 1 );	// uncomment this for tests, it grants panel access for everyone
	
	return 1;
}

function AdminEcho( szText, pAdminPlayer )
{
	if ( !ADMIN_ECHO ) return 1;
	else if ( ADMIN_ECHO == 1 ) Message( CONSOLE_PREFIX + " " + szText );
	else if ( ADMIN_ECHO == 2 ) Message( CONSOLE_PREFIX + " " + szText + " (Admin: " + pAdminPlayer.Name + ")." );
}

function SetAdminLevel( pAdminPlayer, iLevel )
{
	AdminEcho( "Giving access...", pAdminPlayer );
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "SetAdminLevel", iLevel, GetMaxPlayers() );
}

function TimeAndWeather_LoadData( pAdminPlayer )
{
	local iWeatherID = GetWeather();
	local iHour = GetHour();
	local iMin = GetMinute();
	local bTimeLock = GetTimeLock();
	local bWeatherLock = GetWeatherLock();
	
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "TimeAndWeather_Update", iWeatherID, iHour, iMin, bTimeLock, bWeatherLock );
}

function TimeAndWeather_Accept( pAdminPlayer, iWeatherID, iHour, iMin, bTimeLock, bWeatherLock )
{
	SetWeather( iWeatherID );
	SetWeatherLock( bWeatherLock );
	SetTime( iHour, iMin );
	SetTimeLock( bTimeLock );
	
	AdminEcho( "Time & weather settings has been changed.", pAdminPlayer );
}

function TimeAndWeather_SetWeather( pAdminPlayer, iWeatherID )
{
	AdminEcho( "Changing weather to " + iWeatherID, pAdminPlayer );
	
	SetWeather( iWeatherID );
}

function PlayerManager_Kick( pAdminPlayer, pPlayer )
{
	KickPlayer( pPlayer );
	
	AdminEcho( pPlayer.Name + " has been kicked from the server.", pAdminPlayer );
}

function PlayerManager_Kill( pAdminPlayer, pPlayer )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Health = 0;
	
	AdminEcho( pPlayer.Name + " has been slayed.", pAdminPlayer );
}

function PlayerManager_SetFreeze( pAdminPlayer, pPlayer, bState )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Frozen = bState;
	
	if ( bState ) AdminEcho( pPlayer.Name + " has been frozen.", pAdminPlayer );
	else AdminEcho( pPlayer.Name + " has been unfrozen.", pAdminPlayer );
}

function PlayerManager_Heal( pAdminPlayer, pPlayer )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Health = 100;
	
	AdminEcho( pPlayer.Name + " has been healed.", pAdminPlayer );
}

function PlayerManager_Message( pAdminPlayer, pPlayer, szMessage )
{
	MessagePlayer( "[PM] " + pAdminPlayer.Name + ": " + szMessage, pPlayer, Colour( 0, 255, 0 ) );
}

function PlayerManager_SetHealth( pAdminPlayer, pPlayer, iHealth )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Health = iHealth;
	
	AdminEcho( pPlayer.Name + "'s health has been changed.", pAdminPlayer );
}

function PlayerManager_SetArmor( pAdminPlayer, pPlayer, iArmor )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Armour = iArmor;
	
	AdminEcho( pPlayer.Name + "'s armor has been changed.", pAdminPlayer );
}

function PlayerManager_SetSkin( pAdminPlayer, pPlayer, iSkin )
{
	if ( !pPlayer.Spawned ) return 1;
	
	pPlayer.Skin = iSkin;
	
	AdminEcho( pPlayer.Name + "'s skin has been changed.", pAdminPlayer );
}

function GameSettings_LoadData( pAdminPlayer )
{
	local fGameSpeed = GetGamespeed();
	local fGameGravity = GetGravity();
	local bFlyingCarsCheat = GetFlyingCars();
	local bHandlingCheat = GetHandlingCheat();
	local bFriendlyFire = GetFriendlyFire();
	local bSSVBridge = GetSSVBridgeLock();
	
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "GameSettings_Update", fGameSpeed, fGameGravity, bFlyingCarsCheat, bHandlingCheat, bFriendlyFire, bSSVBridge );
}

function GameSettings_Accept( pAdminPlayer, fGameSpeed, fGameGravity, bFlyingCarsCheat, bHandlingCheat, bFriendlyFire, bSSVBridge )
{
	SetGamespeed( fGameSpeed );
	SetGravity( fGameGravity );
	SetFlyingCars( bFlyingCarsCheat );
	SetHandlingCheat( bHandlingCheat );
	SetFriendlyFire( bFriendlyFire );
	SetSSVBridgeLock( bSSVBridge );
	
	AdminEcho( "Game settings has been changed.", pAdminPlayer );
}
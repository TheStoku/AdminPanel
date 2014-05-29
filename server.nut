/* ############################################################## */
/* #			Admin Panel v1.1 R2 by Stoku					# */
/* #					Have fun!								# */
/* ############################################################## */

local ADMIN_ECHO 			= 2; // admin action echo: 0=off / 1=action / 2=action+admin nickname
local CONSOLE_PREFIX		= "[AP]";

function onScriptLoad()
{
	print("Admin Panel v1.1 R2 - Loaded!");
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
	SetWeather( iWeatherID );
	AdminEcho( "Changing weather to " + iWeatherID, pAdminPlayer );
}

function PlayerManager_LoadData( pAdminPlayer, pPlayer )
{
	local szIP = pPlayer.IP;
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "PlayerManager_Update", szIP );
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
function PlayerManager_Ban( pAdminPlayer, pPlayer )
{
	BanPlayer( pPlayer );
	AdminEcho( pPlayer.Name + " has been banned from the server.", pAdminPlayer );
}
function PlayerManager_BanIP( pAdminPlayer, szIP )
{
	BanIP( szIP );
	AdminEcho( "IP: " + szIP + " has been banned from the server.", pAdminPlayer );
}
function PlayerManager_UnbanIP( pAdminPlayer, szIP )
{
	UnbanIP( szIP );
	AdminEcho( "IP: " + szIP + " has been unbanned.", pAdminPlayer );
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
	if ( fGameSpeed ) SetGamespeed( fGameSpeed );
	if ( fGameGravity ) SetGravity( fGameGravity );
	SetFlyingCars( bFlyingCarsCheat );
	SetHandlingCheat( bHandlingCheat );
	SetFriendlyFire( bFriendlyFire );
	SetSSVBridgeLock( bSSVBridge );
	AdminEcho( "Game settings has been changed.", pAdminPlayer );
}
function GameSettings_SetSpeed( pAdminPlayer, fGameSpeed )
{
	SetGamespeed( fGameSpeed );
	AdminEcho( "Game speed has been changed.", pAdminPlayer );
}
function GameSettings_SetGravity( pAdminPlayer, fGravity )
{
	SetGravity( fGravity );
	AdminEcho( "Game speed has been changed.", pAdminPlayer );
}

function ServerSettings_LoadData( pAdminPlayer )
{
	local szServerName = GetServerName();
	local szMapName = GetMapName();
	local szGamemodeName = GetGamemodeName();
	local iMaxPlayers = GetMaxPlayers();
	local szPassword = GetPassword();
	local iPort = GetPort();
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "ServerSettings_Update", szServerName, szMapName, szGamemodeName, iMaxPlayers, szPassword, iPort );
}
function ServerSettings_Accept( pAdminPlayer, szServerName, szMapName, szGamemodeName, iMaxPlayers, szPassword, iPort )
{
	if ( szServerName ) SetServerName( szServerName );
	if ( szMapName ) SetMapName( szMapName );
	if ( szGamemodeName ) SetGamemodeName( szGamemodeName );
	if ( iMaxPlayers ) SetMaxPlayers( iMaxPlayers );
	if ( szPassword ) SetPassword( szPassword );
	else SetPassword( "" );
	if ( iPort ) SetPort( iPort );	
	AdminEcho( "Server settings has been changed.", pAdminPlayer );
}
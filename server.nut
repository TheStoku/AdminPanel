/* ############################################################## */
/* #			Admin Panel v1.2 by Stoku						# */
/* #					Have fun!								# */
/* ############################################################## */

local ADMIN_ECHO 			= 2; // admin action echo: 0=off / 1=action / 2=action+admin nickname / 3=important actions only / 4=important action+admin nickname
local CONSOLE_PREFIX		= "[AP]";


function onScriptLoad()
{
	playerList <- {};
	adminList <- {};
	
	print( "" );
	print( "---------- Welcome to Admin Panel v1.2 --------" );
	print( "" );
	
	Load();	// load settings/scripts
	
	print( "" );
	print( "Use 'help' to get list of available console commands." );
	print( "" );
	print( "-----------------------------------------------" );
	
	return 1;
}

function onPlayerJoin( pPlayer )
{
	playerList.rawset( pPlayer.Name, pPlayer.ID );
	
	//SetAdminLevel( pPlayer, 1 );	// uncomment this for tests, it grants panel access for everyone
	
	return 1;
}

function onPlayerPart( pPlayer, iReason )
{
	playerList.rawdelete( pPlayer.Name );
	
	if ( CheckAdmin( pPlayer ) ) adminList.rawdelete( pPlayer.Name );
}

function onPlayerSpawn( pPlayer, pSpawnClass )
{
	CallClientFunc( pPlayer, "adminpanel/client.nut", "SetSpawnState", true );
}

function onPlayerDeath( pPlayer, iReason )
{
	CallClientFunc( pPlayer, "adminpanel/client.nut", "SetSpawnState", false );
}

function onConsoleInput( szCommand, szText )
{
	if ( szCommand == "bridgelock" )
	{
		if ( !szText ) return 0;
		SetSSVBridgeLock( szText );
		print( "The SSV bridge lock has been changed." );
	}
	else if ( szCommand == "flyingcars" )
	{
		if ( !szText ) return 0;
		SetFlyingCars( szText.tointeger() );
		print( "The flying cars cheat has been changed." );
	}
	else if ( szCommand == "friendlyfire" )
	{
		if ( !szText ) return 0;
		SetFriendlyFire( szText.tointeger() );
		print( "The friendly fire has been changed." );
	}
	else if ( szCommand == "gamespeed" )
	{
		if ( !szText ) return 0;
		SetGamespeed( szText.tofloat() );
		print( "The game speed has been changed." );
	}
	else if ( szCommand == "gravity" )
	{
		if ( !szText ) return 0;
		SetGravity( szText.tofloat() );
		print( "The gravity has been changed." );
	}
	else if ( szCommand == "handlingcheat" )
	{
		if ( !szText ) return 0;
		SetHandlingCheat( szText.tointeger() );
		print( "The handling cheat has been changed." );
	}
	else if (( szCommand == "help" ) || ( szCommand == "cmd" ) || ( szCommand == "commands" ))
	{
		print( "Admin panel console commands:" );
		print( "" );
		print( "# bridgelock      <integer 0/1>" );
		print( "# flyingcars      <integer 0/1>" );
		print( "# friendlyfire    <integer 0/1>" );
		print( "# gamespeed       <float>" );
		print( "# gravity         <float>" );
		print( "# handlingcheat   <integer 0/1>" );
		print( "# time            <integer> <integer>" );
		print( "# timelock        <integer 0/1>" );
		print( "# weather         <integer>" );
		print( "# weatherlock     <integer 0/1>" );
		print( "" );
		print( "help, cmd, commands" );
	}
	else if ( szCommand == "time" )
	{
		if ( !szText ) return 0;
		//SetTime( szText.tointeger() );
		print( "The time has been changed." );
	}
	else if ( szCommand == "timelock" )
	{
		if ( !szText ) return 0;
		SetTimeLock( szText.tointeger() );
		print( "The time lock has been changed." );
	}
	else if ( szCommand == "weather" )
	{
		if ( !szText ) return 0;
		SetWeather( szText.tointeger() );
		print( "The weather has been changed." );
	}
	else if ( szCommand == "weatherlock" )
	{
		if ( !szText ) return 0;
		SetWeatherLock( szText.tointeger() );
		print( "The weather lock has been changed." );
	}
}

function Load()
{
	LoadModule( "lu_ini" );
	LoadModule( "lu_hashing" );
	
	// First start, load some settings
	if ( CountIniSection( "Scripts/adminpanel/config.ini", "server_config" ) < 6 )
	{
		print( "It seems to be your first launch, thank's for downloading! :)" );
		print( "Official topic:" );
		print( "http://forum.liberty-unleashed.co.uk/index.php/topic,1852.0.html" );
		print( "" );
		
		print( "# Config: creating server config file..." );
		WriteIniString( "Scripts/adminpanel/config.ini", "server_config", "ServerName", GetServerName() );
		WriteIniString( "Scripts/adminpanel/config.ini", "server_config", "MapName", GetMapName() );
		WriteIniString( "Scripts/adminpanel/config.ini", "server_config", "GamemodeName", GetGamemodeName() );
		WriteIniInteger( "Scripts/adminpanel/config.ini", "server_config", "MaxPlayers", GetMaxPlayers() );
		WriteIniString( "Scripts/adminpanel/config.ini", "server_config", "ServerPassword", GetPassword() );
		WriteIniInteger( "Scripts/adminpanel/config.ini", "server_config", "Port", GetPort() );
		WriteIniInteger( "Scripts/adminpanel/config.ini", "panel_config", "UseAutoloader", true );
		print( "# Config: server config created!" );
	}
	else
	{
		print( "# Config: loading server config file..." );
		SetServerName( ReadIniString( "Scripts/adminpanel/config.ini", "server_config", "ServerName" ));
		SetMapName( ReadIniString( "Scripts/adminpanel/config.ini", "server_config", "MapName" ));
		SetGamemodeName( ReadIniString( "Scripts/adminpanel/config.ini", "server_config", "GamemodeName" ));
		SetMaxPlayers( ReadIniInteger( "Scripts/adminpanel/config.ini", "server_config", "MaxPlayers" ));
		SetPassword( ReadIniString( "Scripts/adminpanel/config.ini", "server_config", "ServerPassword" ));
		SetPort( ReadIniInteger( "Scripts/adminpanel/config.ini", "server_config", "Port" ));
		print( "# Config: server config loaded!" );
	}
	
	if ( ReadIniBool( "Scripts/adminpanel/config.ini", "panel_config", "UseAutoloader" ) ) Autoload();
}

function Autoload()
{	
	print( "# Autoloader: loading module..." );
	
	if ( LoadModule( "../Scripts/adminpanel/modules/lu_GetFileList" ))
	{
		print( "# Autoloader: loading scripts..." );
		
		// Thanks to Thijn
		local list = GetFileList( "Scripts/adminpanel/autoload", "nut" );
		for( local i = 0; i < list.len(); i++ )
		{
			if ( list[i].slice(0,4) == "off_" ) return 0;
			else
			{
				dofile( "Scripts/adminpanel/autoload/" + list[i] );
				print( "# Autoloader: " + list[i] + " - loaded!" );
			}
		}
	}
	else print( "# Autoloader: failed to load module! Visit forums to find solution!" );
}

function AdminEcho( szText, pAdminPlayer )
{
	if ( !ADMIN_ECHO ) return 1;
	else if ( ADMIN_ECHO == 1 ) Message( CONSOLE_PREFIX + " " + szText );
	else if ( ADMIN_ECHO == 2 ) Message( CONSOLE_PREFIX + " " + szText + " (Admin: " + pAdminPlayer.Name + ")." );
	else if ( ADMIN_ECHO == 3 ) Message( CONSOLE_PREFIX + " " + szText );
	else if ( ADMIN_ECHO == 4 ) Message( CONSOLE_PREFIX + " " + szText + " (Admin: " + pAdminPlayer.Name + ")." );
}

function SetAdminLevel( pAdminPlayer, iLevel )
{
	if ( !pAdminPlayer ) return 0;
	
	if ( !iLevel )
	{
		adminList.rawdelete( pAdminPlayer.Name );
		AdminEcho( "Revoking admin access...", pAdminPlayer );
		CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "SetAdminLevel", iLevel, GetMaxPlayers() );
	}
	else
	{
		adminList.rawset( pAdminPlayer.Name, pAdminPlayer.ID );
		AdminEcho( "Giving admin access...", pAdminPlayer );
		CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "SetAdminLevel", iLevel, GetMaxPlayers() );
	}
}

function CLIENT_SetAdminLevel( pAdminPlayer, pPlayer, iLevel )
{
	if ( !pAdminPlayer ) return 0;
	if ( !pPlayer ) return 0;
	
	if ( !iLevel )
	{
		adminList.rawdelete( pAdminPlayer.Name );
		AdminEcho( "Revoking admin access for " + pPlayer.Name, pAdminPlayer );
		CallClientFunc( pPlayer, "adminpanel/client.nut", "SetAdminLevel", iLevel, 0 );
	}
	else
	{
		adminList.rawset( pAdminPlayer.Name, pAdminPlayer.ID );
		AdminEcho( "Giving admin access for " + pPlayer.Name, pAdminPlayer );
		CallClientFunc( pPlayer, "adminpanel/client.nut", "SetAdminLevel", iLevel, 0 );
	}
}

function CheckAdmin( pAdminPlayer )
{
	if ( !adminList.rawin( pAdminPlayer.Name ) ) return 0;
	
	if ( !pAdminPlayer )
	{
		AdminEcho( "Admin " + pPlayer.Name + " doesn't exist.", pAdminPlayer );
		return 0;
	}
	else return 1;
}

function TimeAndWeather_LoadData( pAdminPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	local iWeatherID = GetWeather();
	local iHour = GetHour();
	local iMin = GetMinute();
	local bTimeLock = GetTimeLock();
	local bWeatherLock = GetWeatherLock();
	
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "TimeAndWeather_Update", iWeatherID, iHour, iMin, bTimeLock, bWeatherLock );
}

function TimeAndWeather_Accept( pAdminPlayer, iWeatherID, iHour, iMin, bTimeLock, bWeatherLock )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	SetWeather( iWeatherID );
	SetWeatherLock( bWeatherLock );
	SetTime( iHour, iMin );
	SetTimeLock( bTimeLock );
	AdminEcho( "Time & weather settings has been changed.", pAdminPlayer );
}

function TimeAndWeather_SetWeather( pAdminPlayer, iWeatherID )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( ADMIN_ECHO < 3 ) AdminEcho( "Admin has changed the weather to " + iWeatherID, pAdminPlayer );
	SetWeather( iWeatherID );
}

function VehicleManager_Accept( pAdminPlayer, pVehicle, bLocked, bLights, bEngine )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	pVehicle.Locked = bLocked;
	if ( bLights ) pVehicle.LightState = LIGHTSTATE_ON;
	else pVehicle.LightState = LIGHTSTATE_AUTO;
	pVehicle.SetEngineState( bEngine );
	
	AdminEcho( "Admin has changed " + GetVehicleName( pVehicle ) + "'s settings.", pAdminPlayer );
}

function VehicleManager_LoadData( pAdminPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "VehicleManager_Update", GetVehicleCount() );
}

function VehicleManager_Fix( pAdminPlayer, pVehicle )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	pVehicle.Fix();
	AdminEcho( "Admin has fixed vehicle " + GetVehicleName( pVehicle ), pAdminPlayer );
}

function VehicleManager_Explode( pAdminPlayer, pVehicle )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	pVehicle.Explode( pAdminPlayer );
	AdminEcho( "Admin has exploded vehicle " + GetVehicleName( pVehicle ), pAdminPlayer );
}

function VehicleManager_Respawn( pAdminPlayer, pVehicle )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	pVehicle.Respawn();
	AdminEcho( "Admin has respawned vehicle " + GetVehicleName( pVehicle ), pAdminPlayer );
}
function VehicleManager_Remove( pAdminPlayer, pVehicle )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	pVehicle.Remove();
	AdminEcho( "Admin has removed vehicle " + GetVehicleName( pVehicle ), pAdminPlayer );
}
function VehicleManager_SetColor( pAdminPlayer, pVehicle, iColorID, R, G, B )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pVehicle ) return 0;
	
	if ( iColorID == 1 ) pVehicle.RGBColour1 = Colour( R, G, B );
	else pVehicle.RGBColour2 = Colour( R, G, B );
	if ( ADMIN_ECHO < 3 ) AdminEcho( "Admin has changed vehicle " + GetVehicleName( pVehicle ) + " color.", pAdminPlayer );
}


function PlayerManager_LoadData( pAdminPlayer, pPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pPlayer ) return 0;
	
	CallClientFunc( pAdminPlayer, "adminpanel/client.nut", "PlayerManager_Update", pPlayer.IP );
}

function PlayerManager_Kill( pAdminPlayer, pPlayer, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Health = 0;
		AdminEcho( pPlayer.Name + " has been slayed.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer( playerID ).Health = 0;
		}
		AdminEcho( "Admin has slayed all players.", pAdminPlayer );
	}
}

function PlayerManager_SetFreeze( pAdminPlayer, pPlayer, bState, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Frozen = bState;
		
		if ( bState ) AdminEcho( pPlayer.Name + " has been frozen.", pAdminPlayer );
		else AdminEcho( pPlayer.Name + " has been unfrozen.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer(playerID).Frozen = bState;
		}
		if ( bState ) AdminEcho( "Admin has frozen the all players.", pAdminPlayer );
		else AdminEcho( "Admin has unfrozen the all players.", pAdminPlayer );
	}
}

function PlayerManager_Heal( pAdminPlayer, pPlayer, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Health = 100;
		AdminEcho( pPlayer.Name + " has been healed.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer(playerID).Health = 100;
		}
		AdminEcho( "Admin has healed all players.", pAdminPlayer );
	}
}

function PlayerManager_SetHealth( pAdminPlayer, pPlayer, iHealth, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Health = iHealth;
		AdminEcho( pPlayer.Name + "'s health has been changed.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer(playerID).Health = iHealth;
		}
		AdminEcho( "Admin has changed health on all players.", pAdminPlayer );
	}
}

function PlayerManager_SetArmor( pAdminPlayer, pPlayer, iArmor, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Armour = iArmor;
		AdminEcho( pPlayer.Name + "'s armor has been changed.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer(playerID).Armour = iArmor;
		}
		AdminEcho( "Admin has changed armor on all players.", pAdminPlayer );
	}
}

function PlayerManager_SetSkin( pAdminPlayer, pPlayer, iSkin, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if ( !pPlayer.Spawned ) return 0;
		
		pPlayer.Skin = iSkin;
		AdminEcho( pPlayer.Name + "'s skin has been changed.", pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			FindPlayer(playerID).Skin = iSkin;
		}
		AdminEcho( "Admin has changed skin on all players.", pAdminPlayer );
	}
}

function PlayerManager_Teleport( pAdminPlayer, pPlayer, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if (( pPlayer == pAdminPlayer ) && ( !pPlayer.Spawned )) return 1;
		
		pAdminPlayer.Pos = pPlayer.Pos;
		AdminEcho( "Admin has been teleported to " + pPlayer.Name, pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			if ( playerID != pPlayer.ID ) FindPlayer(playerID).Pos = pPlayer.Pos;
		}
		AdminEcho( "Admin has teleported all players to " + pPlayer.Name, pAdminPlayer );
	}
}

function PlayerManager_Bring( pAdminPlayer, pPlayer, bAll )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( !bAll )
	{
		if ( !pPlayer ) return 0;
		if (( pPlayer == pAdminPlayer ) && ( !pPlayer.Spawned )) return 0;
		
		pPlayer.Pos = pAdminPlayer.Pos;
		AdminEcho( "Admin has bringed " + pPlayer.Name, pAdminPlayer );
	}
	else
	{
		foreach( playerID in playerList )
		{
			if ( playerID != pPlayer.ID ) FindPlayer(playerID).Pos = pAdminPlayer.Pos;
		}
		AdminEcho( "Admin has bringed all players.", pAdminPlayer );
	}
}

function PlayerManager_Message( pAdminPlayer, pPlayer, szMessage )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pPlayer ) return 0;
	
	MessagePlayer( "[PM] " + pAdminPlayer.Name + ": " + szMessage, pPlayer, Colour( 0, 255, 0 ) );
}

function PlayerManager_Kick( pAdminPlayer, pPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pPlayer ) return 0;
	
	KickPlayer( pPlayer );
	AdminEcho( pPlayer.Name + " has been kicked from the server.", pAdminPlayer );
}

function PlayerManager_Ban( pAdminPlayer, pPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	if ( !pPlayer ) return 0;
	
	BanPlayer( pPlayer );
	AdminEcho( pPlayer.Name + " has been banned from the server.", pAdminPlayer );
}

function PlayerManager_BanIP( pAdminPlayer, szIP )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	BanIP( szIP );
	AdminEcho( "IP: " + szIP + " has been banned from the server.", pAdminPlayer );
}

function PlayerManager_UnbanIP( pAdminPlayer, szIP )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	UnbanIP( szIP );
	AdminEcho( "IP: " + szIP + " has been unbanned.", pAdminPlayer );
}

function GameSettings_LoadData( pAdminPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
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
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
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
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	SetGamespeed( fGameSpeed );
	if ( ADMIN_ECHO < 3 ) AdminEcho( "Game speed has been changed.", pAdminPlayer );
}

function GameSettings_SetGravity( pAdminPlayer, fGravity )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	SetGravity( fGravity );
	if ( ADMIN_ECHO < 3 ) AdminEcho( "Game gravity has been changed.", pAdminPlayer );
}

function ServerSettings_LoadData( pAdminPlayer )
{
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
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
	if ( !CheckAdmin( pAdminPlayer )) return 0;
	
	if ( szServerName ) SetServerName( szServerName );
	if ( szMapName ) SetMapName( szMapName );
	if ( szGamemodeName ) SetGamemodeName( szGamemodeName );
	if ( iMaxPlayers ) SetMaxPlayers( iMaxPlayers );
	if ( szPassword ) SetPassword( szPassword );
	else SetPassword( "" );
	if ( iPort ) SetPort( iPort );	
	AdminEcho( "Server settings has been changed.", pAdminPlayer );
}
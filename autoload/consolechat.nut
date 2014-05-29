/* Console Chat - Sample script for autoloader feature */

ADMIN_NICKNAME <- "Admin";
COMMAND <- "c"


print("---------------- Console Chat ----------------");
print("Usage: " + COMMAND + " <text>");
if ( ADMIN_NICKNAME == "Admin" ) print("You can set your nickname with ADMIN_NICKNAME variable.");
print("---------------------------------------------");


function onConsoleInput( szCommand, szText )
{
	if ( szCommand == COMMAND ) Message( "[CONSOLE] [#FF0000]" + ADMIN_NICKNAME + "[#FFFFFF]: " + szText );
}
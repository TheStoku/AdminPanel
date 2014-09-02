#####################################################
#####################################################
### Admin Panel v1.3 by Stoku
### www.lck.vc-mp.pl
#####################################################
#####################################################

1. Informations
  A GUI admin panel.


2. Installation
  a) Unzip 'adminpanel.zip' to your 'Scripts' directory.
  b) Open 'content.xml' and add '<script folder="adminpanel"/>' in the bottom.
  c) Use 'SetAdminLevel( <player>, <int_level> )' to grant admin access.


3. Settings (server side)
  You can change some basic settings easly in the 'server.nut' source.

  a) ADMIN_ECHO - Admin action echo.
	default: 2
	params: 0 - off
		1 - prints only action
		2 - prints action and admin nickname
		3 - prints only important actions
		4 - prints important actions + admin nickname

  b) CONSOLE_PREFIX - prefix used in messages, eg. in admin action message. You can leave it empty or change it to anything.
	default: "[AP]"

  c) LOGIN_COMMAND - Admin login command (string). Leaving empty disables this way of login.
	default: "aplogin"

  d) ADMIN_PASSWORD - Admin login password (string). Leaving empty disables this way of login.
	default: "pass"

  e) ADMIN_LEVEL - Default admin level for password login (integer).
	default: 1

  f) ADMIN_LOGIN_ATTEMPTS - Max login attempts before ban.
	default: 3

  g) LUID_AUTOLOGIN - Enable/disable autologin with LUID (boolean). LUID's are stored automatically in "admins.ini".


4. Settings (Client side)
  There are many settings in the client side script. Most of them are commented. Look for:

  a) /* Basic settings */
  b) /* Admin access configuration */	
  c) /* Sound schemes */
  d) /* GUI Color schemes */
  e) /* Color palette */

5. Script autoload feature
  The panel includes autoload feature. Just paste any '.nut' server side scripts into 'adminpanel/autoload/' directory.


5. Visit
  www.lck.vc-mp.pl
  www.murzyn.vc-mp.pl
  www.vc-mp.pl
  www.celakarna.pl


6. Thanks
- NC for testing, ideas and best blog ever
- Gudio for webhosting and some tips
- himselfe for a loop method
- Thijn for lu_GetFileList module
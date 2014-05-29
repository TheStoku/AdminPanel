/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*
*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
/*/*/*/*/*/*/*/*/* Admin Panel v1.0 by Stoku */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*
*/*/*/*/*/*/*/*/*/*/*/*/ www.lck.vc-mp.pl */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*
*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/

1. Informations
  A simple admin panel.

2. Installation
  
  a) Unzip `adminpanel.zip` to your `Scripts` directory.
  b) Open `content.xml` and add `<script folder="adminpanel"/>` in the bottom.
  c) Use `SetAdminLevel( pAdminPlayer, 1 )` to grant admin access.


3. Settings (server side)
  You can change some basic settings easly in the `server.nut` source.

  a) ADMIN_ECHO - Admin action echo.
	default: 2
	params: 0 - off
		1 - prints only action
		2 - prints action and admin nickname
  b) CONSOLE_PREFIX - prefix used in messages, eg. in admin action message. You can leave it empty or change it to anything.
	default: "[AP]"


4. Settings (Client side)
  There are many settings in the client side script. Most of them are commented. Look for:

  a) /* Basic settings */	
  b) /* Sound schemes */
  c) /* GUI Color schemes */


5. Visit

  www.lck.vc-mp.pl
  www.celakarna.pl
  www.murzyn.vc-mp.pl


6. Thanks
- NC for testing
# phpMyAdmin default Apache configuration

Alias /phpmyadmin /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin>
	Options FollowSymLinks
	DirectoryIndex index.php

	<IfModule mod_php5.c>
		AddType application/x-httpd-php .php

		php_flag magic_quotes_gpc Off
		php_flag track_vars On
		php_flag register_globals Off
		php_admin_flag allow_url_fopen Off
		php_value include_path .
		php_admin_value upload_tmp_dir /var/lib/phpmyadmin/tmp
		php_admin_value open_basedir /usr/share/phpmyadmin/:/etc/phpmyadmin/:/var/lib/phpmyadmin/:/usr/share/php/php-gettext/:/usr/share/javascript/
	</IfModule>

</Directory>

# Authorize for setup
<Directory /usr/share/phpmyadmin/setup>
    <IfModule mod_authn_file.c>
    AuthType Basic
    AuthName "phpMyAdmin Setup"
    AuthUserFile /etc/phpmyadmin/htpasswd.setup
    </IfModule>
    Require valid-user
</Directory>

# Disallow web access to directories that don't need it
<Directory /usr/share/phpmyadmin/libraries>
    Order Deny,Allow
    Deny from All
</Directory>
<Directory /usr/share/phpmyadmin/setup/lib>
    Order Deny,Allow
    Deny from All
</Directory>

<VirtualHost *:80>
    DocumentRoot /usr/share/phpmyadmin
    ServerName {{ item.hostname }}
    ServerAlias www.{{ item.hostname }}
</VirtualHost>
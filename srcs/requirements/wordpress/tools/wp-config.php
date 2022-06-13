<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'bahn' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'y$Q}0)@<VoLpL:f?,P*bUV+-@oD.X`;q[$@ovV:m!:B-DLBR/xqf2Q=${E^|smt[');
define('SECURE_AUTH_KEY',  'I%g&OQ^9Mlu7Q,xQ-mQ+fOp:Gd&|QfFp]_p%2x&xY;-q|$.8{i=IHoxW[:607YU2');
define('LOGGED_IN_KEY',    'O1cL;BxN9R_-B|[p*-oO{fZRp[c_%OTd?vSd?BPX/9E!>||*M1Q4/13-:^FJ&$v$');
define('NONCE_KEY',        ',9(HoJOlWdeW1Gfj+zG]3?z}5(c#G:&*D9+E6Vm>Z#0am.1ox9|BO<A1&Ww-Lns<');
define('AUTH_SALT',        'a5|`$U&s$Y!t?EboRa0MDG61+p|:|:{=`7;93aB9PQLr}kF=|pW-.X:HlS4:`ViV');
define('SECURE_AUTH_SALT', 'zmZIaIe2,MYEz6n}yCq[B+gTn;Kk|x%`rZ~OUW)*?bLL)+eC*jiI(Bdo=RQEeZ/_');
define('LOGGED_IN_SALT',   '_-S2yp|Sd; T,x?U:NL&:A<BeQ&pRDVySO%<[]:Z[fGi:|MYzq|=bn`.Z{&L+.Q1');
define('NONCE_SALT',       ';ABcy&+8RpFtOmkOr2Ex=|ddI~p%QiMvdavYf)Z_~oWq/T!Q{>RRw:C`{+BkV6@+');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
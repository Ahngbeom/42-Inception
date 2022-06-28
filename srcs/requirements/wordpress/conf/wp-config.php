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
define( 'DB_NAME', $MARIADB_DATABASE );

/** Database username */
define( 'DB_USER', $MARIADB_USER );

/** Database password */
define( 'DB_PASSWORD', $MARIADB_PASSWORD );

/** Database hostname */
define( 'DB_HOST', $MARIADB_HOST );

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
define('AUTH_KEY',         'ymF4n:K|.|znP5$uN<65c^q_rJXcp(YeI0_,m;o7S*$uyw,ee!+|pT$bp_-?daIc');
define('SECURE_AUTH_KEY',  '{Yx6/@B;Uqx3{gB2``f_;[-C&k_zSk,rCOVA+p?(D(xP~_}#y{nBq%J(?hm@5+|z');
define('LOGGED_IN_KEY',    '@1,(f<1dqd_P0u%szM-Y>N=>#!]32g^tD*4I^U%In;mSW1a7nM?QFcxm.96r! n*');
define('NONCE_KEY',        'g&gW9D>)@t!+CxoHvr@&o_[`Q=J{r{Lsrk]yYjnnN`On*Rk^eQ<lKzN7+@!>:/04');
define('AUTH_SALT',        '[I$(EDy>h?Dp| ~euR7xi2jn<Suk(*a4k|8|1#&6lGK@~+7PUEq9N8N79Xd-|g6A');
define('SECURE_AUTH_SALT', 'hc?|/I%tn-Ry55#5i+G5J) .<fpcK`[.X]#oAq&00gPPX+9czpphQ.G^2|_k 2pl');
define('LOGGED_IN_SALT',   'q#J<Om]D`&?qRsU~msc?h1#Gb5d5#..asATns+XW3c*k2=t|0R>nKSjm-/5^Q}!>');
define('NONCE_SALT',       'g{6,!rQT+bj-+rzp;K[0?5?{C8~-]-4+u=QW{*Zbfn[O|V|o=[Dgi_<aZl+>zLqh');

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

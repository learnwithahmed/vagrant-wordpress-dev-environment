<?php

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('VWDE_ENVIRONMENT', getenv('APP_ENV') ?: 'local');

if ( VWDE_ENVIRONMENT == 'local' ) {
	define('DB_NAME', getenv('DB_NAME'));
	define('DB_USER', getenv('DB_USER'));
	define('DB_PASSWORD', getenv('DB_PASSWORD'));
	define('DB_HOST', getenv('DB_HOST'));
	define('WP_HOME', 'http://' . getenv('DOMAIN'));

	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	define('WP_DEBUG', true);
	define('WP_DEBUG_LOG', true);
	/* define('WP_DEBUG_DISPLAY', true); */
	define('WP_DEBUG_DISPLAY', false);
	define('SAVEQUERIES', 1);
} else {
	// Live credentials
	define('DB_NAME', getenv('DB_NAME'));
	define('DB_USER', getenv('DB_USER'));
	define('DB_PASSWORD', getenv('DB_PASSWORD'));
	define('DB_HOST', getenv('DB_HOST'));
	define('WP_HOME', getenv('WP_HOME'));
	define('WP_DEBUG', false);
}
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', 'utf8mb4_unicode_ci');

// Wordpress Dir
define('WP_SITEURL', WP_HOME . '/wp');
// Symlink wp-content from wp to ./wp-content
define('WP_CONTENT_URL', WP_HOME . '/wp-content');
define('WP_CONTENT_DIR', dirname(__FILE__) . '/wp-content');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'FpPJj{0>b`Dyb}p0&0x]T-V#:=2jyhlo,Y8?Wi^r)^:5+/ fYGcV*>~_a>jj_``*');
define('SECURE_AUTH_KEY',  '@z{;;@}_Z5N.bTjUf07L9[/9TXCC.Y+Lg+rd0=t}rdaEX[GoNl~$42WWn!Mo?`qk');
define('LOGGED_IN_KEY',    'EqUS^QB$(Ta!ak6>Rs|uRwaVtX{607m-~kK7Y} alSS9HAwE:WJR@S;D(y5PgWA ');
define('NONCE_KEY',        'cr{C-Dc.p-c`y%1-MB+-Rd;tjgQ-SSqQn&X:]93+Dn$3Aofhcd>it93o#my0iO}H');
define('AUTH_SALT',        'N=5st,36,#VH{kTY}sb+B^|)b-:C4)VPywEAC&Q7`Xa`)GuTR+~Y[h.|IV,zA4K|');
define('SECURE_AUTH_SALT', '}pRKFD]jR28(+~Q8Kv{(TgO 2r5M;|z&.VTpDWee!f@tl!/sh,=,?Os4|80YI(Y|');
define('LOGGED_IN_SALT',   'q{0`4+HVHYV<rV7;+N^KdJ=6}ngK+G,i@>7I@vBP#bYueYE~`%8y,jl6fc+a*/(]');
define('NONCE_SALT',       ',Kdl,[-Q4kxJw-&UZpzz6~ubRaIFyePqGUhnR=F])Ura(fN+_`=`gO790)/g9P?p');

$table_prefix  = 'wp_';


/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

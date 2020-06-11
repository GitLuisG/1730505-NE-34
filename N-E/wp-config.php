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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'N-E' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'B:$KoiAJp><-ZcE)R2uF=*Pe[4>_PU9N5ZKueOUhalJI$v!f%|jW9pqb n6-@O7<' );
define( 'SECURE_AUTH_KEY',  '5*[CJ,P_;HM<{!vh(G**=rYLI6^~5Cjqb,R])4QM[3D<:|gv_3@<p&Q>$U2bpg:K' );
define( 'LOGGED_IN_KEY',    'Ltl0*Y`r0atDNF6Q.GC^fzujJM. |<7x_biNukZA|n8Byuioe@,N#u;/;x/M/X*5' );
define( 'NONCE_KEY',        'W@=U<X:uJR|c]w[Gy!V&mp`I5>4^X)c&~p$7LQ~Kd*{bm/_}Aa8*;u=y<A:|0rT3' );
define( 'AUTH_SALT',        '4$$F.X-u iH{qHA5#K*r){)Z5#rq-6]B.{ ~gZ$o%V@T.(xKP@HHZoq.AuX1pyB%' );
define( 'SECURE_AUTH_SALT', 'fHE5ymFhMpuRhRr.szGhC,nw=KB Y}o+bss+x|4d2$_DFPOIgx>S9c&3U&)*$ir&' );
define( 'LOGGED_IN_SALT',   'P>3luCb/uMDUY~p+!`mih}(b)qAg]0]J~WEn~UHA_4p{|<($OWwdW/y!w$dz{T:j' );
define( 'NONCE_SALT',       ':zH-&$*t{rHdKRe&GH&+kmcJ9A8`WK-{CkW-F%nv[cX2_i*A4*uqLvn?X0RoJG1I' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

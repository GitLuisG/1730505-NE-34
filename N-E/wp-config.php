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
define( 'DB_NAME', 'n-e' );

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
define( 'AUTH_KEY',         '_3#=ZY_!-[HQ+W9]O>>W[iS|#d|QRKH1&wS..?DrQ5LE?_j3!M%ndwn=7{$FB,{G' );
define( 'SECURE_AUTH_KEY',  'sTk~n@Ewu A1yl|pjylhqyfu86ZQF.#XpDWpHR3sy-{C-WQk*hm7wRgAz@R0,Q[U' );
define( 'LOGGED_IN_KEY',    '|OH_/B]J%jBGtCs%ha|{;chC0;z.-3q1IumX/) <$~hR@nKvBN5HU|ng^x]-JF)t' );
define( 'NONCE_KEY',        'P!=(jr~z_BQJ00eHPz,9<~!jBSSzeBk@GUJ0;8|%k!<JW*#@Jb%MPEN!-4;E#~_@' );
define( 'AUTH_SALT',        'kW;S fr@[j2UB0]s#J=Df=QRq`d%-tF,K>PVOPt.3(GP%|^t^R/u$8Q#)C{tY{GQ' );
define( 'SECURE_AUTH_SALT', '.u34(98VCFGJvFTj046ZMun[]ZKO=,[V+)Kx4x*-LQ8IG=8d+Jn?) c#Z;Z-hD7I' );
define( 'LOGGED_IN_SALT',   'Gq)|?3,V,yPBa+icmyw;Df<DF2q!FtSjR(:AYR$84:NJn4N(do{KO:aL_`HS<d-=' );
define( 'NONCE_SALT',       'L,U~fR6.fMSPlW?C:3twd8eh /AfE{]@tI3r.clAQK_7B5&4PPh38 rLS5FGSJG0' );

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

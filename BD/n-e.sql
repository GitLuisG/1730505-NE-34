-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2020 a las 11:41:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `n-e`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(6, 'action_scheduler/migration_hook', 'complete', '2020-05-15 18:38:20', '2020-05-15 18:38:20', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1589567900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1589567900;}', 2, 1, '2020-05-15 18:40:14', '2020-05-15 18:40:14', 0, NULL),
(7, 'action_scheduler/migration_hook', 'canceled', '2020-05-15 18:38:20', '2020-05-15 18:38:20', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1589567900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1589567900;}', 1, 0, '2020-05-15 18:40:12', '2020-05-15 18:40:12', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 6, 'action created', '2020-05-15 18:37:21', '2020-05-15 18:37:21'),
(2, 7, 'action created', '2020-05-15 18:37:21', '2020-05-15 18:37:21'),
(3, 6, 'action started via Async Request', '2020-05-15 18:40:13', '2020-05-15 18:40:13'),
(4, 7, 'action canceled', '2020-05-15 18:40:14', '2020-05-15 18:40:14'),
(5, 6, 'action complete via Async Request', '2020-05-15 18:40:14', '2020-05-15 18:40:14'),
(6, 7, 'action ignored via Async Request', '2020-05-15 18:40:14', '2020-05-15 18:40:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-05-14 19:28:05', '2020-05-14 19:28:05', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/N-E', 'yes'),
(2, 'home', 'http://localhost/N-E', 'yes'),
(3, 'blogname', 'WooStore', 'yes'),
(4, 'blogdescription', 'Es importante conocer de productos al elegir una buena tienda.', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', '1730505@upv.edu.mx', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'closed', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:147:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:36:\"producto/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"producto/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"producto/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"producto/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"producto/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"producto/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"producto/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:29:\"producto/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:37:\"producto/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:44:\"producto/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:34:\"producto/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:40:\"producto/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:51:\"producto/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:33:\"producto/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:25:\"producto/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"producto/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"producto/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"producto/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"producto/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"producto/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:19:\"akismet/akismet.php\";i:1;s:9:\"hello.php\";i:2;s:23:\"ml-slider/ml-slider.php\";i:3;s:25:\"simple-css/simple-css.php\";i:4;s:27:\"woocommerce/woocommerce.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:61:\"C:\\xampp\\htdocs\\N-E/wp-content/themes/1589867191-tg/style.css\";i:2;s:60:\"C:\\xampp\\htdocs\\N-E/wp-content/themes/twentytwenty/style.css\";i:3;s:0:\"\";}', 'no'),
(40, 'template', '1589867191-tg', 'yes'),
(41, 'stylesheet', '1589867191-tg', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:3:{i:2;a:4:{s:5:\"title\";s:20:\"Acerca de este sitio\";s:4:\"text\";s:96:\"Este puede ser un buen lugar para presentarte a ti y a tu sitio o para incluir algunos méritos.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:13:\"Encuéntranos\";s:4:\"text\";s:162:\"<strong>Dirección</strong>\nCalle Principal 123\nNew York, NY 10001\n\n<strong>Horas</strong>\nLunes a viernes: de 9:00AM a 5:00PM\nSábado y domingo: 11:00AM a 3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '30', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1605036474', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'es_MX', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:18:{i:1589967642;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1589970493;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1589970781;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1589971034;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1589971050;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1589978227;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1589999837;a:2:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1589999838;a:1:{s:14:\"wc_admin_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590002890;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590002894;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1590002918;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590002919;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590002926;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590010627;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590019200;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590175691;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1590863887;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"fifteendays\";s:4:\"args\";a:0:{}s:8:\"interval\";i:1296000;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'recovery_keys', 'a:1:{s:22:\"5lceNDFHHv6FedB5R0cAoN\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BQykSUTnXQbyChkHPJkRrRI/8gqHXb/\";s:10:\"created_at\";i:1589956189;}}', 'yes'),
(116, 'theme_mods_twentytwenty', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"background_color\";s:3:\"fff\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1589791378;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(126, '_site_transient_timeout_browser_f19b58781316cb1375fc519cf463afc2', '1590089322', 'no'),
(127, '_site_transient_browser_f19b58781316cb1375fc519cf463afc2', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(128, '_site_transient_timeout_php_check_f9714bbe413cc376a70847d9c1f86fcc', '1590089322', 'no'),
(129, '_site_transient_php_check_f9714bbe413cc376a70847d9c1f86fcc', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(133, 'can_compress_scripts', '1', 'no'),
(151, 'core_updater.lock', '1589485447', 'no'),
(179, 'recently_activated', 'a:0:{}', 'yes'),
(181, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(186, 'action_scheduler_hybrid_store_demarkation', '5', 'yes'),
(187, 'schema-ActionScheduler_StoreSchema', '3.0.1589567801', 'yes'),
(188, 'schema-ActionScheduler_LoggerSchema', '2.0.1589567802', 'yes'),
(191, 'woocommerce_store_address', '', 'yes'),
(192, 'woocommerce_store_address_2', '', 'yes'),
(193, 'woocommerce_store_city', '', 'yes'),
(194, 'woocommerce_default_country', 'GB', 'yes'),
(195, 'woocommerce_store_postcode', '', 'yes'),
(196, 'woocommerce_allowed_countries', 'all', 'yes'),
(197, 'woocommerce_all_except_countries', '', 'yes'),
(198, 'woocommerce_specific_allowed_countries', '', 'yes'),
(199, 'woocommerce_ship_to_countries', '', 'yes'),
(200, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(201, 'woocommerce_default_customer_address', 'base', 'yes'),
(202, 'woocommerce_calc_taxes', 'no', 'yes'),
(203, 'woocommerce_enable_coupons', 'yes', 'yes'),
(204, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(205, 'woocommerce_currency', 'GBP', 'yes'),
(206, 'woocommerce_currency_pos', 'left', 'yes'),
(207, 'woocommerce_price_thousand_sep', ',', 'yes'),
(208, 'woocommerce_price_decimal_sep', '.', 'yes'),
(209, 'woocommerce_price_num_decimals', '2', 'yes'),
(210, 'woocommerce_shop_page_id', '30', 'yes'),
(211, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(212, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(213, 'woocommerce_placeholder_image', '7', 'yes'),
(214, 'woocommerce_weight_unit', 'kg', 'yes'),
(215, 'woocommerce_dimension_unit', 'cm', 'yes'),
(216, 'woocommerce_enable_reviews', 'yes', 'yes'),
(217, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(218, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(219, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(220, 'woocommerce_review_rating_required', 'yes', 'no'),
(221, 'woocommerce_manage_stock', 'yes', 'yes'),
(222, 'woocommerce_hold_stock_minutes', '60', 'no'),
(223, 'woocommerce_notify_low_stock', 'yes', 'no'),
(224, 'woocommerce_notify_no_stock', 'yes', 'no'),
(225, 'woocommerce_stock_email_recipient', '1730505@upv.edu.mx', 'no'),
(226, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(227, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(228, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(229, 'woocommerce_stock_format', '', 'yes'),
(230, 'woocommerce_file_download_method', 'force', 'no'),
(231, 'woocommerce_downloads_require_login', 'no', 'no'),
(232, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(233, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(234, 'woocommerce_prices_include_tax', 'no', 'yes'),
(235, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(236, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(237, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(238, 'woocommerce_tax_classes', '', 'yes'),
(239, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(240, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(241, 'woocommerce_price_display_suffix', '', 'yes'),
(242, 'woocommerce_tax_total_display', 'itemized', 'no'),
(243, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(244, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(245, 'woocommerce_ship_to_destination', 'billing', 'no'),
(246, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(247, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(248, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(249, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(250, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(251, 'woocommerce_registration_generate_username', 'yes', 'no'),
(252, 'woocommerce_registration_generate_password', 'yes', 'no'),
(253, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(254, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(255, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(256, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(257, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(258, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(259, 'woocommerce_trash_pending_orders', '', 'no'),
(260, 'woocommerce_trash_failed_orders', '', 'no'),
(261, 'woocommerce_trash_cancelled_orders', '', 'no'),
(262, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(263, 'woocommerce_email_from_name', 'NEGOCIOS INTERNACIONALES', 'no'),
(264, 'woocommerce_email_from_address', '1730505@upv.edu.mx', 'no'),
(265, 'woocommerce_email_header_image', '', 'no'),
(266, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(267, 'woocommerce_email_base_color', '#96588a', 'no'),
(268, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(269, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(270, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(271, 'woocommerce_cart_page_id', '31', 'no'),
(272, 'woocommerce_checkout_page_id', '32', 'no'),
(273, 'woocommerce_myaccount_page_id', '33', 'no'),
(274, 'woocommerce_terms_page_id', '30', 'yes'),
(275, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(276, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(277, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(278, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(279, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(280, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(281, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(282, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(283, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(284, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(285, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(286, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(287, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(288, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(289, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(290, 'woocommerce_api_enabled', 'no', 'yes'),
(291, 'woocommerce_allow_tracking', 'no', 'no'),
(292, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(293, 'woocommerce_single_image_width', '600', 'yes'),
(294, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(295, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(296, 'woocommerce_demo_store', 'no', 'no'),
(297, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:8:\"producto\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(298, 'current_theme_supports_woocommerce', 'no', 'yes'),
(299, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(300, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(302, 'default_product_cat', '15', 'yes'),
(303, 'woocommerce_admin_notices', 'a:1:{i:0;s:7:\"install\";}', 'yes'),
(306, 'woocommerce_version', '4.1.0', 'yes'),
(307, 'woocommerce_db_version', '4.1.0', 'yes'),
(308, 'action_scheduler_lock_async-request-runner', '1589967659', 'yes'),
(309, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:\"database_prefix\";s:32:\"0FJgExPtYIKI1BfkB61t0gYBozJfKhR8\";}', 'yes'),
(310, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(311, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(312, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(313, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(314, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(315, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(316, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(317, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(318, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(319, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(320, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(321, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(322, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(323, 'woocommerce_onboarding_opt_in', 'yes', 'yes'),
(326, 'woocommerce_admin_version', '1.1.1', 'yes'),
(327, 'woocommerce_admin_install_timestamp', '1589567839', 'yes'),
(331, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(333, 'woocommerce_admin_last_orders_milestone', '0', 'yes'),
(335, 'woocommerce_onboarding_profile', 'a:1:{s:9:\"completed\";b:1;}', 'yes'),
(341, '_transient_woocommerce_reports-transient-version', '1589567872', 'yes'),
(342, '_transient_timeout_orders-all-statuses', '1590172672', 'no'),
(343, '_transient_orders-all-statuses', 'a:2:{s:7:\"version\";s:10:\"1589567872\";s:5:\"value\";a:0:{}}', 'no'),
(348, 'action_scheduler_migration_status', 'complete', 'yes'),
(374, 'woocommerce_task_list_tracked_completed_tasks', 'a:1:{i:0;s:8:\"purchase\";}', 'yes'),
(375, 'woocommerce_task_list_welcome_modal_dismissed', '1', 'yes'),
(386, '_transient_product_query-transient-version', '1589967426', 'yes'),
(387, '_transient_product-transient-version', '1589967426', 'yes'),
(411, '_transient_health-check-site-status-result', '{\"good\":\"11\",\"recommended\":\"5\",\"critical\":\"1\"}', 'yes'),
(492, 'new_admin_email', '1730505@upv.edu.mx', 'yes'),
(507, 'category_children', 'a:0:{}', 'yes'),
(516, 'current_theme', 'The name | 05-19-20 7:46 am', 'yes'),
(517, 'theme_mods_twentyseventeen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1589794014;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(518, 'theme_switched', '', 'yes'),
(519, 'woocommerce_maybe_regenerate_images_hash', '991b1ca641921cf0f5baf7a2fe85861b', 'yes'),
(560, 'theme_mods_ecommerce-hub', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1589865882;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:9:\"sidebar-3\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}', 'yes'),
(573, '_transient_timeout_wc_related_10', '1589954926', 'no'),
(574, '_transient_wc_related_10', 'a:1:{s:50:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=10\";a:0:{}}', 'no'),
(632, '_transient_shipping-transient-version', '1589798162', 'yes'),
(633, '_transient_timeout_wc_shipping_method_count_legacy', '1592390162', 'no'),
(634, '_transient_wc_shipping_method_count_legacy', 'a:2:{s:7:\"version\";s:10:\"1589798162\";s:5:\"value\";i:0;}', 'no'),
(663, '_site_transient_timeout_browser_69b4a41ae112711e7b447373ec97d422', '1590469916', 'no'),
(664, '_site_transient_browser_69b4a41ae112711e7b447373ec97d422', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(665, '_transient_timeout_wc_report_sales_by_date', '1589951765', 'no'),
(666, '_transient_wc_report_sales_by_date', 'a:8:{s:32:\"fa9cb7f6cb74a8677c5f8d502b68cd43\";a:0:{}s:32:\"df970a7bd3df176307be5dd07f494420\";a:0:{}s:32:\"5a65ed3c68418ba20514b566d77d5b28\";a:0:{}s:32:\"1834489bf2829ce79afcde45e9e09e3b\";N;s:32:\"d45ab8b597dd4d0d90920d35c8e60bc3\";a:0:{}s:32:\"5d0d03c12022004871a919d156ba9efd\";a:0:{}s:32:\"667fa965a26d47d0e1395f033217bc22\";a:0:{}s:32:\"186fe3b07b482e830777f059b77f7a5f\";a:0:{}}', 'no'),
(667, '_transient_timeout_wc_admin_report', '1589951765', 'no'),
(668, '_transient_wc_admin_report', 'a:1:{s:32:\"2350c356371082339575d8d8227d2188\";a:0:{}}', 'no'),
(694, 'theme_mods_1589783880-tg', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:5:\"menu1\";i:16;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1589867354;s:4:\"data\";a:8:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:9:\"sidebar-3\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}', 'yes'),
(698, 'theme_switched_via_customizer', '', 'yes'),
(699, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(704, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:1:{i:0;i:16;}}', 'yes'),
(732, 'theme_mods_1589867191-tg', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:5:\"menu1\";i:16;}s:18:\"custom_css_post_id\";i:-1;s:22:\"menumymenu1_text_color\";s:7:\"#898989\";s:21:\"sliderz_namemyslider1\";s:7:\"meta:90\";}', 'yes'),
(753, 'simple_css', 'a:2:{s:3:\"css\";s:776:\"\nbody {\n    background: rgb(23, 40, 41);\n}\n\n\nelement.style {\n    overflow: visible;\n}\n\n@media (max-width: 993px)\n.navbar-menu {\n    width: 100%;\n}\n.navbar-menu {\n    background-color: #172829;\n}\n.navbar-menu {\n    padding-top: 10px;\n    padding-right: 0px;\n    padding-bottom: 10px;\n    padding-left: 0px;\n    display: block;\n    float: right;\n    margin-top: 0px;\n    margin-right: 0px;\n    margin-bottom: 0px;\n    margin-left: 0px;\n}\n\n@media screen and (max-width: 993px)\n.navbar-menu {\n    width: 100%;\n    background-color: #172829;\n    position: absolute;\n    z-index: 999999;\n}\n\n#i5ghz {\n    width: 80%;\n    float: left;\n    min-height: 75px;\n    height: auto;\n    text-align: center;\n    color: #35e19b;\n}\nz\na, .entry-meta a, .comment-metadata a {\n    color: #53d8b1;\n}\";s:5:\"theme\";s:0:\"\";}', 'yes'),
(900, 'widget_metaslider_widget', 'a:2:{i:2;a:2:{s:9:\"slider_id\";s:0:\"\";s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(913, 'woocommerce_shop_page_display', 'subcategories', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(914, 'woocommerce_category_archive_display', 'subcategories', 'yes'),
(915, 'woocommerce_default_catalog_orderby', 'popularity', 'yes'),
(916, 'woocommerce_catalog_rows', '4', 'yes'),
(982, 'woocommerce_paypal_settings', 'a:23:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:6:\"PayPal\";s:11:\"description\";s:92:\"Pagar con PayPal; puedes pagar con tu tarjeta de crédito si no tienes una cuenta de PayPal.\";s:5:\"email\";s:18:\"1730505@upv.edu.mx\";s:8:\"advanced\";s:0:\"\";s:8:\"testmode\";s:2:\"no\";s:5:\"debug\";s:2:\"no\";s:16:\"ipn_notification\";s:3:\"yes\";s:14:\"receiver_email\";s:18:\"1730505@upv.edu.mx\";s:14:\"identity_token\";s:0:\"\";s:14:\"invoice_prefix\";s:3:\"WC-\";s:13:\"send_shipping\";s:3:\"yes\";s:16:\"address_override\";s:2:\"no\";s:13:\"paymentaction\";s:4:\"sale\";s:10:\"page_style\";s:0:\"\";s:9:\"image_url\";s:0:\"\";s:11:\"api_details\";s:0:\"\";s:12:\"api_username\";s:0:\"\";s:12:\"api_password\";s:0:\"\";s:13:\"api_signature\";s:0:\"\";s:20:\"sandbox_api_username\";s:0:\"\";s:20:\"sandbox_api_password\";s:0:\"\";s:21:\"sandbox_api_signature\";s:0:\"\";}', 'yes'),
(985, 'woocommerce_gateway_order', 'a:4:{s:4:\"bacs\";i:0;s:6:\"cheque\";i:1;s:3:\"cod\";i:2;s:6:\"paypal\";i:3;}', 'yes'),
(1108, '_transient_timeout_wc_related_86', '1590009198', 'no'),
(1109, '_transient_wc_related_86', 'a:1:{s:50:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=86\";a:0:{}}', 'no'),
(1149, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_MX/wordpress-5.4.1.zip\";s:6:\"locale\";s:5:\"es_MX\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_MX/wordpress-5.4.1.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.1\";s:7:\"version\";s:5:\"5.4.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1589959776;s:15:\"version_checked\";s:5:\"5.4.1\";s:12:\"translations\";a:0:{}}', 'no'),
(1154, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1589959785;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.1.5\";s:9:\"hello.php\";s:5:\"1.7.2\";s:23:\"ml-slider/ml-slider.php\";s:6:\"3.16.4\";s:25:\"simple-css/simple-css.php\";s:3:\"1.1\";s:27:\"woocommerce/woocommerce.php\";s:5:\"4.1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.5\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:23:\"ml-slider/ml-slider.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:23:\"w.org/plugins/ml-slider\";s:4:\"slug\";s:9:\"ml-slider\";s:6:\"plugin\";s:23:\"ml-slider/ml-slider.php\";s:11:\"new_version\";s:6:\"3.16.4\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/ml-slider/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/ml-slider.3.16.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:62:\"https://ps.w.org/ml-slider/assets/icon-256x256.png?rev=1837669\";s:2:\"1x\";s:54:\"https://ps.w.org/ml-slider/assets/icon.svg?rev=1837669\";s:3:\"svg\";s:54:\"https://ps.w.org/ml-slider/assets/icon.svg?rev=1837669\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/ml-slider/assets/banner-1544x500.png?rev=1837669\";s:2:\"1x\";s:64:\"https://ps.w.org/ml-slider/assets/banner-772x250.png?rev=1837669\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"simple-css/simple-css.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/simple-css\";s:4:\"slug\";s:10:\"simple-css\";s:6:\"plugin\";s:25:\"simple-css/simple-css.php\";s:11:\"new_version\";s:3:\"1.1\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/simple-css/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/simple-css.1.1.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:63:\"https://ps.w.org/simple-css/assets/icon-128x128.png?rev=1291275\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/simple-css/assets/banner-772x250.png?rev=1291275\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.1.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.1.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2075035\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2075035\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2075035\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2075035\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(1155, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1589959785;s:7:\"checked\";a:6:{s:13:\"1589783880-tg\";s:3:\"1.0\";s:13:\"1589867191-tg\";s:3:\"1.0\";s:13:\"ecommerce-hub\";s:5:\"0.3.4\";s:14:\"twentynineteen\";s:3:\"1.5\";s:15:\"twentyseventeen\";s:3:\"2.3\";s:12:\"twentytwenty\";s:3:\"1.3\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(1164, 'ms_hide_all_ads_until', '1591154897', 'yes'),
(1166, 'metaslider_systemcheck', 'a:2:{s:16:\"wordPressVersion\";b:0;s:12:\"imageLibrary\";b:0;}', 'no'),
(1167, 'ml-slider_children', 'a:0:{}', 'yes'),
(1169, 'metaslider_tour_cancelled_on', 'add-slide', 'yes'),
(1273, '_transient_timeout_wc_onboarding_product_data', '1590040947', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1274, '_transient_wc_onboarding_product_data', 'a:6:{s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:17:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Wed, 20 May 2020 06:02:27 GMT\";s:12:\"content-type\";s:31:\"application/json; charset=UTF-8\";s:14:\"content-length\";s:4:\"3790\";s:12:\"x-robots-tag\";s:7:\"noindex\";s:4:\"link\";s:60:\"<https://woocommerce.com/wp-json/>; rel=\"https://api.w.org/\"\";s:22:\"x-content-type-options\";s:7:\"nosniff\";s:29:\"access-control-expose-headers\";s:27:\"X-WP-Total, X-WP-TotalPages\";s:28:\"access-control-allow-headers\";s:27:\"Authorization, Content-Type\";s:13:\"cache-control\";s:10:\"max-age=60\";s:5:\"allow\";s:3:\"GET\";s:16:\"content-encoding\";s:4:\"gzip\";s:4:\"x-rq\";s:16:\"dfw1 86 200 3132\";s:3:\"age\";s:1:\"0\";s:7:\"x-cache\";s:3:\"hit\";s:4:\"vary\";s:23:\"Accept-Encoding, Origin\";s:13:\"accept-ranges\";s:5:\"bytes\";}}s:4:\"body\";s:15105:\"{\"products\":[{\"title\":\"WooCommerce Subscriptions\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2012\\/09\\/woosubs.png\",\"excerpt\":\"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"6115e6d7e297b623a169fdcf5728b224\",\"slug\":\"woocommerce-subscriptions\",\"id\":27147},{\"title\":\"WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Give members access to restricted content or products, for a fee or for free.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"9288e7609ad0b487b81ef6232efa5cfc\",\"slug\":\"woocommerce-memberships\",\"id\":958589},{\"title\":\"Product Bundles\",\"image\":\"\",\"excerpt\":\"Offer configurable product bundles, bulk discount packages and assembled\\u00a0products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-bundles\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"aa2518b5-ab19-4b75-bde9-60ca51e20f28\",\"slug\":\"woocommerce-product-bundles\",\"id\":18716},{\"title\":\"WooCommerce Bookings\",\"image\":\"\",\"excerpt\":\"Allow customers to book appointments, make reservations or rent equipment without leaving your site.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/themes.woocommerce.com\\/hotel\\/\",\"price\":\"&#36;249.00\",\"hash\":\"911c438934af094c2b38d5560b9f50f3\",\"slug\":\"WooCommerce Bookings\",\"id\":390890},{\"title\":\"WooCommerce Paid Courses\",\"image\":\"\",\"excerpt\":\"Sell your online courses using the most popular eCommerce platform on the web \\u2013 WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-paid-courses\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"bad2a02a063555b7e2bee59924690763\",\"slug\":\"woothemes-sensei\",\"id\":152116},{\"title\":\"Composite Products\",\"image\":\"\",\"excerpt\":\"Create and offer personalized product kits and custom product configurators.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/composite-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"0343e0115bbcb97ccd98442b8326a0af\",\"slug\":\"woocommerce-composite-products\",\"id\":216836},{\"title\":\"Product Vendors\",\"image\":\"\",\"excerpt\":\"Turn your store into a multi-vendor marketplace\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a97d99fccd651bbdd728f4d67d492c31\",\"slug\":\"woocommerce-product-vendors\",\"id\":219982},{\"title\":\"WooCommerce Accommodation Bookings\",\"image\":\"\",\"excerpt\":\"Book accommodation using WooCommerce and the WooCommerce Bookings extension.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-accommodation-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;0.00\",\"hash\":\"99b2a7a4af90b6cefd2a733b3b1f78e7\",\"slug\":\"woocommerce-accommodation-bookings\",\"id\":1412069},{\"title\":\"Groups for WooCommerce\",\"image\":\"\",\"excerpt\":\"Sell Memberships with Groups and WooCommerce \\u2013\\u00a0the best Group Membership and Access Control solution for WordPress and WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/groups-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"aa2d455ed00566e4fb71bc9d53f2613b\",\"slug\":\"groups-woocommerce\",\"id\":18704},{\"title\":\"WooCommerce Subscription Downloads\",\"image\":\"\",\"excerpt\":\"Offer additional downloads to your subscribers, via downloadable products listed in your store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscription-downloads\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"5be9e21c13953253e4406d2a700382ec\",\"slug\":\"woocommerce-subscription-downloads\",\"id\":420458},{\"title\":\"WooCommerce Pre-Orders\",\"image\":\"\",\"excerpt\":\"Allow customers to order products before they are available.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-pre-orders\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"b2dc75e7d55e6f5bbfaccb59830f66b7\",\"slug\":\"woocommerce-pre-orders\",\"id\":178477},{\"title\":\"WooCommerce Deposits\",\"image\":\"\",\"excerpt\":\"Enable customers to pay for products using a deposit or a payment plan.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-deposits\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;179.00\",\"hash\":\"de192a6cf12c4fd803248da5db700762\",\"slug\":\"woocommerce-deposits\",\"id\":977087},{\"title\":\"Chained Products\",\"image\":\"\",\"excerpt\":\"Pre-configured product bundles, giveaways, forced sells and discounted combos. Automatically adds \\u201cchained\\u201d products to cart when \\u201cmain\\u201d product is added.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/chained-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.storeapps.org\\/?demo=cp\",\"price\":\"&#36;49.00\",\"hash\":\"cc6e246e495745db10f9f7fddc5aa907\",\"slug\":\"woocommerce-chained-products\",\"id\":18687},{\"title\":\"Mix and Match Products\",\"image\":\"\",\"excerpt\":\"Allow your customers to combine products and create their own variations, and increase your average order value.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-mix-and-match-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"e59883891b7bcd535025486721e4c09f\",\"slug\":\"woocommerce-mix-and-match-products\",\"id\":853021},{\"title\":\"WooCommerce Box Office\",\"image\":\"\",\"excerpt\":\"Sell tickets for your next event, concert, function, fundraiser or conference directly on your own site\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-box-office\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"e704c9160de318216a8fa657404b9131\",\"slug\":\"woocommerce-box-office\",\"id\":1628717},{\"title\":\"All Products for WooCommerce Subscriptions\",\"image\":\"\",\"excerpt\":\"Make your products available on subscription. Give customers the freedom to add products to their subscriptions.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/all-products-for-woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"2794ee6e-bc30-4733-9b24-5edfc3f0095d\",\"slug\":\"woocommerce-all-products-for-subscriptions\",\"id\":3978176},{\"title\":\"WooCommerce Photography\",\"image\":\"\",\"excerpt\":\"Sell photos in the blink of an eye using this simple as dragging &amp; dropping interface.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-photography\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"ee76e8b9daf1d97ca4d3874cc9e35687\",\"slug\":\"woocommerce-photography\",\"id\":583602},{\"title\":\"Teams for WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/teams-woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"9feb48da-9615-4131-8aa8-eebb55b9cff4\",\"slug\":\"woocommerce-memberships-for-teams\",\"id\":2893267},{\"title\":\"Software Add-on\",\"image\":\"\",\"excerpt\":\"Sell License Keys for Software\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/software-add-on\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"79f6dbfe1f1d3a56a86f0509b6d6b04b\",\"slug\":\"woocommerce-software-add-on\",\"id\":18683},{\"title\":\"WooCommerce API Manager\",\"image\":\"\",\"excerpt\":\"Let customers subscribe to your software or services through API Keys, aka License Keys. Provide automated updates for WordPress Plugins and Themes, or any software through robust APIs.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-api-manager\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"f7cdcfb7de76afa0889f07bcb92bf12e\",\"slug\":\"woocommerce-api-manager\",\"id\":260110},{\"title\":\"WooCommerce Bookings Availability\",\"image\":\"\",\"excerpt\":\"Sell more bookings by presenting a calendar or schedule of available slots in a page or post.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/bookings-availability\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"30770d2a-e392-4e82-baaa-76cfc7d02ae3\",\"slug\":\"woocommerce-bookings-availability\",\"id\":4228225},{\"title\":\"Auctions for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/woocommerce_uploads\\/2019\\/10\\/auctions_for_woocommerce.png\",\"excerpt\":\"A professional Auction solution for your WooCommerce store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/wpinstitut.com\\/auctions-for-woocommerce-demo\\/\",\"price\":\"&#36;149.00\",\"hash\":\"c41a199e-5f49-4f5c-bb28-7ca22b0c4fe7\",\"slug\":\"auctions-for-woocommerce\",\"id\":4922919},{\"title\":\"Paywall for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/paywall-for-woocommerce-logo.png?w=150&amp;h=150&amp;crop=1\",\"excerpt\":\"Paywall is a WooCommerce extension that allows creating products with restricted access to content.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/paywall-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo-woocommerce-paywall.tiv.net\\/\",\"price\":\"&#36;79.00\",\"hash\":\"a688fc22-9370-4652-9e5e-f968ced9a0a8\",\"slug\":\"paywall-for-woocommerce\",\"id\":5253500},{\"title\":\"Auctions Made Easy for WooCommerce\",\"image\":\"\",\"excerpt\":\"Auctions Made Easy for WooCommerce is a full-featured auctions plugin for creating and managing online auctions in a WooCommerce shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-made-easy-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a7fbc475-9946-4db9-92b6-5b7ebab3bab2\",\"slug\":\"auctions-made-easy-for-woocommerce\",\"id\":5249611},{\"title\":\"Assorted Products for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/10\\/icon.jpg\",\"excerpt\":\"Empower your customers to create product bundles\\u2014gift boxes of their choice comprising items from your shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/assorted-products-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/assorted-products.codeincept.com\\/product\\/assorted-product\\/\",\"price\":\"&#36;79.00\",\"hash\":\"6ab9ee51-c187-421c-9104-efa21d9423ca\",\"slug\":\"assorted-products-for-woocommerce\",\"id\":4911617},{\"title\":\"Smart Product Bundle For WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/productlogo-1.png\",\"excerpt\":\"Fulfill customer expectations with Smart Product Bundle and enrich customer experiences along with your sales revenue.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/smart-bundle-product-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.wpexperts.io\\/smart-bundle-product-for-woocommerce\\/\",\"price\":\"&#36;79.00\",\"hash\":\"033cccdf-744b-4497-87b1-5765e71d3dcd\",\"slug\":\"smart-bundle-for-woocommerce\",\"id\":5193957},{\"title\":\"Featured Listing for Product Vendors\",\"image\":\"\",\"excerpt\":\"This is an addon of WooCommerce Product Vendor which offers vendor the option to feature their product ahead of others, for a small fee.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/featured-listing-for-product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/demo.makewebbetter.com\\/featured-listing-for-product-vendors\\/\",\"price\":\"&#36;79.00\",\"hash\":\"78610942-f38c-4517-b7e0-4c3753d11752\",\"slug\":\"featured-listing-for-product-vendors\",\"id\":5021060},{\"title\":\"Shopee Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo.png\",\"excerpt\":\"Sell on Shopee with Shopee integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/shopee-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"dcf810b6-c8ce-48da-84ba-289ac4ee43f5\",\"slug\":\"woocommerce-shopee-integration\",\"id\":4794826},{\"title\":\"Walmart Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-1.png?w=150&amp;h=150&amp;crop=0\",\"excerpt\":\"Sell on Walmart with Walmart Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/walmart-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;249.00\",\"hash\":\"1237f272-56c8-4c77-8539-31450a2f4e1a\",\"slug\":\"walmart-integration-for-woocommerce\",\"id\":5423057},{\"title\":\"Etsy Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-2.png?w=150&amp;h=150\",\"excerpt\":\"Sell on Etsy with Etsy Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/etsy-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"1dc5953a-3b22-4e73-9d7d-cc852d189beb\",\"slug\":\"woocommerce-etsy-integration\",\"id\":5712585},{\"title\":\"Custom Product Boxes\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/04\\/CPB_Icon.jpg?w=150&amp;h=150\",\"excerpt\":\"Custom product boxes for WooCommerce allows users to create product bundles by choosing specific items of their own choice from the collection of products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/custom-product-boxes\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/composite-products.codeincept.com\\/product\\/cupcake-gift-box\\/\",\"price\":\"&#36;79.00\",\"hash\":\"ba19e1e3-1d5f-4e2c-bc3e-d7029c04f326\",\"slug\":\"custom-product-boxes\",\"id\":5706607},{\"title\":\"Lottery for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/05\\/lottery-logo.png?w=150&amp;h=150\",\"excerpt\":\"Lottery for WooCommerce is a full-featured lottery plugin for creating and managing online lotteries in your WooCommerce Shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/lottery-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"9694c9bd-1d5c-43af-b1e9-796cc64b16a8\",\"slug\":\"lottery-for-woocommerce\",\"id\":5860289}]}\";s:8:\"response\";a:2:{s:4:\"code\";i:200;s:7:\"message\";s:2:\"OK\";}s:7:\"cookies\";a:0:{}s:8:\"filename\";N;s:13:\"http_response\";O:25:\"WP_HTTP_Requests_Response\":5:{s:11:\"\0*\0response\";O:17:\"Requests_Response\":10:{s:4:\"body\";s:15105:\"{\"products\":[{\"title\":\"WooCommerce Subscriptions\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2012\\/09\\/woosubs.png\",\"excerpt\":\"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"6115e6d7e297b623a169fdcf5728b224\",\"slug\":\"woocommerce-subscriptions\",\"id\":27147},{\"title\":\"WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Give members access to restricted content or products, for a fee or for free.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"9288e7609ad0b487b81ef6232efa5cfc\",\"slug\":\"woocommerce-memberships\",\"id\":958589},{\"title\":\"Product Bundles\",\"image\":\"\",\"excerpt\":\"Offer configurable product bundles, bulk discount packages and assembled\\u00a0products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-bundles\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"aa2518b5-ab19-4b75-bde9-60ca51e20f28\",\"slug\":\"woocommerce-product-bundles\",\"id\":18716},{\"title\":\"WooCommerce Bookings\",\"image\":\"\",\"excerpt\":\"Allow customers to book appointments, make reservations or rent equipment without leaving your site.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/themes.woocommerce.com\\/hotel\\/\",\"price\":\"&#36;249.00\",\"hash\":\"911c438934af094c2b38d5560b9f50f3\",\"slug\":\"WooCommerce Bookings\",\"id\":390890},{\"title\":\"WooCommerce Paid Courses\",\"image\":\"\",\"excerpt\":\"Sell your online courses using the most popular eCommerce platform on the web \\u2013 WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-paid-courses\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"bad2a02a063555b7e2bee59924690763\",\"slug\":\"woothemes-sensei\",\"id\":152116},{\"title\":\"Composite Products\",\"image\":\"\",\"excerpt\":\"Create and offer personalized product kits and custom product configurators.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/composite-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"0343e0115bbcb97ccd98442b8326a0af\",\"slug\":\"woocommerce-composite-products\",\"id\":216836},{\"title\":\"Product Vendors\",\"image\":\"\",\"excerpt\":\"Turn your store into a multi-vendor marketplace\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a97d99fccd651bbdd728f4d67d492c31\",\"slug\":\"woocommerce-product-vendors\",\"id\":219982},{\"title\":\"WooCommerce Accommodation Bookings\",\"image\":\"\",\"excerpt\":\"Book accommodation using WooCommerce and the WooCommerce Bookings extension.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-accommodation-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;0.00\",\"hash\":\"99b2a7a4af90b6cefd2a733b3b1f78e7\",\"slug\":\"woocommerce-accommodation-bookings\",\"id\":1412069},{\"title\":\"Groups for WooCommerce\",\"image\":\"\",\"excerpt\":\"Sell Memberships with Groups and WooCommerce \\u2013\\u00a0the best Group Membership and Access Control solution for WordPress and WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/groups-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"aa2d455ed00566e4fb71bc9d53f2613b\",\"slug\":\"groups-woocommerce\",\"id\":18704},{\"title\":\"WooCommerce Subscription Downloads\",\"image\":\"\",\"excerpt\":\"Offer additional downloads to your subscribers, via downloadable products listed in your store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscription-downloads\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"5be9e21c13953253e4406d2a700382ec\",\"slug\":\"woocommerce-subscription-downloads\",\"id\":420458},{\"title\":\"WooCommerce Pre-Orders\",\"image\":\"\",\"excerpt\":\"Allow customers to order products before they are available.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-pre-orders\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"b2dc75e7d55e6f5bbfaccb59830f66b7\",\"slug\":\"woocommerce-pre-orders\",\"id\":178477},{\"title\":\"WooCommerce Deposits\",\"image\":\"\",\"excerpt\":\"Enable customers to pay for products using a deposit or a payment plan.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-deposits\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;179.00\",\"hash\":\"de192a6cf12c4fd803248da5db700762\",\"slug\":\"woocommerce-deposits\",\"id\":977087},{\"title\":\"Chained Products\",\"image\":\"\",\"excerpt\":\"Pre-configured product bundles, giveaways, forced sells and discounted combos. Automatically adds \\u201cchained\\u201d products to cart when \\u201cmain\\u201d product is added.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/chained-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.storeapps.org\\/?demo=cp\",\"price\":\"&#36;49.00\",\"hash\":\"cc6e246e495745db10f9f7fddc5aa907\",\"slug\":\"woocommerce-chained-products\",\"id\":18687},{\"title\":\"Mix and Match Products\",\"image\":\"\",\"excerpt\":\"Allow your customers to combine products and create their own variations, and increase your average order value.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-mix-and-match-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"e59883891b7bcd535025486721e4c09f\",\"slug\":\"woocommerce-mix-and-match-products\",\"id\":853021},{\"title\":\"WooCommerce Box Office\",\"image\":\"\",\"excerpt\":\"Sell tickets for your next event, concert, function, fundraiser or conference directly on your own site\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-box-office\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"e704c9160de318216a8fa657404b9131\",\"slug\":\"woocommerce-box-office\",\"id\":1628717},{\"title\":\"All Products for WooCommerce Subscriptions\",\"image\":\"\",\"excerpt\":\"Make your products available on subscription. Give customers the freedom to add products to their subscriptions.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/all-products-for-woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"2794ee6e-bc30-4733-9b24-5edfc3f0095d\",\"slug\":\"woocommerce-all-products-for-subscriptions\",\"id\":3978176},{\"title\":\"WooCommerce Photography\",\"image\":\"\",\"excerpt\":\"Sell photos in the blink of an eye using this simple as dragging &amp; dropping interface.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-photography\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"ee76e8b9daf1d97ca4d3874cc9e35687\",\"slug\":\"woocommerce-photography\",\"id\":583602},{\"title\":\"Teams for WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/teams-woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"9feb48da-9615-4131-8aa8-eebb55b9cff4\",\"slug\":\"woocommerce-memberships-for-teams\",\"id\":2893267},{\"title\":\"Software Add-on\",\"image\":\"\",\"excerpt\":\"Sell License Keys for Software\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/software-add-on\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"79f6dbfe1f1d3a56a86f0509b6d6b04b\",\"slug\":\"woocommerce-software-add-on\",\"id\":18683},{\"title\":\"WooCommerce API Manager\",\"image\":\"\",\"excerpt\":\"Let customers subscribe to your software or services through API Keys, aka License Keys. Provide automated updates for WordPress Plugins and Themes, or any software through robust APIs.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-api-manager\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"f7cdcfb7de76afa0889f07bcb92bf12e\",\"slug\":\"woocommerce-api-manager\",\"id\":260110},{\"title\":\"WooCommerce Bookings Availability\",\"image\":\"\",\"excerpt\":\"Sell more bookings by presenting a calendar or schedule of available slots in a page or post.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/bookings-availability\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"30770d2a-e392-4e82-baaa-76cfc7d02ae3\",\"slug\":\"woocommerce-bookings-availability\",\"id\":4228225},{\"title\":\"Auctions for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/woocommerce_uploads\\/2019\\/10\\/auctions_for_woocommerce.png\",\"excerpt\":\"A professional Auction solution for your WooCommerce store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/wpinstitut.com\\/auctions-for-woocommerce-demo\\/\",\"price\":\"&#36;149.00\",\"hash\":\"c41a199e-5f49-4f5c-bb28-7ca22b0c4fe7\",\"slug\":\"auctions-for-woocommerce\",\"id\":4922919},{\"title\":\"Paywall for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/paywall-for-woocommerce-logo.png?w=150&amp;h=150&amp;crop=1\",\"excerpt\":\"Paywall is a WooCommerce extension that allows creating products with restricted access to content.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/paywall-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo-woocommerce-paywall.tiv.net\\/\",\"price\":\"&#36;79.00\",\"hash\":\"a688fc22-9370-4652-9e5e-f968ced9a0a8\",\"slug\":\"paywall-for-woocommerce\",\"id\":5253500},{\"title\":\"Auctions Made Easy for WooCommerce\",\"image\":\"\",\"excerpt\":\"Auctions Made Easy for WooCommerce is a full-featured auctions plugin for creating and managing online auctions in a WooCommerce shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-made-easy-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a7fbc475-9946-4db9-92b6-5b7ebab3bab2\",\"slug\":\"auctions-made-easy-for-woocommerce\",\"id\":5249611},{\"title\":\"Assorted Products for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/10\\/icon.jpg\",\"excerpt\":\"Empower your customers to create product bundles\\u2014gift boxes of their choice comprising items from your shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/assorted-products-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/assorted-products.codeincept.com\\/product\\/assorted-product\\/\",\"price\":\"&#36;79.00\",\"hash\":\"6ab9ee51-c187-421c-9104-efa21d9423ca\",\"slug\":\"assorted-products-for-woocommerce\",\"id\":4911617},{\"title\":\"Smart Product Bundle For WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/productlogo-1.png\",\"excerpt\":\"Fulfill customer expectations with Smart Product Bundle and enrich customer experiences along with your sales revenue.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/smart-bundle-product-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.wpexperts.io\\/smart-bundle-product-for-woocommerce\\/\",\"price\":\"&#36;79.00\",\"hash\":\"033cccdf-744b-4497-87b1-5765e71d3dcd\",\"slug\":\"smart-bundle-for-woocommerce\",\"id\":5193957},{\"title\":\"Featured Listing for Product Vendors\",\"image\":\"\",\"excerpt\":\"This is an addon of WooCommerce Product Vendor which offers vendor the option to feature their product ahead of others, for a small fee.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/featured-listing-for-product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/demo.makewebbetter.com\\/featured-listing-for-product-vendors\\/\",\"price\":\"&#36;79.00\",\"hash\":\"78610942-f38c-4517-b7e0-4c3753d11752\",\"slug\":\"featured-listing-for-product-vendors\",\"id\":5021060},{\"title\":\"Shopee Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo.png\",\"excerpt\":\"Sell on Shopee with Shopee integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/shopee-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"dcf810b6-c8ce-48da-84ba-289ac4ee43f5\",\"slug\":\"woocommerce-shopee-integration\",\"id\":4794826},{\"title\":\"Walmart Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-1.png?w=150&amp;h=150&amp;crop=0\",\"excerpt\":\"Sell on Walmart with Walmart Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/walmart-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;249.00\",\"hash\":\"1237f272-56c8-4c77-8539-31450a2f4e1a\",\"slug\":\"walmart-integration-for-woocommerce\",\"id\":5423057},{\"title\":\"Etsy Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-2.png?w=150&amp;h=150\",\"excerpt\":\"Sell on Etsy with Etsy Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/etsy-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"1dc5953a-3b22-4e73-9d7d-cc852d189beb\",\"slug\":\"woocommerce-etsy-integration\",\"id\":5712585},{\"title\":\"Custom Product Boxes\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/04\\/CPB_Icon.jpg?w=150&amp;h=150\",\"excerpt\":\"Custom product boxes for WooCommerce allows users to create product bundles by choosing specific items of their own choice from the collection of products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/custom-product-boxes\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/composite-products.codeincept.com\\/product\\/cupcake-gift-box\\/\",\"price\":\"&#36;79.00\",\"hash\":\"ba19e1e3-1d5f-4e2c-bc3e-d7029c04f326\",\"slug\":\"custom-product-boxes\",\"id\":5706607},{\"title\":\"Lottery for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/05\\/lottery-logo.png?w=150&amp;h=150\",\"excerpt\":\"Lottery for WooCommerce is a full-featured lottery plugin for creating and managing online lotteries in your WooCommerce Shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/lottery-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"9694c9bd-1d5c-43af-b1e9-796cc64b16a8\",\"slug\":\"lottery-for-woocommerce\",\"id\":5860289}]}\";s:3:\"raw\";s:15669:\"HTTP/1.1 200 OK\r\nServer: nginx\r\nDate: Wed, 20 May 2020 06:02:27 GMT\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 3790\r\nConnection: close\r\nX-Robots-Tag: noindex\r\nLink: <https://woocommerce.com/wp-json/>; rel=\"https://api.w.org/\"\r\nX-Content-Type-Options: nosniff\r\nAccess-Control-Expose-Headers: X-WP-Total, X-WP-TotalPages\r\nAccess-Control-Allow-Headers: Authorization, Content-Type\r\nCache-Control: max-age=60\r\nAllow: GET\r\nContent-Encoding: gzip\r\nX-rq: dfw1 86 200 3132\r\nAge: 0\r\nX-Cache: hit\r\nVary: Accept-Encoding, Origin\r\nAccept-Ranges: bytes\r\n\r\n{\"products\":[{\"title\":\"WooCommerce Subscriptions\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2012\\/09\\/woosubs.png\",\"excerpt\":\"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"6115e6d7e297b623a169fdcf5728b224\",\"slug\":\"woocommerce-subscriptions\",\"id\":27147},{\"title\":\"WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Give members access to restricted content or products, for a fee or for free.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"9288e7609ad0b487b81ef6232efa5cfc\",\"slug\":\"woocommerce-memberships\",\"id\":958589},{\"title\":\"Product Bundles\",\"image\":\"\",\"excerpt\":\"Offer configurable product bundles, bulk discount packages and assembled\\u00a0products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-bundles\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"aa2518b5-ab19-4b75-bde9-60ca51e20f28\",\"slug\":\"woocommerce-product-bundles\",\"id\":18716},{\"title\":\"WooCommerce Bookings\",\"image\":\"\",\"excerpt\":\"Allow customers to book appointments, make reservations or rent equipment without leaving your site.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/themes.woocommerce.com\\/hotel\\/\",\"price\":\"&#36;249.00\",\"hash\":\"911c438934af094c2b38d5560b9f50f3\",\"slug\":\"WooCommerce Bookings\",\"id\":390890},{\"title\":\"WooCommerce Paid Courses\",\"image\":\"\",\"excerpt\":\"Sell your online courses using the most popular eCommerce platform on the web \\u2013 WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-paid-courses\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"bad2a02a063555b7e2bee59924690763\",\"slug\":\"woothemes-sensei\",\"id\":152116},{\"title\":\"Composite Products\",\"image\":\"\",\"excerpt\":\"Create and offer personalized product kits and custom product configurators.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/composite-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"0343e0115bbcb97ccd98442b8326a0af\",\"slug\":\"woocommerce-composite-products\",\"id\":216836},{\"title\":\"Product Vendors\",\"image\":\"\",\"excerpt\":\"Turn your store into a multi-vendor marketplace\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a97d99fccd651bbdd728f4d67d492c31\",\"slug\":\"woocommerce-product-vendors\",\"id\":219982},{\"title\":\"WooCommerce Accommodation Bookings\",\"image\":\"\",\"excerpt\":\"Book accommodation using WooCommerce and the WooCommerce Bookings extension.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-accommodation-bookings\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;0.00\",\"hash\":\"99b2a7a4af90b6cefd2a733b3b1f78e7\",\"slug\":\"woocommerce-accommodation-bookings\",\"id\":1412069},{\"title\":\"Groups for WooCommerce\",\"image\":\"\",\"excerpt\":\"Sell Memberships with Groups and WooCommerce \\u2013\\u00a0the best Group Membership and Access Control solution for WordPress and WooCommerce.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/groups-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"aa2d455ed00566e4fb71bc9d53f2613b\",\"slug\":\"groups-woocommerce\",\"id\":18704},{\"title\":\"WooCommerce Subscription Downloads\",\"image\":\"\",\"excerpt\":\"Offer additional downloads to your subscribers, via downloadable products listed in your store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-subscription-downloads\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"5be9e21c13953253e4406d2a700382ec\",\"slug\":\"woocommerce-subscription-downloads\",\"id\":420458},{\"title\":\"WooCommerce Pre-Orders\",\"image\":\"\",\"excerpt\":\"Allow customers to order products before they are available.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-pre-orders\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"b2dc75e7d55e6f5bbfaccb59830f66b7\",\"slug\":\"woocommerce-pre-orders\",\"id\":178477},{\"title\":\"WooCommerce Deposits\",\"image\":\"\",\"excerpt\":\"Enable customers to pay for products using a deposit or a payment plan.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-deposits\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;179.00\",\"hash\":\"de192a6cf12c4fd803248da5db700762\",\"slug\":\"woocommerce-deposits\",\"id\":977087},{\"title\":\"Chained Products\",\"image\":\"\",\"excerpt\":\"Pre-configured product bundles, giveaways, forced sells and discounted combos. Automatically adds \\u201cchained\\u201d products to cart when \\u201cmain\\u201d product is added.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/chained-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.storeapps.org\\/?demo=cp\",\"price\":\"&#36;49.00\",\"hash\":\"cc6e246e495745db10f9f7fddc5aa907\",\"slug\":\"woocommerce-chained-products\",\"id\":18687},{\"title\":\"Mix and Match Products\",\"image\":\"\",\"excerpt\":\"Allow your customers to combine products and create their own variations, and increase your average order value.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-mix-and-match-products\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"e59883891b7bcd535025486721e4c09f\",\"slug\":\"woocommerce-mix-and-match-products\",\"id\":853021},{\"title\":\"WooCommerce Box Office\",\"image\":\"\",\"excerpt\":\"Sell tickets for your next event, concert, function, fundraiser or conference directly on your own site\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-box-office\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"e704c9160de318216a8fa657404b9131\",\"slug\":\"woocommerce-box-office\",\"id\":1628717},{\"title\":\"All Products for WooCommerce Subscriptions\",\"image\":\"\",\"excerpt\":\"Make your products available on subscription. Give customers the freedom to add products to their subscriptions.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/all-products-for-woocommerce-subscriptions\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"2794ee6e-bc30-4733-9b24-5edfc3f0095d\",\"slug\":\"woocommerce-all-products-for-subscriptions\",\"id\":3978176},{\"title\":\"WooCommerce Photography\",\"image\":\"\",\"excerpt\":\"Sell photos in the blink of an eye using this simple as dragging &amp; dropping interface.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-photography\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"ee76e8b9daf1d97ca4d3874cc9e35687\",\"slug\":\"woocommerce-photography\",\"id\":583602},{\"title\":\"Teams for WooCommerce Memberships\",\"image\":\"\",\"excerpt\":\"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/teams-woocommerce-memberships\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"9feb48da-9615-4131-8aa8-eebb55b9cff4\",\"slug\":\"woocommerce-memberships-for-teams\",\"id\":2893267},{\"title\":\"Software Add-on\",\"image\":\"\",\"excerpt\":\"Sell License Keys for Software\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/software-add-on\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"79f6dbfe1f1d3a56a86f0509b6d6b04b\",\"slug\":\"woocommerce-software-add-on\",\"id\":18683},{\"title\":\"WooCommerce API Manager\",\"image\":\"\",\"excerpt\":\"Let customers subscribe to your software or services through API Keys, aka License Keys. Provide automated updates for WordPress Plugins and Themes, or any software through robust APIs.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/woocommerce-api-manager\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;129.00\",\"hash\":\"f7cdcfb7de76afa0889f07bcb92bf12e\",\"slug\":\"woocommerce-api-manager\",\"id\":260110},{\"title\":\"WooCommerce Bookings Availability\",\"image\":\"\",\"excerpt\":\"Sell more bookings by presenting a calendar or schedule of available slots in a page or post.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/bookings-availability\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;49.00\",\"hash\":\"30770d2a-e392-4e82-baaa-76cfc7d02ae3\",\"slug\":\"woocommerce-bookings-availability\",\"id\":4228225},{\"title\":\"Auctions for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/woocommerce_uploads\\/2019\\/10\\/auctions_for_woocommerce.png\",\"excerpt\":\"A professional Auction solution for your WooCommerce store.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/wpinstitut.com\\/auctions-for-woocommerce-demo\\/\",\"price\":\"&#36;149.00\",\"hash\":\"c41a199e-5f49-4f5c-bb28-7ca22b0c4fe7\",\"slug\":\"auctions-for-woocommerce\",\"id\":4922919},{\"title\":\"Paywall for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/paywall-for-woocommerce-logo.png?w=150&amp;h=150&amp;crop=1\",\"excerpt\":\"Paywall is a WooCommerce extension that allows creating products with restricted access to content.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/paywall-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo-woocommerce-paywall.tiv.net\\/\",\"price\":\"&#36;79.00\",\"hash\":\"a688fc22-9370-4652-9e5e-f968ced9a0a8\",\"slug\":\"paywall-for-woocommerce\",\"id\":5253500},{\"title\":\"Auctions Made Easy for WooCommerce\",\"image\":\"\",\"excerpt\":\"Auctions Made Easy for WooCommerce is a full-featured auctions plugin for creating and managing online auctions in a WooCommerce shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/auctions-made-easy-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"a7fbc475-9946-4db9-92b6-5b7ebab3bab2\",\"slug\":\"auctions-made-easy-for-woocommerce\",\"id\":5249611},{\"title\":\"Assorted Products for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/10\\/icon.jpg\",\"excerpt\":\"Empower your customers to create product bundles\\u2014gift boxes of their choice comprising items from your shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/assorted-products-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/assorted-products.codeincept.com\\/product\\/assorted-product\\/\",\"price\":\"&#36;79.00\",\"hash\":\"6ab9ee51-c187-421c-9104-efa21d9423ca\",\"slug\":\"assorted-products-for-woocommerce\",\"id\":4911617},{\"title\":\"Smart Product Bundle For WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/01\\/productlogo-1.png\",\"excerpt\":\"Fulfill customer expectations with Smart Product Bundle and enrich customer experiences along with your sales revenue.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/smart-bundle-product-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/demo.wpexperts.io\\/smart-bundle-product-for-woocommerce\\/\",\"price\":\"&#36;79.00\",\"hash\":\"033cccdf-744b-4497-87b1-5765e71d3dcd\",\"slug\":\"smart-bundle-for-woocommerce\",\"id\":5193957},{\"title\":\"Featured Listing for Product Vendors\",\"image\":\"\",\"excerpt\":\"This is an addon of WooCommerce Product Vendor which offers vendor the option to feature their product ahead of others, for a small fee.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/featured-listing-for-product-vendors\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"https:\\/\\/demo.makewebbetter.com\\/featured-listing-for-product-vendors\\/\",\"price\":\"&#36;79.00\",\"hash\":\"78610942-f38c-4517-b7e0-4c3753d11752\",\"slug\":\"featured-listing-for-product-vendors\",\"id\":5021060},{\"title\":\"Shopee Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo.png\",\"excerpt\":\"Sell on Shopee with Shopee integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/shopee-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"dcf810b6-c8ce-48da-84ba-289ac4ee43f5\",\"slug\":\"woocommerce-shopee-integration\",\"id\":4794826},{\"title\":\"Walmart Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-1.png?w=150&amp;h=150&amp;crop=0\",\"excerpt\":\"Sell on Walmart with Walmart Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/walmart-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;249.00\",\"hash\":\"1237f272-56c8-4c77-8539-31450a2f4e1a\",\"slug\":\"walmart-integration-for-woocommerce\",\"id\":5423057},{\"title\":\"Etsy Integration for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2019\\/06\\/Logo-2.png?w=150&amp;h=150\",\"excerpt\":\"Sell on Etsy with Etsy Integration for WooCommerce. Automate, list, and sync inventories in a click and grow your sales.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/etsy-integration-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;199.00\",\"hash\":\"1dc5953a-3b22-4e73-9d7d-cc852d189beb\",\"slug\":\"woocommerce-etsy-integration\",\"id\":5712585},{\"title\":\"Custom Product Boxes\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/04\\/CPB_Icon.jpg?w=150&amp;h=150\",\"excerpt\":\"Custom product boxes for WooCommerce allows users to create product bundles by choosing specific items of their own choice from the collection of products.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/custom-product-boxes\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"http:\\/\\/composite-products.codeincept.com\\/product\\/cupcake-gift-box\\/\",\"price\":\"&#36;79.00\",\"hash\":\"ba19e1e3-1d5f-4e2c-bc3e-d7029c04f326\",\"slug\":\"custom-product-boxes\",\"id\":5706607},{\"title\":\"Lottery for WooCommerce\",\"image\":\"https:\\/\\/woocommerce.com\\/wp-content\\/uploads\\/2020\\/05\\/lottery-logo.png?w=150&amp;h=150\",\"excerpt\":\"Lottery for WooCommerce is a full-featured lottery plugin for creating and managing online lotteries in your WooCommerce Shop.\",\"link\":\"https:\\/\\/woocommerce.com\\/products\\/lottery-for-woocommerce\\/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\",\"demo_url\":\"\",\"price\":\"&#36;79.00\",\"hash\":\"9694c9bd-1d5c-43af-b1e9-796cc64b16a8\",\"slug\":\"lottery-for-woocommerce\",\"id\":5860289}]}\";s:7:\"headers\";O:25:\"Requests_Response_Headers\":1:{s:7:\"\0*\0data\";a:17:{s:6:\"server\";a:1:{i:0;s:5:\"nginx\";}s:4:\"date\";a:1:{i:0;s:29:\"Wed, 20 May 2020 06:02:27 GMT\";}s:12:\"content-type\";a:1:{i:0;s:31:\"application/json; charset=UTF-8\";}s:14:\"content-length\";a:1:{i:0;s:4:\"3790\";}s:12:\"x-robots-tag\";a:1:{i:0;s:7:\"noindex\";}s:4:\"link\";a:1:{i:0;s:60:\"<https://woocommerce.com/wp-json/>; rel=\"https://api.w.org/\"\";}s:22:\"x-content-type-options\";a:1:{i:0;s:7:\"nosniff\";}s:29:\"access-control-expose-headers\";a:1:{i:0;s:27:\"X-WP-Total, X-WP-TotalPages\";}s:28:\"access-control-allow-headers\";a:1:{i:0;s:27:\"Authorization, Content-Type\";}s:13:\"cache-control\";a:1:{i:0;s:10:\"max-age=60\";}s:5:\"allow\";a:1:{i:0;s:3:\"GET\";}s:16:\"content-encoding\";a:1:{i:0;s:4:\"gzip\";}s:4:\"x-rq\";a:1:{i:0;s:16:\"dfw1 86 200 3132\";}s:3:\"age\";a:1:{i:0;s:1:\"0\";}s:7:\"x-cache\";a:1:{i:0;s:3:\"hit\";}s:4:\"vary\";a:1:{i:0;s:23:\"Accept-Encoding, Origin\";}s:13:\"accept-ranges\";a:1:{i:0;s:5:\"bytes\";}}}s:11:\"status_code\";i:200;s:16:\"protocol_version\";d:1.1;s:7:\"success\";b:1;s:9:\"redirects\";i:0;s:3:\"url\";s:81:\"https://woocommerce.com/wp-json/wccom-extensions/1.0/search?category=product-type\";s:7:\"history\";a:0:{}s:7:\"cookies\";O:19:\"Requests_Cookie_Jar\":1:{s:10:\"\0*\0cookies\";a:0:{}}}s:11:\"\0*\0filename\";N;s:4:\"data\";N;s:7:\"headers\";N;s:6:\"status\";N;}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1292, 'recovery_mode_email_last_sent', '1589956189', 'yes'),
(1296, '_transient_timeout_wc_onboarding_themes', '1590043145', 'no'),
(1297, '_transient_wc_onboarding_themes', 'a:24:{s:13:\"1589867191-tg\";a:6:{s:4:\"slug\";s:13:\"1589867191-tg\";s:5:\"title\";s:27:\"The name | 05-19-20 7:46 am\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:67:\"http://localhost/N-E/wp-content/themes/1589867191-tg/screenshot.png\";s:23:\"has_woocommerce_support\";b:0;}s:10:\"storefront\";a:11:{s:5:\"title\";s:10:\"Storefront\";s:5:\"image\";s:77:\"https://woocommerce.com/wp-content/themes/woo/images/storefront/feature-1.jpg\";s:7:\"excerpt\";s:161:\"Storefront is an intuitive &amp; flexible, free theme offering deep integration with WooCommerce.\r\n\r\nIt\'s the perfect platform for your next WooCommerce project.\";s:4:\"link\";s:103:\"https://woocommerce.com/products/storefront/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:42:\"https://themes.woocommerce.com/storefront/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"5714dad8f8d0b930bd6cc9c99657b930\";s:4:\"slug\";s:10:\"storefront\";s:2:\"id\";i:565154;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"artisan\";a:11:{s:5:\"title\";s:7:\"Artisan\";s:5:\"image\";s:67:\"https://woocommerce.com/wp-content/uploads/2020/03/artisan-home.jpg\";s:7:\"excerpt\";s:79:\"Sell your hand-crafted products online using the Artisan Theme for WooCommerce.\";s:4:\"link\";s:100:\"https://woocommerce.com/products/artisan/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://organicthemes.com/demo/artisan/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"64529812-81f6-4efd-9686-ecb34e527421\";s:4:\"slug\";s:7:\"artisan\";s:2:\"id\";i:5576887;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"threads\";a:11:{s:5:\"title\";s:7:\"Threads\";s:5:\"image\";s:67:\"https://woocommerce.com/wp-content/uploads/2019/07/threads-home.jpg\";s:7:\"excerpt\";s:79:\"Create a stunning website for your apparel brand using Threads for WooCommerce.\";s:4:\"link\";s:100:\"https://woocommerce.com/products/threads/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://organicthemes.com/demo/threads/\";s:5:\"price\";s:10:\"&#36;79.00\";s:4:\"hash\";s:36:\"7ca579a6-6aaf-498c-9ee7-e15280ace9e9\";s:4:\"slug\";s:7:\"threads\";s:2:\"id\";i:4663191;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:10:\"block-shop\";a:11:{s:5:\"title\";s:10:\"Block Shop\";s:5:\"image\";s:79:\"https://woocommerce.com/wp-content/uploads/2019/08/block-shop-theme-preview.jpg\";s:7:\"excerpt\";s:154:\"A hassle-free Block-Editor-Era theme for your next WooCommerce project.\r\n\r\n&nbsp;\r\n\r\nPre-sale questions? Ask Get Bowtied: http://m.me/getbowtied\r\n\r\n&nbsp;\";s:4:\"link\";s:103:\"https://woocommerce.com/products/block-shop/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:34:\"https://blockshop.wp-theme.design/\";s:5:\"price\";s:10:\"&#36;59.00\";s:4:\"hash\";s:36:\"21fa433c-6c31-4be7-83ab-8d2cc8986130\";s:4:\"slug\";s:10:\"block-shop\";s:2:\"id\";i:4660093;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"bistro\";a:11:{s:5:\"title\";s:6:\"Bistro\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2016/07/bistro.png\";s:7:\"excerpt\";s:174:\"Bistro is a Storefront child theme designed for stores selling organic goods and other consumables. It features a friendly and warm design that lends itself to this industry.\";s:4:\"link\";s:99:\"https://woocommerce.com/products/bistro/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:37:\"https://themes.woocommerce.com/bistro\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"58e753f91fddf40abe8ebe4486f8c378\";s:4:\"slug\";s:6:\"bistro\";s:2:\"id\";i:1822936;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:10:\"stationery\";a:11:{s:5:\"title\";s:10:\"Stationery\";s:5:\"image\";s:65:\"https://woocommerce.com/wp-content/uploads/2016/04/stationery.jpg\";s:7:\"excerpt\";s:186:\"Stationery is a Storefront child theme designed for stores selling office supplies and/or arts &amp; crafts. The design has subtle tactile decorations while also being clean and elegant.\";s:4:\"link\";s:103:\"https://woocommerce.com/products/stationery/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:42:\"https://themes.woocommerce.com/stationery/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"b939225b8b8ccdc7b14ffb6d7eab2ac2\";s:4:\"slug\";s:10:\"stationery\";s:2:\"id\";i:1629126;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"petshop\";a:11:{s:5:\"title\";s:7:\"Petshop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2016/03/petshop.png\";s:7:\"excerpt\";s:181:\"Petshop is a Storefront child theme designed for stores selling products in the pet industry. The design is organic and friendly, featuring many details that point to pet ownership.\";s:4:\"link\";s:100:\"https://woocommerce.com/products/petshop/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/petshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"8060743c9031974326850f539aba5196\";s:4:\"slug\";s:7:\"petshop\";s:2:\"id\";i:1587689;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:5:\"hotel\";a:11:{s:5:\"title\";s:5:\"Hotel\";s:5:\"image\";s:69:\"https://woocommerce.com/wp-content/uploads/2016/03/hotel-featured.jpg\";s:7:\"excerpt\";s:246:\"Hotel is designed for businesses selling time, services and accommodation, offering unique integration with WooCommerce Bookings and Accommodation Bookings. The design is bold yet simple, allowing your content and imagery to do all the talking.\";s:4:\"link\";s:98:\"https://woocommerce.com/products/hotel/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:37:\"https://themes.woocommerce.com/hotel/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"0b0df891aa46f289f4e49bae2389bb04\";s:4:\"slug\";s:5:\"hotel\";s:2:\"id\";i:1554532;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"bookshop\";a:11:{s:5:\"title\";s:8:\"Bookshop\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2016/02/featured.png\";s:7:\"excerpt\";s:183:\"Bookshop comes with a unique homepage layout that prominently displays product categories and a variety of products in an arrangement that is popular with bookstores and collectibles.\";s:4:\"link\";s:101:\"https://woocommerce.com/products/bookshop/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/bookshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"9fe861227e3e82fde8fe5d7e8cc3340e\";s:4:\"slug\";s:8:\"bookshop\";s:2:\"id\";i:1508713;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"arcade\";a:11:{s:5:\"title\";s:6:\"Arcade\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2016/01/arcade.png\";s:7:\"excerpt\";s:216:\"Upgrade your video game shops look and feel with Arcade. It\'s bold and modern design will engage visitors and the unique homepage layout will present them with a variety of products as soon as they hit your homepage.\";s:4:\"link\";s:99:\"https://woocommerce.com/products/arcade/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://themes.woocommerce.com/arcade/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"5af09d4e590eec977c6b9519b517f479\";s:4:\"slug\";s:6:\"arcade\";s:2:\"id\";i:1418260;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:9:\"homestore\";a:11:{s:5:\"title\";s:9:\"Homestore\";s:5:\"image\";s:64:\"https://woocommerce.com/wp-content/uploads/2015/12/homestore.jpg\";s:7:\"excerpt\";s:166:\"Give your Department Store a classic look with Homestore. Its clean and efficient design will work well whether you\'re a boutique independent or a high street giant.\";s:4:\"link\";s:102:\"https://woocommerce.com/products/homestore/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:41:\"https://themes.woocommerce.com/homestore/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"d79fe7a1beba26523aafa6ce6d3e1e85\";s:4:\"slug\";s:9:\"homestore\";s:2:\"id\";i:1365559;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"pharmacy\";a:11:{s:5:\"title\";s:8:\"Pharmacy\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2015/12/pharmacy.jpg\";s:7:\"excerpt\";s:235:\"Give your health store a professional, trust-worthy design with the Pharmacy Storefront Child Theme. Built upon our rock solid Storefront Parent theme you\'ll also enjoy reliable integration with current and future WooCommerce releases.\";s:4:\"link\";s:101:\"https://woocommerce.com/products/pharmacy/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/pharmacy/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"ebeff3c0f89cd3169fb6b3e7e137e513\";s:4:\"slug\";s:8:\"pharmacy\";s:2:\"id\";i:1365557;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"toyshop\";a:11:{s:5:\"title\";s:7:\"ToyShop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2015/09/toyshop.jpg\";s:7:\"excerpt\";s:269:\"Add some fun to your store with ToyShop. The engaging and colorful design of ToyShop makes it a perfect child theme or any store that sells exciting products that are aimed at customers that like to have fun. The outdoorsy style would even be perfect for a flower shop.\";s:4:\"link\";s:100:\"https://woocommerce.com/products/toyshop/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/toyshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"3e2520021b41ee49a55b93362aaced98\";s:4:\"slug\";s:7:\"toyshop\";s:2:\"id\";i:1230716;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:6:\"outlet\";a:11:{s:5:\"title\";s:6:\"Outlet\";s:5:\"image\";s:61:\"https://woocommerce.com/wp-content/uploads/2015/09/outlet.jpg\";s:7:\"excerpt\";s:221:\"Overclock your tech store with Outlet! Whether you sell boutique iPad jewellery or the nuts and bolts of hardware itself, Outlet will give your shop a stylish look and feel while enjoying the stability of Storefront core.\";s:4:\"link\";s:99:\"https://woocommerce.com/products/outlet/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:38:\"https://themes.woocommerce.com/outlet/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"4c311cb3a3131570946b8799715a0991\";s:4:\"slug\";s:6:\"outlet\";s:2:\"id\";i:1212805;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:7:\"proshop\";a:11:{s:5:\"title\";s:7:\"ProShop\";s:5:\"image\";s:62:\"https://woocommerce.com/wp-content/uploads/2015/06/proshop.jpg\";s:7:\"excerpt\";s:176:\"Unlock the true potential of your sports clothing and equipment store with ProShop! It\'s metropolitan design provides an active aesthetic giving your store oodles of character.\";s:4:\"link\";s:100:\"https://woocommerce.com/products/proshop/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:39:\"https://themes.woocommerce.com/proshop/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"1d51b8633bbd1782dc17fce15f8bd2af\";s:4:\"slug\";s:7:\"proshop\";s:2:\"id\";i:1000757;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"galleria\";a:11:{s:5:\"title\";s:8:\"Galleria\";s:5:\"image\";s:68:\"https://woocommerce.com/wp-content/uploads/2015/05/galleria-hero.png\";s:7:\"excerpt\";s:162:\"Galleria is a Storefront child theme perfect for fashion and design stores. Stylish and minimalist, it gives sites a classy look and keeps products center stage.\";s:4:\"link\";s:101:\"https://woocommerce.com/products/galleria/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/galleria/\";s:5:\"price\";s:10:\"&#36;39.00\";s:4:\"hash\";s:32:\"2429c1dde521031cd053886b15844bbf\";s:4:\"slug\";s:8:\"galleria\";s:2:\"id\";i:887931;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:4:\"deli\";a:11:{s:5:\"title\";s:4:\"Deli\";s:5:\"image\";s:59:\"https://woocommerce.com/wp-content/uploads/2015/03/deli.jpg\";s:7:\"excerpt\";s:135:\"Deli is a Storefront child theme featuring a texturised, earthy design, perfect for stores selling natural, organic or hand made goods.\";s:4:\"link\";s:97:\"https://woocommerce.com/products/deli/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:36:\"https://themes.woocommerce.com/deli/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"83c6db94c8ebf9da56b59fb97f724e88\";s:4:\"slug\";s:4:\"deli\";s:2:\"id\";i:784823;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:8:\"boutique\";a:11:{s:5:\"title\";s:8:\"Boutique\";s:5:\"image\";s:63:\"https://woocommerce.com/wp-content/uploads/2015/01/boutique.png\";s:7:\"excerpt\";s:168:\"Boutique is a simple, traditionally designed Storefront child theme, ideal for small stores or boutiques. Add your logo, create a unique color scheme and start selling!\";s:4:\"link\";s:101:\"https://woocommerce.com/products/boutique/?utm_source=product&utm_medium=upsell&utm_campaign=wcaddons\";s:8:\"demo_url\";s:40:\"https://themes.woocommerce.com/boutique/\";s:5:\"price\";s:9:\"&#36;0.00\";s:4:\"hash\";s:32:\"71815288e266d58031727d48d6deee25\";s:4:\"slug\";s:8:\"boutique\";s:2:\"id\";i:605777;s:12:\"is_installed\";b:0;s:23:\"has_woocommerce_support\";b:1;}s:13:\"1589783880-tg\";a:6:{s:4:\"slug\";s:13:\"1589783880-tg\";s:5:\"title\";s:27:\"The name | 05-18-20 8:38 am\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:67:\"http://localhost/N-E/wp-content/themes/1589783880-tg/screenshot.png\";s:23:\"has_woocommerce_support\";b:0;}s:13:\"ecommerce-hub\";a:6:{s:4:\"slug\";s:13:\"ecommerce-hub\";s:5:\"title\";s:13:\"Ecommerce Hub\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:67:\"http://localhost/N-E/wp-content/themes/ecommerce-hub/screenshot.png\";s:23:\"has_woocommerce_support\";b:1;}s:14:\"twentynineteen\";a:6:{s:4:\"slug\";s:14:\"twentynineteen\";s:5:\"title\";s:15:\"Twenty Nineteen\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:68:\"http://localhost/N-E/wp-content/themes/twentynineteen/screenshot.png\";s:23:\"has_woocommerce_support\";b:0;}s:15:\"twentyseventeen\";a:6:{s:4:\"slug\";s:15:\"twentyseventeen\";s:5:\"title\";s:16:\"Twenty Seventeen\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:69:\"http://localhost/N-E/wp-content/themes/twentyseventeen/screenshot.png\";s:23:\"has_woocommerce_support\";b:0;}s:12:\"twentytwenty\";a:6:{s:4:\"slug\";s:12:\"twentytwenty\";s:5:\"title\";s:13:\"Twenty Twenty\";s:5:\"price\";s:4:\"0.00\";s:12:\"is_installed\";b:1;s:5:\"image\";s:66:\"http://localhost/N-E/wp-content/themes/twentytwenty/screenshot.png\";s:23:\"has_woocommerce_support\";b:0;}}', 'no'),
(1347, '_transient_timeout_wc_related_117', '1590045622', 'no'),
(1348, '_transient_wc_related_117', 'a:1:{s:51:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=117\";a:1:{i:0;s:2:\"82\";}}', 'no'),
(1358, '_transient_timeout_wc_related_113', '1590050444', 'no'),
(1359, '_transient_wc_related_113', 'a:1:{s:51:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=113\";a:2:{i:0;s:2:\"61\";i:1;s:2:\"64\";}}', 'no'),
(1366, '_site_transient_timeout_theme_roots', '1589961581', 'no'),
(1367, '_site_transient_theme_roots', 'a:6:{s:13:\"1589783880-tg\";s:7:\"/themes\";s:13:\"1589867191-tg\";s:7:\"/themes\";s:13:\"ecommerce-hub\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(1368, '_transient_timeout__woocommerce_helper_updates', '1590002982', 'no'),
(1369, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1589959782;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(1415, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(1449, 'product_cat_children', 'a:4:{i:15;a:2:{i:0;i:17;i:1;i:27;}i:17;a:2:{i:0;i:18;i:1;i:19;}i:20;a:3:{i:0;i:26;i:1;i:30;i:2;i:31;}i:24;a:1:{i:0;i:29;}}', 'yes'),
(1451, '_transient_timeout_woocommerce_admin_low_out_of_stock_count', '1589971029', 'no'),
(1452, '_transient_woocommerce_admin_low_out_of_stock_count', '0', 'no'),
(1454, '_transient_timeout_wc_term_counts', '1592559447', 'no'),
(1455, '_transient_wc_term_counts', 'a:7:{i:15;s:1:\"5\";i:24;s:0:\"\";i:25;s:0:\"\";i:22;s:0:\"\";i:23;s:0:\"\";i:21;s:0:\"\";i:20;s:1:\"5\";}', 'no'),
(1458, '_site_transient_timeout_available_translations', '1589978333', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1459, '_site_transient_available_translations', 'a:122:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-31 13:46:18\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 22:11:28\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.14\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.14/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-01-22 10:57:09\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"4.8.13\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.8.13/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-16 06:26:18\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-05-17 13:16:49\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-12 05:54:08\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-01-27 14:39:02\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-18 08:28:16\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 14:51:47\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 12:24:16\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.4.1/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 13:48:51\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 13:49:05\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/5.4.1/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 19:54:21\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 12:23:30\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 16:44:30\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-30 09:33:04\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 11:05:32\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-08 05:34:29\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-31 22:29:33\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 11:33:37\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-13 18:06:55\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 21:52:36\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 00:58:17\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 19:38:16\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 00:10:06\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-02-10 15:47:49\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:5:\"5.3.2\";s:7:\"updated\";s:19:\"2019-11-12 04:43:11\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.2/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:3:\"5.1\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.1/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-04 01:49:30\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 19:01:12\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-09 06:50:15\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:9:\"5.0-beta3\";s:7:\"updated\";s:19:\"2018-11-28 16:04:33\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.0-beta3/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-29 06:22:39\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 22:41:55\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 11:46:35\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-07 15:10:43\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-18 12:44:25\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 12:28:19\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 08:38:07\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-18 15:51:49\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-06-17 09:33:44\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 19:34:46\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 21:28:29\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.1/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 13:52:03\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-28 23:32:14\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.7.11\";s:7:\"updated\";s:19:\"2018-09-20 11:13:37\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-11 10:50:19\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-19 02:02:47\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-24 13:53:29\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-30 07:54:16\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-19 14:26:45\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.1/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-12 08:08:32\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"5.0.3\";s:7:\"updated\";s:19:\"2019-01-09 07:34:10\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.0.3/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:6:\"4.9.14\";s:7:\"updated\";s:19:\"2019-12-04 12:22:34\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.14/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರೆಸಿ\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-05-03 05:35:27\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.9.9\";s:7:\"updated\";s:19:\"2018-12-18 14:32:44\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.9/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-19 19:23:46\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.6/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-06 14:36:42\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"5.2.3\";s:7:\"updated\";s:19:\"2019-09-08 12:57:25\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.3/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.8.13\";s:7:\"updated\";s:19:\"2018-02-13 07:38:55\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.13/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-08-30 20:27:25\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.8/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-13 18:09:59\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-27 10:30:26\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 13:52:48\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.4.1/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 13:51:53\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 14:42:00\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-01-01 08:53:00\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-14 17:01:13\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-30 09:19:21\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/5.4.1/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-16 02:27:25\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 10:13:20\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 12:24:07\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 20:40:02\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 11:08:45\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:3:\"5.3\";s:7:\"updated\";s:19:\"2019-11-12 04:37:38\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/5.3/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:2:\"sd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-20 06:37:07\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-15 03:12:06\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.1/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2018-01-04 13:33:13\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-11 07:24:45\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-01 01:42:23\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 12:02:15\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-22 00:19:41\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.6/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2020-05-05 06:24:37\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.6/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-15 08:46:08\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-12 12:31:53\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-14 14:15:56\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.1/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"5.1.5\";s:7:\"updated\";s:19:\"2020-04-09 10:48:08\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.1.5/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:5:\"5.0.9\";s:7:\"updated\";s:19:\"2019-01-23 12:32:40\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.0.9/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2019-12-07 15:52:24\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.3.3/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-03-30 20:54:59\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-05-17 04:53:04\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-03-08 12:12:22\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(15, 11, '_wp_attached_file', '2020/05/imac-1999636.png'),
(16, 11, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:5500;s:6:\"height\";i:3000;s:4:\"file\";s:24:\"2020/05/imac-1999636.png\";s:5:\"sizes\";a:14:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:24:\"imac-1999636-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:24:\"imac-1999636-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:24:\"imac-1999636-600x327.png\";s:5:\"width\";i:600;s:6:\"height\";i:327;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"imac-1999636-300x164.png\";s:5:\"width\";i:300;s:6:\"height\";i:164;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:25:\"imac-1999636-1024x559.png\";s:5:\"width\";i:1024;s:6:\"height\";i:559;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"imac-1999636-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:24:\"imac-1999636-768x419.png\";s:5:\"width\";i:768;s:6:\"height\";i:419;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:25:\"imac-1999636-1536x838.png\";s:5:\"width\";i:1536;s:6:\"height\";i:838;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:26:\"imac-1999636-2048x1117.png\";s:5:\"width\";i:2048;s:6:\"height\";i:1117;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:25:\"imac-1999636-1200x655.png\";s:5:\"width\";i:1200;s:6:\"height\";i:655;s:9:\"mime-type\";s:9:\"image/png\";}s:23:\"twentytwenty-fullscreen\";a:4:{s:4:\"file\";s:26:\"imac-1999636-1980x1080.png\";s:5:\"width\";i:1980;s:6:\"height\";i:1080;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:24:\"imac-1999636-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:24:\"imac-1999636-600x327.png\";s:5:\"width\";i:600;s:6:\"height\";i:327;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:24:\"imac-1999636-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(17, 11, '_wp_attachment_image_alt', 'Producto Exclusivo'),
(43, 1, '_wp_trash_meta_status', 'publish'),
(44, 1, '_wp_trash_meta_time', '1589790779'),
(45, 1, '_wp_desired_post_slug', 'hola-mundo'),
(46, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(47, 15, '_edit_lock', '1589790885:1'),
(48, 16, '_edit_lock', '1589791103:1'),
(49, 17, '_wp_attached_file', '2020/05/2020-landscape-1.png'),
(50, 17, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:769;s:4:\"file\";s:28:\"2020/05/2020-landscape-1.png\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:28:\"2020-landscape-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:28:\"2020-landscape-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:28:\"2020-landscape-1-600x385.png\";s:5:\"width\";i:600;s:6:\"height\";i:385;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"2020-landscape-1-300x192.png\";s:5:\"width\";i:300;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:29:\"2020-landscape-1-1024x656.png\";s:5:\"width\";i:1024;s:6:\"height\";i:656;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"2020-landscape-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:28:\"2020-landscape-1-768x492.png\";s:5:\"width\";i:768;s:6:\"height\";i:492;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(51, 17, '_starter_content_theme', 'twentytwenty'),
(52, 17, '_customize_draft_post_name', 'el-nuevo-umoma-abre-sus-puertas'),
(53, 18, '_thumbnail_id', '17'),
(54, 18, '_customize_draft_post_name', 'el-nuevo-umoma-abre-sus-puertas'),
(55, 18, '_customize_changeset_uuid', '6947b36f-f240-4949-8944-f5c6da8fa2ae'),
(56, 19, '_customize_draft_post_name', 'acerca-de'),
(57, 19, '_customize_changeset_uuid', '6947b36f-f240-4949-8944-f5c6da8fa2ae'),
(58, 20, '_customize_draft_post_name', 'contacto'),
(59, 20, '_customize_changeset_uuid', '6947b36f-f240-4949-8944-f5c6da8fa2ae'),
(60, 21, '_customize_draft_post_name', 'blog'),
(61, 21, '_customize_changeset_uuid', '6947b36f-f240-4949-8944-f5c6da8fa2ae'),
(62, 23, '_wp_attached_file', '2020/05/2020-landscape-1-1.png'),
(63, 23, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:769;s:4:\"file\";s:30:\"2020/05/2020-landscape-1-1.png\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"2020-landscape-1-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"2020-landscape-1-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"2020-landscape-1-1-600x385.png\";s:5:\"width\";i:600;s:6:\"height\";i:385;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"2020-landscape-1-1-300x192.png\";s:5:\"width\";i:300;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"2020-landscape-1-1-1024x656.png\";s:5:\"width\";i:1024;s:6:\"height\";i:656;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"2020-landscape-1-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"2020-landscape-1-1-768x492.png\";s:5:\"width\";i:768;s:6:\"height\";i:492;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(64, 23, '_starter_content_theme', 'twentytwenty'),
(65, 23, '_customize_draft_post_name', 'el-nuevo-umoma-abre-sus-puertas'),
(66, 24, '_thumbnail_id', '23'),
(67, 24, '_customize_draft_post_name', 'el-nuevo-umoma-abre-sus-puertas'),
(68, 24, '_customize_changeset_uuid', '4db6d440-f478-40de-91d9-76f70f034a90'),
(69, 25, '_customize_draft_post_name', 'acerca-de'),
(70, 25, '_customize_changeset_uuid', '4db6d440-f478-40de-91d9-76f70f034a90'),
(71, 26, '_customize_draft_post_name', 'contacto'),
(72, 26, '_customize_changeset_uuid', '4db6d440-f478-40de-91d9-76f70f034a90'),
(73, 27, '_customize_draft_post_name', 'blog'),
(74, 27, '_customize_changeset_uuid', '4db6d440-f478-40de-91d9-76f70f034a90'),
(75, 29, '_edit_lock', '1589797974:1'),
(76, 33, '_edit_lock', '1589798612:1'),
(79, 35, '_wp_trash_meta_status', 'publish'),
(80, 35, '_wp_trash_meta_time', '1589865882'),
(81, 28, '_customize_restore_dismissed', '1'),
(82, 22, '_customize_restore_dismissed', '1'),
(83, 36, '_menu_item_type', 'custom'),
(84, 36, '_menu_item_menu_item_parent', '0'),
(85, 36, '_menu_item_object_id', '36'),
(86, 36, '_menu_item_object', 'custom'),
(87, 36, '_menu_item_target', ''),
(88, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(89, 36, '_menu_item_xfn', ''),
(90, 36, '_menu_item_url', 'http://localhost/N-E/'),
(92, 37, '_menu_item_type', 'post_type'),
(93, 37, '_menu_item_menu_item_parent', '0'),
(94, 37, '_menu_item_object_id', '31'),
(95, 37, '_menu_item_object', 'page'),
(96, 37, '_menu_item_target', ''),
(97, 37, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(98, 37, '_menu_item_xfn', ''),
(99, 37, '_menu_item_url', ''),
(100, 37, '_menu_item_orphaned', '1589865922'),
(101, 38, '_menu_item_type', 'post_type'),
(102, 38, '_menu_item_menu_item_parent', '0'),
(103, 38, '_menu_item_object_id', '32'),
(104, 38, '_menu_item_object', 'page'),
(105, 38, '_menu_item_target', ''),
(106, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(107, 38, '_menu_item_xfn', ''),
(108, 38, '_menu_item_url', ''),
(109, 38, '_menu_item_orphaned', '1589865923'),
(110, 39, '_menu_item_type', 'post_type'),
(111, 39, '_menu_item_menu_item_parent', '0'),
(112, 39, '_menu_item_object_id', '33'),
(113, 39, '_menu_item_object', 'page'),
(114, 39, '_menu_item_target', ''),
(115, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(116, 39, '_menu_item_xfn', ''),
(117, 39, '_menu_item_url', ''),
(118, 39, '_menu_item_orphaned', '1589865923'),
(119, 40, '_menu_item_type', 'post_type'),
(120, 40, '_menu_item_menu_item_parent', '0'),
(121, 40, '_menu_item_object_id', '30'),
(122, 40, '_menu_item_object', 'page'),
(123, 40, '_menu_item_target', ''),
(124, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(125, 40, '_menu_item_xfn', ''),
(126, 40, '_menu_item_url', ''),
(127, 40, '_menu_item_orphaned', '1589865924'),
(128, 41, '_menu_item_type', 'post_type'),
(129, 41, '_menu_item_menu_item_parent', '0'),
(130, 41, '_menu_item_object_id', '33'),
(131, 41, '_menu_item_object', 'page'),
(132, 41, '_menu_item_target', ''),
(133, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(134, 41, '_menu_item_xfn', ''),
(135, 41, '_menu_item_url', ''),
(136, 41, '_menu_item_orphaned', '1589865932'),
(137, 42, '_menu_item_type', 'post_type'),
(138, 42, '_menu_item_menu_item_parent', '0'),
(139, 42, '_menu_item_object_id', '32'),
(140, 42, '_menu_item_object', 'page'),
(141, 42, '_menu_item_target', ''),
(142, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(143, 42, '_menu_item_xfn', ''),
(144, 42, '_menu_item_url', ''),
(145, 42, '_menu_item_orphaned', '1589865932'),
(146, 43, '_menu_item_type', 'post_type'),
(147, 43, '_menu_item_menu_item_parent', '0'),
(148, 43, '_menu_item_object_id', '31'),
(149, 43, '_menu_item_object', 'page'),
(150, 43, '_menu_item_target', ''),
(151, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(152, 43, '_menu_item_xfn', ''),
(153, 43, '_menu_item_url', ''),
(154, 43, '_menu_item_orphaned', '1589865933'),
(155, 44, '_menu_item_type', 'post_type'),
(156, 44, '_menu_item_menu_item_parent', '0'),
(157, 44, '_menu_item_object_id', '30'),
(158, 44, '_menu_item_object', 'page'),
(159, 44, '_menu_item_target', ''),
(160, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(161, 44, '_menu_item_xfn', ''),
(162, 44, '_menu_item_url', ''),
(163, 44, '_menu_item_orphaned', '1589865933'),
(164, 45, '_menu_item_type', 'post_type'),
(165, 45, '_menu_item_menu_item_parent', '0'),
(166, 45, '_menu_item_object_id', '33'),
(167, 45, '_menu_item_object', 'page'),
(168, 45, '_menu_item_target', ''),
(169, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(170, 45, '_menu_item_xfn', ''),
(171, 45, '_menu_item_url', ''),
(173, 46, '_menu_item_type', 'post_type'),
(174, 46, '_menu_item_menu_item_parent', '0'),
(175, 46, '_menu_item_object_id', '32'),
(176, 46, '_menu_item_object', 'page'),
(177, 46, '_menu_item_target', ''),
(178, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(179, 46, '_menu_item_xfn', ''),
(180, 46, '_menu_item_url', ''),
(182, 47, '_menu_item_type', 'post_type'),
(183, 47, '_menu_item_menu_item_parent', '0'),
(184, 47, '_menu_item_object_id', '31'),
(185, 47, '_menu_item_object', 'page'),
(186, 47, '_menu_item_target', ''),
(187, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(188, 47, '_menu_item_xfn', ''),
(189, 47, '_menu_item_url', ''),
(191, 48, '_menu_item_type', 'post_type'),
(192, 48, '_menu_item_menu_item_parent', '0'),
(193, 48, '_menu_item_object_id', '30'),
(194, 48, '_menu_item_object', 'page'),
(195, 48, '_menu_item_target', ''),
(196, 48, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(197, 48, '_menu_item_xfn', ''),
(198, 48, '_menu_item_url', ''),
(200, 31, '_edit_lock', '1589868042:1'),
(203, 50, '_menu_item_type', 'custom'),
(204, 50, '_menu_item_menu_item_parent', '0'),
(205, 50, '_menu_item_object_id', '50'),
(206, 50, '_menu_item_object', 'custom'),
(207, 50, '_menu_item_target', ''),
(208, 50, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(209, 50, '_menu_item_xfn', ''),
(210, 50, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/orders/'),
(211, 50, '_menu_item_orphaned', '1589867541'),
(212, 51, '_menu_item_type', 'custom'),
(213, 51, '_menu_item_menu_item_parent', '0'),
(214, 51, '_menu_item_object_id', '51'),
(215, 51, '_menu_item_object', 'custom'),
(216, 51, '_menu_item_target', ''),
(217, 51, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(218, 51, '_menu_item_xfn', ''),
(219, 51, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/downloads/'),
(220, 51, '_menu_item_orphaned', '1589867542'),
(221, 52, '_menu_item_type', 'custom'),
(222, 52, '_menu_item_menu_item_parent', '0'),
(223, 52, '_menu_item_object_id', '52'),
(224, 52, '_menu_item_object', 'custom'),
(225, 52, '_menu_item_target', ''),
(226, 52, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(227, 52, '_menu_item_xfn', ''),
(228, 52, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/edit-address/'),
(229, 52, '_menu_item_orphaned', '1589867543'),
(230, 53, '_menu_item_type', 'custom'),
(231, 53, '_menu_item_menu_item_parent', '0'),
(232, 53, '_menu_item_object_id', '53'),
(233, 53, '_menu_item_object', 'custom'),
(234, 53, '_menu_item_target', ''),
(235, 53, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(236, 53, '_menu_item_xfn', ''),
(237, 53, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/edit-account/'),
(238, 53, '_menu_item_orphaned', '1589867544'),
(239, 54, '_menu_item_type', 'custom'),
(240, 54, '_menu_item_menu_item_parent', '0'),
(241, 54, '_menu_item_object_id', '54'),
(242, 54, '_menu_item_object', 'custom'),
(243, 54, '_menu_item_target', ''),
(244, 54, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(245, 54, '_menu_item_xfn', ''),
(246, 54, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/customer-logout/?_wpnonce=60b975fd6d'),
(247, 54, '_menu_item_orphaned', '1589867544'),
(248, 55, '_menu_item_type', 'custom'),
(249, 55, '_menu_item_menu_item_parent', '0'),
(250, 55, '_menu_item_object_id', '55'),
(251, 55, '_menu_item_object', 'custom'),
(252, 55, '_menu_item_target', ''),
(253, 55, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(254, 55, '_menu_item_xfn', ''),
(255, 55, '_menu_item_url', 'http://localhost/N-E/mi-cuenta/lost-password/'),
(256, 55, '_menu_item_orphaned', '1589867545'),
(257, 56, '_wp_trash_meta_status', 'publish'),
(258, 56, '_wp_trash_meta_time', '1589868246'),
(259, 57, '_wp_trash_meta_status', 'publish'),
(260, 57, '_wp_trash_meta_time', '1589868276'),
(265, 59, '_wp_attached_file', '2020/05/3957-scaled.jpg'),
(266, 59, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:23:\"2020/05/3957-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"3957-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"3957-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"3957-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"3957-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:18:\"3957-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:18:\"3957-2048x1365.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:18:\"3957-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:16:\"3957-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"3957-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"3957-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"3957-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"3957-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"3957-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"3957-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.8\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:8:\"ILCE-7M3\";s:7:\"caption\";s:99:\"Girl shows her pumped belly press. Athletic body after diet and heavy exercise, slim waist close up\";s:17:\"created_timestamp\";s:10:\"1569419569\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"55\";s:3:\"iso\";s:3:\"400\";s:13:\"shutter_speed\";s:6:\"0.0025\";s:5:\"title\";s:90:\"Girl shows her pumped belly press. Athletic body after diet and heavy exercise, slim waist\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:50:{i:0;s:7:\"abdomen\";i:1;s:9:\"abdominal\";i:2;s:6:\"active\";i:3;s:7:\"athlete\";i:4;s:8:\"athletic\";i:5;s:10:\"attractive\";i:6;s:9:\"beautiful\";i:7;s:4:\"body\";i:8;s:11:\"bodybuilder\";i:9;s:12:\"bodybuilding\";i:10;s:4:\"diet\";i:11;s:7:\"dieting\";i:12;s:8:\"exercise\";i:13;s:6:\"female\";i:14;s:3:\"fit\";i:15;s:7:\"fitness\";i:16;s:3:\"gym\";i:17;s:6:\"health\";i:18;s:7:\"healthy\";i:19;s:9:\"lifestyle\";i:20;s:4:\"lose\";i:21;s:4:\"loss\";i:22;s:7:\"measure\";i:23;s:6:\"muscle\";i:24;s:7:\"muscles\";i:25;s:8:\"muscular\";i:26;s:10:\"overweight\";i:27;s:6:\"person\";i:28;s:5:\"power\";i:29;s:4:\"pump\";i:30;s:6:\"raised\";i:31;s:5:\"shape\";i:32;s:8:\"slimming\";i:33;s:5:\"sport\";i:34;s:9:\"sportsman\";i:35;s:10:\"sportswear\";i:36;s:6:\"sporty\";i:37;s:7:\"stomach\";i:38;s:6:\"strong\";i:39;s:6:\"summer\";i:40;s:4:\"thin\";i:41;s:7:\"trainer\";i:42;s:8:\"training\";i:43;s:6:\"weight\";i:44;s:13:\"weightlifting\";i:45;s:8:\"wellness\";i:46;s:5:\"white\";i:47;s:5:\"woman\";i:48;s:7:\"workout\";i:49;s:5:\"young\";}}s:14:\"original_image\";s:8:\"3957.jpg\";}'),
(267, 59, '_wp_attachment_image_alt', ''),
(268, 60, '_edit_last', '1'),
(269, 60, '_edit_lock', '1589876079:1'),
(270, 61, '_edit_last', '1'),
(271, 61, '_edit_lock', '1589879675:1'),
(272, 62, '_wp_attached_file', '2020/05/Vitality.png'),
(273, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:20:\"2020/05/Vitality.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"Vitality-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"Vitality-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"Vitality-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"Vitality-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"Vitality-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"Vitality-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"Vitality-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(274, 61, '_thumbnail_id', '62'),
(275, 61, '_sku', 'NuMuMu'),
(276, 61, '_regular_price', '500'),
(277, 61, 'total_sales', '0'),
(278, 61, '_tax_status', 'taxable'),
(279, 61, '_tax_class', ''),
(280, 61, '_manage_stock', 'yes'),
(281, 61, '_backorders', 'no'),
(282, 61, '_low_stock_amount', '100'),
(283, 61, '_sold_individually', 'yes'),
(284, 61, '_virtual', 'no'),
(285, 61, '_downloadable', 'no'),
(286, 61, '_download_limit', '-1'),
(287, 61, '_download_expiry', '-1'),
(288, 61, '_stock', '200'),
(289, 61, '_stock_status', 'instock'),
(290, 61, '_wc_average_rating', '0'),
(291, 61, '_wc_review_count', '0'),
(292, 61, '_product_version', '4.1.0'),
(293, 61, '_price', '500'),
(294, 60, '_wp_trash_meta_status', 'draft'),
(295, 60, '_wp_trash_meta_time', '1589877306'),
(296, 60, '_wp_desired_post_slug', ''),
(297, 64, '_sku', 'NuMuHo'),
(298, 64, '_regular_price', '500'),
(299, 64, 'total_sales', '0'),
(300, 64, '_tax_status', 'taxable'),
(301, 64, '_tax_class', ''),
(302, 64, '_manage_stock', 'yes'),
(303, 64, '_backorders', 'no'),
(304, 64, '_low_stock_amount', '100'),
(305, 64, '_sold_individually', 'yes'),
(306, 64, '_virtual', 'no'),
(307, 64, '_downloadable', 'no'),
(308, 64, '_download_limit', '-1'),
(309, 64, '_download_expiry', '-1'),
(310, 64, '_thumbnail_id', '65'),
(311, 64, '_stock', '200'),
(312, 64, '_stock_status', 'instock'),
(313, 64, '_wc_average_rating', '0'),
(314, 64, '_wc_review_count', '0'),
(315, 64, '_product_version', '4.1.0'),
(316, 64, '_price', '500'),
(317, 64, '_edit_lock', '1589879591:1'),
(318, 64, '_edit_last', '1'),
(319, 65, '_wp_attached_file', '2020/05/Vitality-Blue.png'),
(320, 65, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:25:\"2020/05/Vitality-Blue.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:25:\"Vitality-Blue-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:25:\"Vitality-Blue-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(321, 58, '_customize_restore_dismissed', '1'),
(322, 66, '_wp_trash_meta_status', 'publish'),
(323, 66, '_wp_trash_meta_time', '1589878221'),
(324, 67, '_edit_lock', '1589878619:1'),
(325, 67, '_wp_trash_meta_status', 'publish'),
(326, 67, '_wp_trash_meta_time', '1589878621'),
(327, 68, '_edit_lock', '1589879351:1'),
(328, 68, '_wp_trash_meta_status', 'publish'),
(329, 68, '_wp_trash_meta_time', '1589879368'),
(330, 69, '_edit_lock', '1589879592:1'),
(331, 69, '_wp_trash_meta_status', 'publish'),
(332, 69, '_wp_trash_meta_time', '1589879599'),
(333, 71, '_wp_attached_file', '2020/05/10411-scaled.jpg'),
(334, 71, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1920;s:4:\"file\";s:24:\"2020/05/10411-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"10411-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"10411-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"10411-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:17:\"10411-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:19:\"10411-1536x1152.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:19:\"10411-2048x1536.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:19:\"10411-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:17:\"10411-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:17:\"10411-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:17:\"10411-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:17:\"10411-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:17:\"10411-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:17:\"10411-600x450.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:17:\"10411-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:68:\"3D render of a wooden table against a defocussed sunny room interior\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:56:\"3D wooden table against a defocussed sunny room interior\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:23:{i:0;s:9:\"3d render\";i:1;s:2:\"3d\";i:2;s:6:\"render\";i:3;s:10:\"background\";i:4;s:9:\"landscape\";i:5;s:4:\"wood\";i:6;s:6:\"wooden\";i:7;s:3:\"old\";i:8;s:7:\"vintage\";i:9;s:7:\"concept\";i:10;s:4:\"room\";i:11;s:8:\"interior\";i:12;s:6:\"lounge\";i:13;s:4:\"home\";i:14;s:5:\"house\";i:15;s:4:\"wall\";i:16;s:5:\"table\";i:17;s:12:\"presentation\";i:18;s:10:\"defocussed\";i:19;s:4:\"room\";i:20;s:7:\"display\";i:21;s:4:\"blur\";i:22;s:4:\"home\";}}s:14:\"original_image\";s:9:\"10411.jpg\";}'),
(335, 72, '_wp_attached_file', '2020/05/O7300K0-scaled.jpg'),
(336, 72, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1762;s:4:\"file\";s:26:\"2020/05/O7300K0-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"O7300K0-300x206.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:20:\"O7300K0-1024x705.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:705;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"O7300K0-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"O7300K0-768x529.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:529;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:21:\"O7300K0-1536x1057.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1057;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:21:\"O7300K0-2048x1409.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1409;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:21:\"O7300K0-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:19:\"O7300K0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:19:\"O7300K0-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:19:\"O7300K0-600x413.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:413;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"O7300K0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:19:\"O7300K0-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:19:\"O7300K0-600x413.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:413;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"O7300K0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"3.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:21:\"Canon EOS 5D Mark III\";s:7:\"caption\";s:42:\"Close-up of lips of young beautiful female\";s:17:\"created_timestamp\";s:10:\"1396430773\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"180\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:7:\"0.00625\";s:5:\"title\";s:12:\"Sensual lips\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:50:{i:0;s:6:\"people\";i:1;s:6:\"person\";i:2;s:5:\"human\";i:3;s:8:\"personal\";i:4;s:5:\"woman\";i:5;s:6:\"female\";i:6;s:4:\"face\";i:7;s:8:\"feminine\";i:8;s:5:\"charm\";i:9;s:8:\"charming\";i:10;s:10:\"femininity\";i:11;s:6:\"beauty\";i:12;s:9:\"beautiful\";i:13;s:6:\"makeup\";i:14;s:4:\"part\";i:15;s:7:\"closeup\";i:16;s:8:\"close-up\";i:17;s:8:\"isolated\";i:18;s:9:\"isolation\";i:19;s:9:\"lifestyle\";i:20;s:10:\"attractive\";i:21;s:5:\"young\";i:22;s:5:\"adult\";i:23;s:6:\"single\";i:24;s:9:\"Caucasian\";i:25;s:6:\"facial\";i:26;s:6:\"visage\";i:27;s:8:\"skincare\";i:28;s:8:\"positive\";i:29;s:7:\"natural\";i:30;s:5:\"vogue\";i:31;s:8:\"gorgeous\";i:32;s:4:\"lady\";i:33;s:6:\"lovely\";i:34;s:7:\"radiant\";i:35;s:9:\"sensitive\";i:36;s:10:\"beautician\";i:37;s:11:\"cosmetician\";i:38;s:9:\"cosmetics\";i:39;s:6:\"serene\";i:40;s:4:\"calm\";i:41;s:4:\"neck\";i:42;s:9:\"decollete\";i:43;s:8:\"lipstick\";i:44;s:5:\"gloss\";i:45;s:7:\"perfect\";i:46;s:10:\"perfection\";i:47;s:4:\"lips\";i:48;s:7:\"sensual\";i:49;s:10:\"sensuality\";}}s:14:\"original_image\";s:11:\"O7300K0.jpg\";}'),
(337, 73, '_wp_attached_file', '2020/05/9313-scaled.jpg'),
(338, 73, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:2276;s:4:\"file\";s:23:\"2020/05/9313-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"9313-300x267.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:267;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"9313-1024x910.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:910;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"9313-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"9313-768x683.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:18:\"9313-1536x1365.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:18:\"9313-2048x1820.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1820;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:18:\"9313-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:16:\"9313-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"9313-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"9313-600x533.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:533;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"9313-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"9313-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"9313-600x533.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:533;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"9313-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:129:\"Makeup cosmetics beauty bag accessories realistic composition poster with lipstick lip gloss and eye shadows vector  illustration\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:57:\"Makeup Cosmetics Accessories Realistic Composition Poster\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:50:{i:0;s:8:\"personal\";i:1;s:4:\"face\";i:2;s:4:\"skin\";i:3;s:4:\"care\";i:4;s:6:\"beauty\";i:5;s:6:\"makeup\";i:6;s:9:\"cosmetics\";i:7;s:8:\"products\";i:8;s:6:\"luxury\";i:9;s:12:\"moisturizing\";i:10;s:5:\"daily\";i:11;s:10:\"foundation\";i:12;s:7:\"compact\";i:13;s:6:\"powder\";i:14;s:8:\"eyeliner\";i:15;s:4:\"lips\";i:16;s:5:\"gloss\";i:17;s:10:\"contouring\";i:18;s:6:\"pencil\";i:19;s:7:\"perfume\";i:20;s:10:\"decorative\";i:21;s:6:\"banner\";i:22;s:6:\"poster\";i:23;s:10:\"collection\";i:24;s:3:\"set\";i:25;s:4:\"sale\";i:26;s:5:\"flyer\";i:27;s:7:\"website\";i:28;s:9:\"drugstore\";i:29;s:2:\"ad\";i:30;s:13:\"advertisement\";i:31;s:6:\"design\";i:32;s:7:\"present\";i:33;s:6:\"trendy\";i:34;s:11:\"accessories\";i:35;s:8:\"lipstick\";i:36;s:7:\"mascara\";i:37;s:6:\"shades\";i:38;s:7:\"shadows\";i:39;s:7:\"brushes\";i:40;s:3:\"eye\";i:41;s:5:\"blush\";i:42;s:6:\"mirror\";i:43;s:4:\"case\";i:44;s:5:\"tubes\";i:45;s:6:\"bottle\";i:46;s:5:\"women\";i:47;s:9:\"realistic\";i:48;s:6:\"vector\";i:49;s:12:\"illustration\";}}s:14:\"original_image\";s:8:\"9313.jpg\";}'),
(339, 74, '_wp_attached_file', '2020/05/2494-scaled.jpg'),
(340, 74, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1440;s:4:\"file\";s:23:\"2020/05/2494-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"2494-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"2494-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"2494-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"2494-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:17:\"2494-1536x864.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:18:\"2494-2048x1152.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:18:\"2494-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:16:\"2494-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"2494-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"2494-600x338.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:338;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"2494-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"2494-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"2494-600x338.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:338;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"2494-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:200:\"Asian woman using alcohol gel hand sanitizer wash hand before open tablet for protect coronavirus. Female push alcohol to clean for hygiene when social distancing stay at home and self quarantine time\";s:17:\"created_timestamp\";s:10:\"1586264508\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:64:\"Asian woman using alcohol gel hand sanitizer wash hand before op\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:50:{i:0;s:9:\"2019-ncov\";i:1;s:7:\"alcohol\";i:2;s:13:\"antibacterial\";i:3;s:10:\"antiseptic\";i:4;s:4:\"asia\";i:5;s:5:\"asian\";i:6;s:8:\"bacteria\";i:7;s:8:\"business\";i:8;s:4:\"care\";i:9;s:5:\"clean\";i:10;s:8:\"computer\";i:11;s:6:\"corona\";i:12;s:11:\"coronavirus\";i:13;s:5:\"covid\";i:14;s:8:\"covid-19\";i:15;s:7:\"disease\";i:16;s:9:\"disinfect\";i:17;s:12:\"disinfection\";i:18;s:4:\"face\";i:19;s:6:\"female\";i:20;s:3:\"gel\";i:21;s:4:\"girl\";i:22;s:4:\"hand\";i:23;s:6:\"health\";i:24;s:4:\"home\";i:25;s:8:\"hospital\";i:26;s:7:\"hygiene\";i:27;s:9:\"isolation\";i:28;s:4:\"mask\";i:29;s:7:\"medical\";i:30;s:6:\"office\";i:31;s:15:\"online shopping\";i:32;s:8:\"pandemic\";i:33;s:7:\"patient\";i:34;s:6:\"person\";i:35;s:7:\"prevent\";i:36;s:7:\"protect\";i:37;s:10:\"quarantine\";i:38;s:9:\"sanitiser\";i:39;s:9:\"sanitizer\";i:40;s:4:\"sick\";i:41;s:12:\"social media\";i:42;s:6:\"tablet\";i:43;s:5:\"virus\";i:44;s:4:\"wash\";i:45;s:5:\"woman\";i:46;s:4:\"work\";i:47;s:6:\"worker\";i:48;s:9:\"workplace\";i:49;s:5:\"young\";}}s:14:\"original_image\";s:8:\"2494.jpg\";}'),
(341, 75, '_wp_attached_file', '2020/05/5266-scaled.jpg'),
(342, 75, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1707;s:4:\"file\";s:23:\"2020/05/5266-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"5266-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"5266-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"5266-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"5266-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:18:\"5266-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:18:\"5266-2048x1365.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:18:\"5266-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:16:\"5266-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"5266-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"5266-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"5266-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:16:\"5266-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:16:\"5266-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:16:\"5266-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"9\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:21:\"Canon EOS 5D Mark III\";s:7:\"caption\";s:54:\"The oranges oil from orange on green studio background\";s:17:\"created_timestamp\";s:10:\"1509985065\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"100\";s:3:\"iso\";s:3:\"320\";s:13:\"shutter_speed\";s:7:\"0.00625\";s:5:\"title\";s:22:\"oranges oil and Orange\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:50:{i:0;s:12:\"aromatherapy\";i:1;s:6:\"citrus\";i:2;s:7:\"massage\";i:3;s:6:\"orange\";i:4;s:3:\"spa\";i:5;s:9:\"treatment\";i:6;s:6:\"beauty\";i:7;s:4:\"care\";i:8;s:5:\"fruit\";i:9;s:6:\"health\";i:10;s:7:\"natural\";i:11;s:7:\"therapy\";i:12;s:11:\"alternative\";i:13;s:6:\"bottle\";i:14;s:7:\"essence\";i:15;s:9:\"essential\";i:16;s:5:\"fresh\";i:17;s:5:\"glass\";i:18;s:8:\"medicine\";i:19;s:3:\"oil\";i:20;s:7:\"organic\";i:21;s:7:\"perfume\";i:22;s:8:\"wellness\";i:23;s:10:\"background\";i:24;s:8:\"cosmetic\";i:25;s:9:\"fragrance\";i:26;s:9:\"freshness\";i:27;s:7:\"healthy\";i:28;s:10:\"relaxation\";i:29;s:7:\"vitamin\";i:30;s:6:\"wooden\";i:31;s:5:\"aroma\";i:32;s:4:\"body\";i:33;s:6:\"herbal\";i:34;s:7:\"hygiene\";i:35;s:5:\"lemon\";i:36;s:6:\"nature\";i:37;s:5:\"plant\";i:38;s:5:\"relax\";i:39;s:8:\"aromatic\";i:40;s:6:\"fruity\";i:41;s:9:\"lifestyle\";i:42;s:9:\"pampering\";i:43;s:7:\"product\";i:44;s:4:\"pure\";i:45;s:6:\"remedy\";i:46;s:5:\"scent\";i:47;s:7:\"extract\";i:48;s:4:\"food\";i:49;s:6:\"liquid\";}}s:14:\"original_image\";s:8:\"5266.jpg\";}'),
(343, 76, '_wp_attached_file', '2020/05/63503-scaled.jpg'),
(344, 76, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2187;s:6:\"height\";i:2560;s:4:\"file\";s:24:\"2020/05/63503-scaled.jpg\";s:5:\"sizes\";a:14:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"63503-256x300.jpg\";s:5:\"width\";i:256;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"63503-875x1024.jpg\";s:5:\"width\";i:875;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"63503-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:17:\"63503-768x899.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:899;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:19:\"63503-1312x1536.jpg\";s:5:\"width\";i:1312;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:19:\"63503-1750x2048.jpg\";s:5:\"width\";i:1750;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"themesgenerator-featured-image\";a:4:{s:4:\"file\";s:19:\"63503-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:17:\"63503-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:17:\"63503-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:17:\"63503-600x702.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:702;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:17:\"63503-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:17:\"63503-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:17:\"63503-600x702.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:702;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:17:\"63503-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:73:\"Bank,global economy and money savings graphic, vector illustration design\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:37:\"Bank,global economy and money savings\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:31:{i:0;s:5:\"money\";i:1;s:8:\"business\";i:2;s:5:\"piggy\";i:3;s:5:\"coins\";i:4;s:4:\"hand\";i:5;s:7:\"cartoon\";i:6;s:7:\"payment\";i:7;s:7:\"savings\";i:8;s:4:\"bank\";i:9;s:7:\"finance\";i:10;s:6:\"dollar\";i:11;s:6:\"vector\";i:12;s:12:\"illustration\";i:13;s:8:\"currency\";i:14;s:7:\"banking\";i:15;s:10:\"investment\";i:16;s:4:\"cash\";i:17;s:6:\"wealth\";i:18;s:8:\"commerce\";i:19;s:9:\"financial\";i:20;s:4:\"rich\";i:21;s:3:\"pay\";i:22;s:7:\"success\";i:23;s:8:\"treasure\";i:24;s:7:\"graphic\";i:25;s:10:\"commercial\";i:26;s:9:\"abundance\";i:27;s:10:\"prosperity\";i:28;s:7:\"economy\";i:29;s:6:\"salary\";i:30;s:6:\"credit\";}}s:14:\"original_image\";s:9:\"63503.jpg\";}'),
(345, 77, '_wp_trash_meta_status', 'publish'),
(346, 77, '_wp_trash_meta_time', '1589881610'),
(347, 78, '_edit_lock', '1589881702:1'),
(348, 78, '_wp_trash_meta_status', 'publish'),
(349, 78, '_wp_trash_meta_time', '1589881704'),
(350, 79, '_wp_trash_meta_status', 'publish'),
(351, 79, '_wp_trash_meta_time', '1589881751'),
(352, 80, '_wp_trash_meta_status', 'publish'),
(353, 80, '_wp_trash_meta_time', '1589881793'),
(354, 81, '_wp_trash_meta_status', 'publish'),
(355, 81, '_wp_trash_meta_time', '1589881808'),
(356, 82, '_edit_last', '1'),
(357, 82, '_edit_lock', '1589954599:1'),
(358, 82, 'total_sales', '0'),
(359, 82, '_tax_status', 'taxable'),
(360, 82, '_tax_class', ''),
(361, 82, '_manage_stock', 'yes'),
(362, 82, '_backorders', 'no'),
(363, 82, '_sold_individually', 'yes'),
(364, 82, '_virtual', 'no'),
(365, 82, '_downloadable', 'no'),
(366, 82, '_download_limit', '-1'),
(367, 82, '_download_expiry', '-1'),
(368, 82, '_stock', '100'),
(369, 82, '_stock_status', 'instock'),
(370, 82, '_wc_average_rating', '0'),
(371, 82, '_wc_review_count', '0'),
(372, 82, '_product_version', '4.1.0'),
(373, 83, '_wp_attached_file', '2020/05/Sanimiau.png');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(374, 83, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:20:\"2020/05/Sanimiau.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"Sanimiau-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"Sanimiau-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"Sanimiau-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"Sanimiau-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"Sanimiau-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"Sanimiau-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"Sanimiau-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(375, 82, '_thumbnail_id', '83'),
(376, 82, '_sku', 'SaHoCuMa'),
(377, 82, '_regular_price', '180'),
(378, 82, '_sale_price', '150'),
(379, 82, '_low_stock_amount', '50'),
(380, 82, '_price', '150'),
(381, 86, '_edit_last', '1'),
(382, 86, '_edit_lock', '1589922159:1'),
(383, 86, 'total_sales', '0'),
(384, 86, '_tax_status', 'taxable'),
(385, 86, '_tax_class', ''),
(386, 86, '_manage_stock', 'yes'),
(387, 86, '_backorders', 'no'),
(388, 86, '_sold_individually', 'yes'),
(389, 86, '_virtual', 'no'),
(390, 86, '_downloadable', 'no'),
(391, 86, '_download_limit', '-1'),
(392, 86, '_download_expiry', '-1'),
(393, 86, '_stock', '2000'),
(394, 86, '_stock_status', 'instock'),
(395, 86, '_wc_average_rating', '0'),
(396, 86, '_wc_review_count', '0'),
(397, 86, '_product_version', '4.1.0'),
(398, 86, '_sku', 'NuPe'),
(399, 86, '_regular_price', '2398'),
(400, 86, '_low_stock_amount', '50'),
(401, 86, '_price', '2398'),
(402, 87, '_wp_attached_file', '2020/05/Peak-Performance.png'),
(403, 87, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:28:\"2020/05/Peak-Performance.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:28:\"Peak-Performance-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:28:\"Peak-Performance-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(404, 86, '_thumbnail_id', '87'),
(405, 30, '_edit_lock', '1589924176:1'),
(406, 30, '_edit_last', '1'),
(407, 30, 'custom_metabox_show_title', 'block'),
(408, 90, 'ml-slider_settings', 'a:38:{s:4:\"type\";s:4:\"flex\";s:6:\"random\";s:5:\"false\";s:8:\"cssClass\";s:0:\"\";s:8:\"printCss\";s:4:\"true\";s:7:\"printJs\";s:4:\"true\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"400\";s:3:\"spw\";s:1:\"7\";s:3:\"sph\";s:1:\"5\";s:5:\"delay\";s:4:\"3000\";s:6:\"sDelay\";s:2:\"30\";s:7:\"opacity\";s:3:\"0.7\";s:10:\"titleSpeed\";s:3:\"500\";s:6:\"effect\";s:4:\"fade\";s:10:\"navigation\";s:5:\"false\";s:5:\"links\";s:4:\"true\";s:10:\"hoverPause\";s:4:\"true\";s:5:\"theme\";s:7:\"default\";s:9:\"direction\";s:10:\"horizontal\";s:7:\"reverse\";s:5:\"false\";s:14:\"animationSpeed\";s:3:\"600\";s:8:\"prevText\";s:8:\"Previous\";s:8:\"nextText\";s:4:\"Next\";s:6:\"slices\";s:2:\"15\";s:6:\"center\";s:5:\"false\";s:9:\"smartCrop\";s:4:\"true\";s:12:\"carouselMode\";s:5:\"false\";s:14:\"carouselMargin\";s:1:\"5\";s:16:\"firstSlideFadeIn\";s:5:\"false\";s:6:\"easing\";s:6:\"linear\";s:8:\"autoPlay\";s:4:\"true\";s:11:\"thumb_width\";i:150;s:12:\"thumb_height\";i:100;s:17:\"responsive_thumbs\";s:5:\"false\";s:15:\"thumb_min_width\";i:100;s:9:\"fullWidth\";s:4:\"true\";s:10:\"noConflict\";s:4:\"true\";s:12:\"smoothHeight\";s:5:\"false\";}'),
(409, 90, 'metaslider_slideshow_theme', ''),
(410, 91, '_wp_attached_file', '2020/05/400g_esMx_ExtraLarge.jpg'),
(411, 91, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:32:\"2020/05/400g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(412, 92, '_wp_attached_file', '2020/05/401g_esMx_ExtraLarge.jpg'),
(413, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:32:\"2020/05/401g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(414, 93, '_wp_attached_file', '2020/05/402g_esMx_ExtraLarge.jpg'),
(415, 93, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:32:\"2020/05/402g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(416, 94, '_wp_attached_file', '2020/05/860g_esMx_ExtraLarge.jpg'),
(417, 94, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:32:\"2020/05/860g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(418, 95, '_wp_attached_file', '2020/05/861g_esMx_ExtraLarge.jpg'),
(419, 95, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:32:\"2020/05/861g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(420, 96, '_wp_attached_file', '2020/05/8889g_esMx_ExtraLarge.jpg'),
(421, 96, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:960;s:6:\"height\";i:330;s:4:\"file\";s:33:\"2020/05/8889g_esMx_ExtraLarge.jpg\";s:5:\"sizes\";a:17:{s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-300x103.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:103;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-768x264.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-600x206.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-700x300\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-900x300\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x207\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-577x330\";a:4:{s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(422, 97, '_wp_attached_file', '2020/05/head_sanimiau.jpg'),
(423, 97, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:698;s:6:\"height\";i:403;s:4:\"file\";s:25:\"2020/05/head_sanimiau.jpg\";s:5:\"sizes\";a:18:{s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-300x173.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:173;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:25:\"head_sanimiau-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-600x346.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:346;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-600x346.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:346;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-698x299\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-698x299.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:299;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x266\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x171\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-698x232\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-698x232.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:232;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x206\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-620x206.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x133\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-698x398\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-698x398.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:398;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-620x354\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-620x354.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"meta-slider-resized-400x228\";a:4:{s:4:\"file\";s:25:\"head_sanimiau-400x228.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:228;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(424, 98, '_thumbnail_id', '91'),
(425, 98, 'ml-slider_type', 'image'),
(426, 98, 'ml-slider_inherit_image_title', '1'),
(427, 98, 'ml-slider_inherit_image_alt', '1'),
(428, 99, '_thumbnail_id', '92'),
(429, 99, 'ml-slider_type', 'image'),
(430, 99, 'ml-slider_inherit_image_title', '1'),
(431, 99, 'ml-slider_inherit_image_alt', '1'),
(432, 100, '_thumbnail_id', '93'),
(433, 100, 'ml-slider_type', 'image'),
(434, 100, 'ml-slider_inherit_image_title', '1'),
(435, 100, 'ml-slider_inherit_image_alt', '1'),
(436, 101, '_thumbnail_id', '94'),
(437, 101, 'ml-slider_type', 'image'),
(438, 101, 'ml-slider_inherit_image_title', '1'),
(439, 101, 'ml-slider_inherit_image_alt', '1'),
(440, 102, '_thumbnail_id', '95'),
(441, 102, 'ml-slider_type', 'image'),
(442, 102, 'ml-slider_inherit_image_title', '1'),
(443, 102, 'ml-slider_inherit_image_alt', '1'),
(444, 103, '_thumbnail_id', '96'),
(445, 103, 'ml-slider_type', 'image'),
(446, 103, 'ml-slider_inherit_image_title', '1'),
(447, 103, 'ml-slider_inherit_image_alt', '1'),
(448, 104, '_thumbnail_id', '97'),
(449, 104, 'ml-slider_type', 'image'),
(450, 104, 'ml-slider_inherit_image_title', '1'),
(451, 104, 'ml-slider_inherit_image_alt', '1'),
(452, 98, 'ml-slider_crop_position', 'center-center'),
(453, 98, 'ml-slider_caption_source', 'image-caption'),
(454, 98, '_wp_attachment_image_alt', ''),
(455, 99, 'ml-slider_crop_position', 'center-center'),
(456, 99, 'ml-slider_caption_source', 'image-caption'),
(457, 99, '_wp_attachment_image_alt', ''),
(458, 100, 'ml-slider_crop_position', 'center-center'),
(459, 100, 'ml-slider_caption_source', 'image-caption'),
(460, 100, '_wp_attachment_image_alt', ''),
(461, 101, 'ml-slider_crop_position', 'center-center'),
(462, 101, 'ml-slider_caption_source', 'image-caption'),
(463, 101, '_wp_attachment_image_alt', ''),
(464, 102, 'ml-slider_crop_position', 'center-center'),
(465, 102, 'ml-slider_caption_source', 'image-caption'),
(466, 102, '_wp_attachment_image_alt', ''),
(467, 103, 'ml-slider_crop_position', 'center-center'),
(468, 103, 'ml-slider_caption_source', 'image-caption'),
(469, 103, '_wp_attachment_image_alt', ''),
(470, 104, 'ml-slider_crop_position', 'center-center'),
(471, 104, 'ml-slider_caption_source', 'image-caption'),
(472, 104, '_wp_attachment_image_alt', ''),
(473, 91, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:32:\"400g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(474, 92, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:32:\"401g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(475, 93, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:32:\"402g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(476, 94, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:32:\"860g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(477, 95, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:76:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:32:\"861g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(478, 96, '_wp_attachment_backup_sizes', 'a:7:{s:15:\"resized-700x300\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-700x300.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-700x300.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-620x266.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-400x171.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-900x300\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-900x300.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-900x300.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x207\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-620x207.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-620x207.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-400x133.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-577x330\";a:5:{s:4:\"path\";s:77:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge-577x330.jpg\";s:4:\"file\";s:33:\"8889g_esMx_ExtraLarge-577x330.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(479, 97, '_wp_attachment_backup_sizes', 'a:9:{s:15:\"resized-698x299\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-698x299.jpg\";s:4:\"file\";s:25:\"head_sanimiau-698x299.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:299;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x266\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-620x266.jpg\";s:4:\"file\";s:25:\"head_sanimiau-620x266.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:266;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x171\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-400x171.jpg\";s:4:\"file\";s:25:\"head_sanimiau-400x171.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-698x232\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-698x232.jpg\";s:4:\"file\";s:25:\"head_sanimiau-698x232.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:232;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x206\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-620x206.jpg\";s:4:\"file\";s:25:\"head_sanimiau-620x206.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:206;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x133\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-400x133.jpg\";s:4:\"file\";s:25:\"head_sanimiau-400x133.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:133;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-698x398\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-698x398.jpg\";s:4:\"file\";s:25:\"head_sanimiau-698x398.jpg\";s:5:\"width\";i:698;s:6:\"height\";i:398;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-620x354\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-620x354.jpg\";s:4:\"file\";s:25:\"head_sanimiau-620x354.jpg\";s:5:\"width\";i:620;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"resized-400x228\";a:5:{s:4:\"path\";s:69:\"C:xampphtdocsN-E/wp-content/uploads/2020/05/head_sanimiau-400x228.jpg\";s:4:\"file\";s:25:\"head_sanimiau-400x228.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:228;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(480, 106, '_wp_trash_meta_status', 'publish'),
(481, 106, '_wp_trash_meta_time', '1589947401'),
(482, 107, '_wp_trash_meta_status', 'publish'),
(483, 107, '_wp_trash_meta_time', '1589947615'),
(484, 108, '_wp_trash_meta_status', 'publish'),
(485, 108, '_wp_trash_meta_time', '1589947923'),
(486, 109, '_wp_trash_meta_status', 'publish'),
(487, 109, '_wp_trash_meta_time', '1589948046'),
(488, 110, '_edit_lock', '1589955476:1'),
(489, 113, '_sku', 'NuMu50'),
(490, 113, '_regular_price', '500'),
(491, 113, 'total_sales', '0'),
(492, 113, '_tax_status', 'taxable'),
(493, 113, '_tax_class', ''),
(494, 113, '_manage_stock', 'yes'),
(495, 113, '_backorders', 'no'),
(496, 113, '_low_stock_amount', '100'),
(497, 113, '_sold_individually', 'yes'),
(498, 113, '_virtual', 'no'),
(499, 113, '_downloadable', 'no'),
(500, 113, '_download_limit', '-1'),
(501, 113, '_download_expiry', '-1'),
(502, 113, '_thumbnail_id', '114'),
(503, 113, '_stock', '200'),
(504, 113, '_stock_status', 'instock'),
(505, 113, '_wc_average_rating', '0'),
(506, 113, '_wc_review_count', '0'),
(507, 113, '_product_version', '4.1.0'),
(508, 113, '_price', '500'),
(509, 113, '_edit_lock', '1589957069:1'),
(510, 113, '_edit_last', '1'),
(511, 114, '_wp_attached_file', '2020/05/VitalityGreen.png'),
(512, 114, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:25:\"2020/05/VitalityGreen.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:25:\"VitalityGreen-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:25:\"VitalityGreen-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(513, 115, '_sku', 'NuPe-1'),
(514, 115, '_regular_price', '2398'),
(515, 115, 'total_sales', '0'),
(516, 115, '_tax_status', 'taxable'),
(517, 115, '_tax_class', ''),
(518, 115, '_manage_stock', 'yes'),
(519, 115, '_backorders', 'no'),
(520, 115, '_low_stock_amount', '50'),
(521, 115, '_sold_individually', 'yes'),
(522, 115, '_virtual', 'no'),
(523, 115, '_downloadable', 'no'),
(524, 115, '_download_limit', '-1'),
(525, 115, '_download_expiry', '-1'),
(526, 115, '_thumbnail_id', '116'),
(527, 115, '_stock', '2000'),
(528, 115, '_stock_status', 'instock'),
(529, 115, '_wc_average_rating', '0'),
(530, 115, '_wc_review_count', '0'),
(531, 115, '_product_version', '4.1.0'),
(532, 115, '_price', '2398'),
(533, 115, '_edit_lock', '1589957922:1'),
(534, 115, '_edit_last', '1'),
(535, 116, '_wp_attached_file', '2020/05/Peak-Performance-woman.png');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(536, 116, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:34:\"2020/05/Peak-Performance-woman.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:34:\"Peak-Performance-woman-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:34:\"Peak-Performance-woman-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(537, 117, '_edit_lock', '1589962032:1'),
(538, 117, '_edit_last', '1'),
(539, 117, 'total_sales', '0'),
(540, 117, '_tax_status', 'taxable'),
(541, 117, '_tax_class', ''),
(542, 117, '_manage_stock', 'yes'),
(543, 117, '_backorders', 'no'),
(544, 117, '_sold_individually', 'yes'),
(545, 117, '_virtual', 'no'),
(546, 117, '_downloadable', 'no'),
(547, 117, '_download_limit', '-1'),
(548, 117, '_download_expiry', '-1'),
(549, 117, '_stock', '200'),
(550, 117, '_stock_status', 'instock'),
(551, 117, '_wc_average_rating', '0'),
(552, 117, '_wc_review_count', '0'),
(553, 117, '_product_version', '4.1.0'),
(554, 118, '_wp_attached_file', '2020/05/SafeyMighty.png'),
(555, 118, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:23:\"2020/05/SafeyMighty.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:23:\"SafeyMighty-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:23:\"SafeyMighty-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(556, 117, '_thumbnail_id', '118'),
(557, 117, '_sku', 'HoLaSa'),
(558, 117, '_regular_price', '200'),
(559, 117, '_sale_price', '5'),
(560, 117, '_price', '5'),
(561, 119, '_edit_lock', '1589965208:1'),
(562, 120, '_wp_attached_file', '2020/05/Rustic-Touch.png'),
(563, 120, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:24:\"2020/05/Rustic-Touch.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:24:\"Rustic-Touch-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:24:\"Rustic-Touch-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(564, 119, '_edit_last', '1'),
(565, 119, '_thumbnail_id', '120'),
(566, 119, '_sku', 'HoLaRu'),
(567, 119, '_regular_price', '300'),
(568, 119, '_sale_price', '100'),
(569, 119, 'total_sales', '0'),
(570, 119, '_tax_status', 'taxable'),
(571, 119, '_tax_class', ''),
(572, 119, '_manage_stock', 'yes'),
(573, 119, '_backorders', 'no'),
(574, 119, '_sold_individually', 'yes'),
(575, 119, '_virtual', 'no'),
(576, 119, '_downloadable', 'no'),
(577, 119, '_download_limit', '-1'),
(578, 119, '_download_expiry', '-1'),
(579, 119, '_stock', '200'),
(580, 119, '_stock_status', 'instock'),
(581, 119, '_wc_average_rating', '0'),
(582, 119, '_wc_review_count', '0'),
(583, 119, '_product_version', '4.1.0'),
(584, 119, '_price', '100'),
(585, 122, '_sku', 'HoLaTu'),
(586, 122, '_regular_price', '300'),
(587, 122, '_sale_price', '100'),
(588, 122, 'total_sales', '0'),
(589, 122, '_tax_status', 'taxable'),
(590, 122, '_tax_class', ''),
(591, 122, '_manage_stock', 'yes'),
(592, 122, '_backorders', 'no'),
(593, 122, '_sold_individually', 'yes'),
(594, 122, '_virtual', 'no'),
(595, 122, '_downloadable', 'no'),
(596, 122, '_download_limit', '-1'),
(597, 122, '_download_expiry', '-1'),
(598, 122, '_thumbnail_id', '123'),
(599, 122, '_stock', '200'),
(600, 122, '_stock_status', 'instock'),
(601, 122, '_wc_average_rating', '0'),
(602, 122, '_wc_review_count', '0'),
(603, 122, '_product_version', '4.1.0'),
(604, 122, '_price', '100'),
(605, 122, '_edit_lock', '1589967026:1'),
(606, 122, '_edit_last', '1'),
(607, 123, '_wp_attached_file', '2020/05/TubyTile.png'),
(608, 123, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:20:\"2020/05/TubyTile.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"TubyTile-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"TubyTile-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"TubyTile-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"TubyTile-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"TubyTile-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:20:\"TubyTile-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:20:\"TubyTile-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(609, 125, '_sku', 'HoLaRu-1'),
(610, 125, '_regular_price', '300'),
(611, 125, '_sale_price', '100'),
(612, 125, 'total_sales', '0'),
(613, 125, '_tax_status', 'taxable'),
(614, 125, '_tax_class', ''),
(615, 125, '_manage_stock', 'yes'),
(616, 125, '_backorders', 'no'),
(617, 125, '_sold_individually', 'yes'),
(618, 125, '_virtual', 'no'),
(619, 125, '_downloadable', 'no'),
(620, 125, '_download_limit', '-1'),
(621, 125, '_download_expiry', '-1'),
(622, 125, '_thumbnail_id', '126'),
(623, 125, '_stock', '200'),
(624, 125, '_stock_status', 'instock'),
(625, 125, '_wc_average_rating', '0'),
(626, 125, '_wc_review_count', '0'),
(627, 125, '_product_version', '4.1.0'),
(628, 125, '_price', '100'),
(629, 125, '_edit_lock', '1589967391:1'),
(630, 125, '_edit_last', '1'),
(631, 126, '_wp_attached_file', '2020/05/Revive.png'),
(632, 126, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:320;s:4:\"file\";s:18:\"2020/05/Revive.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"Revive-225x300.png\";s:5:\"width\";i:225;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Revive-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"themesgenerator-thumbnail-avatar\";a:4:{s:4:\"file\";s:18:\"Revive-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:18:\"Revive-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:18:\"Revive-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:18:\"Revive-240x300.png\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:18:\"Revive-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-05-14 19:28:05', '2020-05-14 19:28:05', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola mundo!', '', 'trash', 'open', 'open', '', 'hola-mundo__trashed', '', '', '2020-05-18 08:32:59', '2020-05-18 08:32:59', '', 0, 'http://1730505.com/N-E/?p=1', 0, 'post', '', 1),
(4, 1, '2020-05-14 19:28:46', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-05-14 19:28:46', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?p=4', 0, 'post', '', 0),
(11, 1, '2020-05-15 19:07:48', '2020-05-15 19:07:48', 'Equipo de ultima generación para Desarrolladores', 'imac-1999636', 'Solo lo compran los Pro', 'inherit', 'open', 'closed', '', 'imac-1999636', '', '', '2020-05-15 19:10:37', '2020-05-15 19:10:37', '', 0, 'http://1730505.com/N-E/wp-content/uploads/2020/05/imac-1999636.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2020-05-18 08:32:59', '2020-05-18 08:32:59', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Edítala o bórrala, ¡luego empieza a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola mundo!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-05-18 08:32:59', '2020-05-18 08:32:59', '', 1, 'http://1730505.com/N-E/index.php/2020/05/18/1-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2020-05-18 08:36:53', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-05-18 08:36:53', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?p=15', 0, 'post', '', 0),
(16, 1, '2020-05-18 08:40:28', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-05-18 08:40:28', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?p=16', 0, 'post', '', 0),
(17, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '', 'El nuevo UMoMA Abre sus Puertas', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2020-05-18 08:41:03', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/wp-content/uploads/2020/05/2020-landscape-1.png', 0, 'attachment', 'image/png', 0),
(18, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '<!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">El principal destino para el arte moderno en el Norte de Suecia. Abierto de 10 AM a 6 PM todos los días durante los meses de verano.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {\"align\":\"wide\"} --><div class=\"wp-block-columns alignwide\"><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Trabajos y Días</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Agosto -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Teatro de Operaciones</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Octubre -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>La Vida que Merezco</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Agosto -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Desde Signac a Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Octubre -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\",\"textColor\":\"accent\"} --><h2 class=\"has-accent-color has-text-align-center\">«Los cíborgs, como estableció la filósofa Donna Haraway, no son reverentes. No recuerdan el cosmos».</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {\"dropCap\":true} --><p class=\"has-drop-cap\">Con siete pisos de arquitectura impresionante, UMoMA muestra exposiciones de arte contemporáneo internacional, a veces junto con retrospectivas históricas del arte. Los problemas existenciales, políticos y filosóficos son intrínsecos a nuestro programa. Como visitante, estás invitado a visitas guiadas, charlas de artistas, conferencias, proyecciones de películas y otros eventos con entrada gratuita</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Las exposiciones son realizadas por UMoMA en colaboración con artistas y museos de todo el mundo y, a menudo, atraen la atención internacional. UMoMA ha recibido una Mención Especial del Museo Europeo del Año, y ha sido uno de los principales candidatos al Premio Sueco al Museo del Año, así como al Premio del Consejo de Europa.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {\"customBackgroundColor\":\"#ffffff\",\"align\":\"wide\"} --><div class=\"wp-block-group alignwide has-background\" style=\"background-color:#ffffff\"><div class=\"wp-block-group__inner-container\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">¡Hazte Miembro y Obtén Ofertas Exclusivas!</h2><!-- /wp:heading --><!-- wp:paragraph {\"align\":\"center\"} --><p class=\"has-text-align-center\">Los miembros obtienen acceso a exhibiciones y ventas exclusivas. Nuestra membresía cuesta $99,99 y es facturada anualmente.</p><!-- /wp:paragraph --><!-- wp:button {\"align\":\"center\"} --><div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Únete al club</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {\"ids\":[39,38],\"align\":\"wide\"} --><figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" alt=\"\" data-id=\"39\" data-full-url=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" data-link=\"assets/images/2020-square-2/\" class=\"wp-image-39\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" alt=\"\" data-id=\"38\" data-full-url=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" data-link=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1/\" class=\"wp-image-38\"/></figure></li></ul></figure><!-- /wp:gallery -->', 'El Nuevo UMoMA Abre sus Puertas', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:41:05', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=18', 0, 'page', '', 0),
(19, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Puedes ser un artista que quiere presentarse a sí mismo y a su trabajo, o un negocio con una misión que describir.</p>\n<!-- /wp:paragraph -->', 'Acerca de', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:41:05', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=19', 0, 'page', '', 0),
(20, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Esta es una página con información de contacto básica, como la dirección y el número de teléfono. Incluso puedes probar un plugin para añadir un formulario de contacto.</p>\n<!-- /wp:paragraph -->', 'Contacto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:41:05', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=20', 0, 'page', '', 0),
(21, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '', 'Blog', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:41:06', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=21', 0, 'page', '', 0),
(22, 1, '2020-05-18 08:41:07', '0000-00-00 00:00:00', '{\n    \"widget_text[2]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjIwOiJBY2VyY2EgZGUgZXN0ZSBzaXRpbyI7czo0OiJ0ZXh0IjtzOjk2OiJFc3RlIHB1ZWRlIHNlciB1biBidWVuIGx1Z2FyIHBhcmEgcHJlc2VudGFydGUgYSB0aSB5IGEgdHUgc2l0aW8gbyBwYXJhIGluY2x1aXIgYWxndW5vcyBtw6lyaXRvcy4iO3M6NjoiZmlsdGVyIjtiOjE7czo2OiJ2aXN1YWwiO2I6MTt9\",\n            \"title\": \"Acerca de este sitio\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"18f922580fbd46a39afc67def126e93f\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"widget_text[3]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjEzOiJFbmN1w6ludHJhbm9zIjtzOjQ6InRleHQiO3M6MTYyOiI8c3Ryb25nPkRpcmVjY2nDs248L3N0cm9uZz4KQ2FsbGUgUHJpbmNpcGFsIDEyMwpOZXcgWW9yaywgTlkgMTAwMDEKCjxzdHJvbmc+SG9yYXM8L3N0cm9uZz4KTHVuZXMgYSB2aWVybmVzOiBkZSA5OjAwQU0gYSA1OjAwUE0KU8OhYmFkbyB5IGRvbWluZ286IDExOjAwQU0gYSAzOjAwUE0iO3M6NjoiZmlsdGVyIjtiOjE7czo2OiJ2aXN1YWwiO2I6MTt9\",\n            \"title\": \"Encu\\u00e9ntranos\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"97df89ee10f4b3c35c8eabadc3967ba9\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-3\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menus_created_posts\": {\n        \"starter_content\": true,\n        \"value\": [\n            17,\n            18,\n            19,\n            20,\n            21\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Principal\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Inicio\",\n            \"url\": \"http://1730505.com/N-E/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -1,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-2]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 19,\n            \"position\": 1,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Acerca de\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-3]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 21,\n            \"position\": 2,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-4]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 20,\n            \"position\": 3,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Contacto\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"twentytwenty::nav_menu_locations[primary]\": {\n        \"starter_content\": true,\n        \"value\": -1,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Principal\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Inicio\",\n            \"url\": \"http://1730505.com/N-E/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -5,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-6]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 19,\n            \"position\": 1,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Acerca de\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-7]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 21,\n            \"position\": 2,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-8]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 20,\n            \"position\": 3,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Contacto\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"twentytwenty::nav_menu_locations[expanded]\": {\n        \"starter_content\": true,\n        \"value\": -5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Men\\u00fa de enlaces sociales\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Yelp\",\n            \"url\": \"https://www.yelp.com\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-10]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Facebook\",\n            \"url\": \"https://www.facebook.com/wordpress\",\n            \"position\": 1,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-11]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Twitter\",\n            \"url\": \"https://twitter.com/wordpress\",\n            \"position\": 2,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-12]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Instagram\",\n            \"url\": \"https://www.instagram.com/explore/tags/wordcamp/\",\n            \"position\": 3,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"nav_menu_item[-13]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Correo electr\\u00f3nico\",\n            \"url\": \"mailto:wordpress@example.com\",\n            \"position\": 4,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"twentytwenty::nav_menu_locations[social]\": {\n        \"starter_content\": true,\n        \"value\": -9,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"show_on_front\": {\n        \"starter_content\": true,\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"page_on_front\": {\n        \"starter_content\": true,\n        \"value\": 18,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    },\n    \"page_for_posts\": {\n        \"starter_content\": true,\n        \"value\": 21,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:41:07\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '6947b36f-f240-4949-8944-f5c6da8fa2ae', '', '', '2020-05-18 08:41:07', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?p=22', 0, 'customize_changeset', '', 0),
(23, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '', 'El nuevo UMoMA Abre sus Puertas', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2020-05-18 08:42:20', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/wp-content/uploads/2020/05/2020-landscape-1-1.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '<!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">El principal destino para el arte moderno en el Norte de Suecia. Abierto de 10 AM a 6 PM todos los días durante los meses de verano.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {\"align\":\"wide\"} --><div class=\"wp-block-columns alignwide\"><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Trabajos y Días</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Agosto -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Teatro de Operaciones</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Octubre -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>La Vida que Merezco</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Agosto -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Desde Signac a Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>1 de Octubre -- 1 de Diciembre</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Leer más</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\",\"textColor\":\"accent\"} --><h2 class=\"has-accent-color has-text-align-center\">«Los cíborgs, como estableció la filósofa Donna Haraway, no son reverentes. No recuerdan el cosmos».</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {\"dropCap\":true} --><p class=\"has-drop-cap\">Con siete pisos de arquitectura impresionante, UMoMA muestra exposiciones de arte contemporáneo internacional, a veces junto con retrospectivas históricas del arte. Los problemas existenciales, políticos y filosóficos son intrínsecos a nuestro programa. Como visitante, estás invitado a visitas guiadas, charlas de artistas, conferencias, proyecciones de películas y otros eventos con entrada gratuita</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Las exposiciones son realizadas por UMoMA en colaboración con artistas y museos de todo el mundo y, a menudo, atraen la atención internacional. UMoMA ha recibido una Mención Especial del Museo Europeo del Año, y ha sido uno de los principales candidatos al Premio Sueco al Museo del Año, así como al Premio del Consejo de Europa.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {\"customBackgroundColor\":\"#ffffff\",\"align\":\"wide\"} --><div class=\"wp-block-group alignwide has-background\" style=\"background-color:#ffffff\"><div class=\"wp-block-group__inner-container\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">¡Hazte Miembro y Obtén Ofertas Exclusivas!</h2><!-- /wp:heading --><!-- wp:paragraph {\"align\":\"center\"} --><p class=\"has-text-align-center\">Los miembros obtienen acceso a exhibiciones y ventas exclusivas. Nuestra membresía cuesta $99,99 y es facturada anualmente.</p><!-- /wp:paragraph --><!-- wp:button {\"align\":\"center\"} --><div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Únete al club</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {\"ids\":[39,38],\"align\":\"wide\"} --><figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" alt=\"\" data-id=\"39\" data-full-url=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" data-link=\"assets/images/2020-square-2/\" class=\"wp-image-39\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" alt=\"\" data-id=\"38\" data-full-url=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" data-link=\"http://1730505.com/N-E/wp-content/themes/twentytwenty/assets/images/2020-square-1/\" class=\"wp-image-38\"/></figure></li></ul></figure><!-- /wp:gallery -->', 'El Nuevo UMoMA Abre sus Puertas', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:42:22', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=24', 0, 'page', '', 0),
(25, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Puedes ser un artista que quiere presentarse a sí mismo y a su trabajo, o un negocio con una misión que describir.</p>\n<!-- /wp:paragraph -->', 'Acerca de', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:42:22', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=25', 0, 'page', '', 0),
(26, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Esta es una página con información de contacto básica, como la dirección y el número de teléfono. Incluso puedes probar un plugin para añadir un formulario de contacto.</p>\n<!-- /wp:paragraph -->', 'Contacto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:42:22', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=26', 0, 'page', '', 0),
(27, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '', 'Blog', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-18 08:42:23', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?page_id=27', 0, 'page', '', 0),
(28, 1, '2020-05-18 08:42:23', '0000-00-00 00:00:00', '{\n    \"widget_text[4]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjIwOiJBY2VyY2EgZGUgZXN0ZSBzaXRpbyI7czo0OiJ0ZXh0IjtzOjk2OiJFc3RlIHB1ZWRlIHNlciB1biBidWVuIGx1Z2FyIHBhcmEgcHJlc2VudGFydGUgYSB0aSB5IGEgdHUgc2l0aW8gbyBwYXJhIGluY2x1aXIgYWxndW5vcyBtw6lyaXRvcy4iO3M6NjoiZmlsdGVyIjtiOjE7czo2OiJ2aXN1YWwiO2I6MTt9\",\n            \"title\": \"Acerca de este sitio\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"18f922580fbd46a39afc67def126e93f\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-4\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"widget_text[5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjEzOiJFbmN1w6ludHJhbm9zIjtzOjQ6InRleHQiO3M6MTYyOiI8c3Ryb25nPkRpcmVjY2nDs248L3N0cm9uZz4KQ2FsbGUgUHJpbmNpcGFsIDEyMwpOZXcgWW9yaywgTlkgMTAwMDEKCjxzdHJvbmc+SG9yYXM8L3N0cm9uZz4KTHVuZXMgYSB2aWVybmVzOiBkZSA5OjAwQU0gYSA1OjAwUE0KU8OhYmFkbyB5IGRvbWluZ286IDExOjAwQU0gYSAzOjAwUE0iO3M6NjoiZmlsdGVyIjtiOjE7czo2OiJ2aXN1YWwiO2I6MTt9\",\n            \"title\": \"Encu\\u00e9ntranos\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"97df89ee10f4b3c35c8eabadc3967ba9\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-5\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menus_created_posts\": {\n        \"starter_content\": true,\n        \"value\": [\n            23,\n            24,\n            25,\n            26,\n            27\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Principal\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Inicio\",\n            \"url\": \"http://1730505.com/N-E/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -1,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-2]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 25,\n            \"position\": 1,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Acerca de\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-3]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 27,\n            \"position\": 2,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-4]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 26,\n            \"position\": 3,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Contacto\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"twentytwenty::nav_menu_locations[primary]\": {\n        \"starter_content\": true,\n        \"value\": -1,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Principal\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Inicio\",\n            \"url\": \"http://1730505.com/N-E/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -5,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-6]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 25,\n            \"position\": 1,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Acerca de\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-7]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 27,\n            \"position\": 2,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-8]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 26,\n            \"position\": 3,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Contacto\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"twentytwenty::nav_menu_locations[expanded]\": {\n        \"starter_content\": true,\n        \"value\": -5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Men\\u00fa de enlaces sociales\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Yelp\",\n            \"url\": \"https://www.yelp.com\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-10]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Facebook\",\n            \"url\": \"https://www.facebook.com/wordpress\",\n            \"position\": 1,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-11]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Twitter\",\n            \"url\": \"https://twitter.com/wordpress\",\n            \"position\": 2,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-12]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Instagram\",\n            \"url\": \"https://www.instagram.com/explore/tags/wordcamp/\",\n            \"position\": 3,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"nav_menu_item[-13]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Correo electr\\u00f3nico\",\n            \"url\": \"mailto:wordpress@example.com\",\n            \"position\": 4,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"twentytwenty::nav_menu_locations[social]\": {\n        \"starter_content\": true,\n        \"value\": -9,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"show_on_front\": {\n        \"starter_content\": true,\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"page_on_front\": {\n        \"starter_content\": true,\n        \"value\": 24,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    },\n    \"page_for_posts\": {\n        \"starter_content\": true,\n        \"value\": 27,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-18 08:42:23\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '4db6d440-f478-40de-91d9-76f70f034a90', '', '', '2020-05-18 08:42:23', '0000-00-00 00:00:00', '', 0, 'http://1730505.com/N-E/?p=28', 0, 'customize_changeset', '', 0),
(29, 1, '2020-05-18 09:51:38', '0000-00-00 00:00:00', '', 'Últimas Ofertas', '', 'draft', 'closed', 'open', '', '', '', '', '2020-05-18 09:51:38', '2020-05-18 09:51:38', '', 0, 'http://1730505.com/N-E/?p=29', 0, 'post', '', 0),
(30, 1, '2020-05-18 10:27:32', '2020-05-18 10:27:32', '', 'Tienda', '', 'publish', 'closed', 'closed', '', 'tienda', '', '', '2020-05-19 21:35:53', '2020-05-19 21:35:53', '', 0, 'http://1730505.com/N-E/tienda/', 0, 'page', '', 0),
(31, 1, '2020-05-18 10:27:33', '2020-05-18 10:27:33', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Carrito', '', 'publish', 'closed', 'closed', '', 'carrito', '', '', '2020-05-18 10:27:33', '2020-05-18 10:27:33', '', 0, 'http://1730505.com/N-E/carrito/', 0, 'page', '', 0),
(32, 1, '2020-05-18 10:27:33', '2020-05-18 10:27:33', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Finalizar compra', '', 'publish', 'closed', 'closed', '', 'finalizar-compra', '', '', '2020-05-18 10:27:33', '2020-05-18 10:27:33', '', 0, 'http://1730505.com/N-E/finalizar-compra/', 0, 'page', '', 0),
(33, 1, '2020-05-18 10:27:33', '2020-05-18 10:27:33', '<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->', 'Mi cuenta', '', 'publish', 'closed', 'closed', '', 'mi-cuenta', '', '', '2020-05-18 10:27:33', '2020-05-18 10:27:33', '', 0, 'http://1730505.com/N-E/mi-cuenta/', 0, 'page', '', 0),
(35, 1, '2020-05-19 05:24:42', '2020-05-19 05:24:42', '{\n    \"old_sidebars_widgets_data\": {\n        \"value\": {\n            \"wp_inactive_widgets\": [\n                \"text-2\",\n                \"text-3\"\n            ],\n            \"sidebar-1\": [\n                \"search-2\",\n                \"recent-posts-2\",\n                \"recent-comments-2\"\n            ],\n            \"sidebar-2\": [\n                \"archives-2\",\n                \"categories-2\",\n                \"meta-2\"\n            ],\n            \"sidebar-3\": [],\n            \"footer-1\": [],\n            \"footer-2\": [],\n            \"footer-3\": [],\n            \"footer-4\": []\n        },\n        \"type\": \"global_variable\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 05:24:42\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9c6153d2-80fe-45c5-895c-6086db892a21', '', '', '2020-05-19 05:24:42', '2020-05-19 05:24:42', '', 0, 'http://localhost/N-E/9c6153d2-80fe-45c5-895c-6086db892a21/', 0, 'customize_changeset', '', 0),
(36, 1, '2020-05-19 05:27:16', '2020-05-19 05:27:16', '', 'Inicio', '', 'publish', 'closed', 'closed', '', 'inicio', '', '', '2020-05-19 05:27:41', '2020-05-19 05:27:41', '', 0, 'http://localhost/N-E/?p=36', 1, 'nav_menu_item', '', 0),
(37, 1, '2020-05-19 05:25:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=37', 1, 'nav_menu_item', '', 0),
(38, 1, '2020-05-19 05:25:22', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=38', 1, 'nav_menu_item', '', 0),
(39, 1, '2020-05-19 05:25:23', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=39', 1, 'nav_menu_item', '', 0),
(40, 1, '2020-05-19 05:25:23', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=40', 1, 'nav_menu_item', '', 0),
(41, 1, '2020-05-19 05:25:31', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=41', 1, 'nav_menu_item', '', 0),
(42, 1, '2020-05-19 05:25:32', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=42', 1, 'nav_menu_item', '', 0),
(43, 1, '2020-05-19 05:25:32', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=43', 1, 'nav_menu_item', '', 0),
(44, 1, '2020-05-19 05:25:33', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:25:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=44', 1, 'nav_menu_item', '', 0),
(45, 1, '2020-05-19 05:27:16', '2020-05-19 05:27:16', ' ', '', '', 'publish', 'closed', 'closed', '', '45', '', '', '2020-05-19 05:27:41', '2020-05-19 05:27:41', '', 0, 'http://localhost/N-E/?p=45', 2, 'nav_menu_item', '', 0),
(46, 1, '2020-05-19 05:27:16', '2020-05-19 05:27:16', ' ', '', '', 'publish', 'closed', 'closed', '', '46', '', '', '2020-05-19 05:27:41', '2020-05-19 05:27:41', '', 0, 'http://localhost/N-E/?p=46', 3, 'nav_menu_item', '', 0),
(47, 1, '2020-05-19 05:27:16', '2020-05-19 05:27:16', ' ', '', '', 'publish', 'closed', 'closed', '', '47', '', '', '2020-05-19 05:27:41', '2020-05-19 05:27:41', '', 0, 'http://localhost/N-E/?p=47', 4, 'nav_menu_item', '', 0),
(48, 1, '2020-05-19 05:27:17', '2020-05-19 05:27:17', ' ', '', '', 'publish', 'closed', 'closed', '', '48', '', '', '2020-05-19 05:27:41', '2020-05-19 05:27:41', '', 0, 'http://localhost/N-E/?p=48', 5, 'nav_menu_item', '', 0),
(50, 1, '2020-05-19 05:52:20', '0000-00-00 00:00:00', '', 'Pedidos', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:20', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=50', 1, 'nav_menu_item', '', 0),
(51, 1, '2020-05-19 05:52:21', '0000-00-00 00:00:00', '', 'Descargas', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:21', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=51', 1, 'nav_menu_item', '', 0),
(52, 1, '2020-05-19 05:52:22', '0000-00-00 00:00:00', '', 'Direcciones', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:22', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=52', 1, 'nav_menu_item', '', 0),
(53, 1, '2020-05-19 05:52:23', '0000-00-00 00:00:00', '', 'Detalles de la cuenta', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=53', 1, 'nav_menu_item', '', 0),
(54, 1, '2020-05-19 05:52:24', '0000-00-00 00:00:00', '', 'Salir', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=54', 1, 'nav_menu_item', '', 0),
(55, 1, '2020-05-19 05:52:24', '0000-00-00 00:00:00', '', 'Contraseña perdida', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-05-19 05:52:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?p=55', 1, 'nav_menu_item', '', 0),
(56, 1, '2020-05-19 06:04:06', '2020-05-19 06:04:06', '{\n    \"simple_css[css]\": {\n        \"value\": \"rgb(23, 40, 41)\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:04:06\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '250e95a1-8d33-42c7-8268-adf8033d06f7', '', '', '2020-05-19 06:04:06', '2020-05-19 06:04:06', '', 0, 'http://localhost/N-E/250e95a1-8d33-42c7-8268-adf8033d06f7/', 0, 'customize_changeset', '', 0),
(57, 1, '2020-05-19 06:04:35', '2020-05-19 06:04:35', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:04:35\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c7c8b67b-b49f-4374-90c0-442db66528a6', '', '', '2020-05-19 06:04:35', '2020-05-19 06:04:35', '', 0, 'http://localhost/N-E/c7c8b67b-b49f-4374-90c0-442db66528a6/', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(58, 1, '2020-05-19 06:41:12', '0000-00-00 00:00:00', '{\n    \"widget_categories[2]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjEwOiJDYXRlZ29yaWFzIjtzOjU6ImNvdW50IjtpOjA7czoxMjoiaGllcmFyY2hpY2FsIjtpOjA7czo4OiJkcm9wZG93biI7aToxO30=\",\n            \"title\": \"Categorias\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"cf20208a18459dbae187ccb877a0f147\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:38:20\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:41:12\"\n    },\n    \"widget_woocommerce_product_search[3]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:38:20\"\n    },\n    \"widget_woocommerce_layered_nav[3]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjE6IkEiO3M6OToiYXR0cmlidXRlIjtzOjA6IiI7czoxMjoiZGlzcGxheV90eXBlIjtzOjQ6Imxpc3QiO3M6MTA6InF1ZXJ5X3R5cGUiO3M6MzoiYW5kIjt9\",\n            \"title\": \"A\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"2fe4b7141c0abda671b01e25bcbf9e3c\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:39:19\"\n    },\n    \"1589867191-tg::tgtext-1\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 06:41:12\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '9196569d-ca2f-4950-b19d-e05f7d548dfc', '', '', '2020-05-19 06:41:12', '2020-05-19 06:41:12', '', 0, 'http://localhost/N-E/?p=58', 0, 'customize_changeset', '', 0),
(59, 1, '2020-05-19 08:06:49', '2020-05-19 08:06:49', '', '', '', 'inherit', 'closed', 'closed', '', 'girl-shows-her-pumped-belly-press-athletic-body-after-diet-and-heavy-exercise-slim-waist', '', '', '2020-05-19 08:08:15', '2020-05-19 08:08:15', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/3957.jpg', 0, 'attachment', 'image/jpeg', 0),
(60, 1, '2020-05-19 08:35:06', '2020-05-19 08:35:06', '', 'Vitality Red', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2020-05-19 08:35:06', '2020-05-19 08:35:06', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=60', 0, 'product', '', 0),
(61, 1, '2020-05-19 08:33:23', '2020-05-19 08:33:23', '<h2>Presentamos Oligo</h2>\r\nOligo fue desarrollado desde lo más básico para solucionar dos defectos importantes en los suplementos de minerales: la absorción y la creación excesiva de radicales libres, a fin de garantizar que usted obtenga más beneficios cuando tome un multivitamínico mineral.', 'Vitality para mujeres', 'El suplemento de vitaminas y minerales Vitality,\r\n\r\nelaborado con la exclusiva tecnología Oligo,\r\n\r\nayuda a complementar la nutrición diaria.', 'publish', 'closed', 'closed', '', 'vitality-para-mujeres', '', '', '2020-05-19 09:15:58', '2020-05-19 09:15:58', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=61', 0, 'product', '', 0),
(62, 1, '2020-05-19 08:19:06', '2020-05-19 08:19:06', '', 'Vitality', '', 'inherit', 'closed', 'closed', '', 'vitality', '', '', '2020-05-19 08:36:40', '2020-05-19 08:36:40', '', 61, 'http://localhost/N-E/wp-content/uploads/2020/05/Vitality.png', 0, 'attachment', 'image/png', 0),
(63, 1, '2020-05-19 08:34:27', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-19 08:34:27', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=63', 0, 'product', '', 0),
(64, 1, '2020-05-19 08:35:18', '2020-05-19 08:35:18', '<h2>Presentamos Oligo</h2>\r\nOligo fue desarrollado desde lo más básico para solucionar dos defectos importantes en los suplementos de minerales: la absorción y la creación excesiva de radicales libres, a fin de garantizar que usted obtenga más beneficios cuando tome un multivitamínico mineral.', 'Vitality para hombres', 'Las vitaminas y minerales Vitality,\r\n\r\nayudan a complementar la nutrición diaria,\r\n\r\nademás de ser producidas mediante la exclusiva tecnología Oligo.', 'publish', 'closed', 'closed', '', 'vitality-para-hombres', '', '', '2020-05-19 09:15:04', '2020-05-19 09:15:04', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=64', 0, 'product', '', 0),
(65, 1, '2020-05-19 08:36:28', '2020-05-19 08:36:28', '', 'Vitality Blue', '', 'inherit', 'closed', 'closed', '', 'vitality-blue', '', '', '2020-05-19 08:36:28', '2020-05-19 08:36:28', '', 64, 'http://localhost/N-E/wp-content/uploads/2020/05/Vitality-Blue.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2020-05-19 08:50:21', '2020-05-19 08:50:21', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 08:50:21\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0e711bfb-b392-4b1d-8c3c-b1ba0f220790', '', '', '2020-05-19 08:50:21', '2020-05-19 08:50:21', '', 0, 'http://localhost/N-E/0e711bfb-b392-4b1d-8c3c-b1ba0f220790/', 0, 'customize_changeset', '', 0),
(67, 1, '2020-05-19 08:57:01', '2020-05-19 08:57:01', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n@media screen and (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\n\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 08:57:01\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c830f2a5-c269-4edb-b8d6-fc13e0bbdf5d', '', '', '2020-05-19 08:57:01', '2020-05-19 08:57:01', '', 0, 'http://localhost/N-E/?p=67', 0, 'customize_changeset', '', 0),
(68, 1, '2020-05-19 09:09:28', '2020-05-19 09:09:28', '{\n    \"1589867191-tg::menumymenu1_text_color\": {\n        \"value\": \"#898989\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:06:11\"\n    },\n    \"1589867191-tg::sliderz_namemyslider1\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:06:11\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"value\": [\n            \"search-2\",\n            \"recent-posts-2\",\n            \"recent-comments-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:07:11\"\n    },\n    \"show_on_front\": {\n        \"value\": \"posts\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:07:11\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:08:11\"\n    },\n    \"woocommerce_terms_page_id\": {\n        \"value\": \"30\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:09:11\"\n    },\n    \"wp_page_for_privacy_policy\": {\n        \"value\": \"30\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:09:28\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b9721f92-90bd-4e00-a834-bb40403b14b1', '', '', '2020-05-19 09:09:28', '2020-05-19 09:09:28', '', 0, 'http://localhost/N-E/?p=68', 0, 'customize_changeset', '', 0),
(69, 1, '2020-05-19 09:13:19', '2020-05-19 09:13:19', '{\n    \"woocommerce_shop_page_display\": {\n        \"value\": \"subcategories\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:10:11\"\n    },\n    \"woocommerce_category_archive_display\": {\n        \"value\": \"subcategories\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:12:11\"\n    },\n    \"woocommerce_default_catalog_orderby\": {\n        \"value\": \"popularity\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:13:12\"\n    },\n    \"woocommerce_catalog_rows\": {\n        \"value\": \"4\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:13:19\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '213abc36-f6f0-4c14-96b2-96945bf4da7b', '', '', '2020-05-19 09:13:19', '2020-05-19 09:13:19', '', 0, 'http://localhost/N-E/?p=69', 0, 'customize_changeset', '', 0),
(70, 1, '2020-05-19 09:16:54', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-19 09:16:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=70', 0, 'product', '', 0),
(71, 1, '2020-05-19 09:20:56', '2020-05-19 09:20:56', '', '3D wooden table against a defocussed sunny room interior', '3D render of a wooden table against a defocussed sunny room interior', 'inherit', 'closed', 'closed', '', '3d-wooden-table-against-a-defocussed-sunny-room-interior', '', '', '2020-05-19 09:20:56', '2020-05-19 09:20:56', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/10411.jpg', 0, 'attachment', 'image/jpeg', 0),
(72, 1, '2020-05-19 09:25:55', '2020-05-19 09:25:55', '', 'Sensual lips', 'Close-up of lips of young beautiful female', 'inherit', 'closed', 'closed', '', 'sensual-lips', '', '', '2020-05-19 09:25:55', '2020-05-19 09:25:55', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/O7300K0.jpg', 0, 'attachment', 'image/jpeg', 0),
(73, 1, '2020-05-19 09:28:16', '2020-05-19 09:28:16', '', 'Makeup Cosmetics Accessories Realistic Composition Poster', 'Makeup cosmetics beauty bag accessories realistic composition poster with lipstick lip gloss and eye shadows vector  illustration', 'inherit', 'closed', 'closed', '', 'makeup-cosmetics-accessories-realistic-composition-poster', '', '', '2020-05-19 09:28:16', '2020-05-19 09:28:16', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/9313.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2020-05-19 09:32:20', '2020-05-19 09:32:20', '', 'Asian woman using alcohol gel hand sanitizer wash hand before op', 'Asian woman using alcohol gel hand sanitizer wash hand before open tablet for protect coronavirus. Female push alcohol to clean for hygiene when social distancing stay at home and self quarantine time', 'inherit', 'closed', 'closed', '', 'asian-woman-using-alcohol-gel-hand-sanitizer-wash-hand-before-op', '', '', '2020-05-19 09:32:20', '2020-05-19 09:32:20', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/2494.jpg', 0, 'attachment', 'image/jpeg', 0),
(75, 1, '2020-05-19 09:35:41', '2020-05-19 09:35:41', '', 'oranges oil and Orange', 'The oranges oil from orange on green studio background', 'inherit', 'closed', 'closed', '', 'oranges-oil-and-orange', '', '', '2020-05-19 09:35:41', '2020-05-19 09:35:41', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/5266.jpg', 0, 'attachment', 'image/jpeg', 0),
(76, 1, '2020-05-19 09:41:02', '2020-05-19 09:41:02', '', 'Bank,global economy and money savings', 'Bank,global economy and money savings graphic, vector illustration design', 'inherit', 'closed', 'closed', '', 'bankglobal-economy-and-money-savings', '', '', '2020-05-19 09:41:02', '2020-05-19 09:41:02', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/63503.jpg', 0, 'attachment', 'image/jpeg', 0),
(77, 1, '2020-05-19 09:46:49', '2020-05-19 09:46:49', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:46:49\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ce33ee00-ce90-4614-8b70-79403565b8b2', '', '', '2020-05-19 09:46:49', '2020-05-19 09:46:49', '', 0, 'http://localhost/N-E/ce33ee00-ce90-4614-8b70-79403565b8b2/', 0, 'customize_changeset', '', 0),
(78, 1, '2020-05-19 09:48:24', '2020-05-19 09:48:24', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n#i5ghz {\\n    color: #35e19b;\\n}\\n.navbar-menu {\\n    background-color: #172829;\\n}\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:48:22\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5f67c6df-b4f1-4f71-aaa6-9e58b98fc837', '', '', '2020-05-19 09:48:24', '2020-05-19 09:48:24', '', 0, 'http://localhost/N-E/?p=78', 0, 'customize_changeset', '', 0),
(79, 1, '2020-05-19 09:49:11', '2020-05-19 09:49:11', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n#i5ghz {\\n    color: #35e19b;\\n}\\n.navbar-menu {\\n    background-color: #172829;\\n}\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:49:11\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '366f3070-7399-48d7-971b-c10bd5b956ff', '', '', '2020-05-19 09:49:11', '2020-05-19 09:49:11', '', 0, 'http://localhost/N-E/366f3070-7399-48d7-971b-c10bd5b956ff/', 0, 'customize_changeset', '', 0),
(80, 1, '2020-05-19 09:49:52', '2020-05-19 09:49:52', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\nz\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:49:52\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'fd52c9f0-30b8-40e9-a601-5111f8c95ff5', '', '', '2020-05-19 09:49:52', '2020-05-19 09:49:52', '', 0, 'http://localhost/N-E/fd52c9f0-30b8-40e9-a601-5111f8c95ff5/', 0, 'customize_changeset', '', 0),
(81, 1, '2020-05-19 09:50:08', '2020-05-19 09:50:08', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\na {\\n    background-color: #172829;\\n    -webkit-text-decoration-skip: objects;\\n}\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n@media screen and (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\nz\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-19 09:50:08\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ea6a2941-59f1-4930-8191-eb589752cad3', '', '', '2020-05-19 09:50:08', '2020-05-19 09:50:08', '', 0, 'http://localhost/N-E/ea6a2941-59f1-4930-8191-eb589752cad3/', 0, 'customize_changeset', '', 0),
(82, 1, '2020-05-19 20:07:01', '2020-05-19 20:07:01', 'Granulado sanitario natural y reciclable\r\nDuración de 3 a 4 semanas\r\nSuper absorbente\r\nNo contiene polvo\r\nElimina olores\r\nNose adhiere al animal\r\nNo hace barro\r\nPh neutro\r\nNo tóxico, no contiene componentes químicos', 'Sanimiau', '<div id=\"tabs-1\">\r\n\r\nPiedritas Sanitarias Livianas\r\n\r\nSu Gato necesita ocultar los olores que produce diariamente y sabe que Sanimiau se lo permite, ya que posee un atractivo natural que hace que el animal utilice el producto sin necesidad de adiestramiento.\r\n\r\n</div>', 'publish', 'closed', 'closed', '', 'sanimiau', '', '', '2020-05-19 20:07:05', '2020-05-19 20:07:05', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=82', 0, 'product', '', 0),
(83, 1, '2020-05-19 20:01:56', '2020-05-19 20:01:56', '', 'Sanimiau', '', 'inherit', 'closed', 'closed', '', 'sanimiau', '', '', '2020-05-19 20:01:56', '2020-05-19 20:01:56', '', 82, 'http://localhost/N-E/wp-content/uploads/2020/05/Sanimiau.png', 0, 'attachment', 'image/png', 0),
(84, 1, '2020-05-19 20:14:14', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-19 20:14:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=84', 0, 'product', '', 0),
(85, 1, '2020-05-19 20:15:19', '2020-05-19 20:15:19', 'Granulado sanitario natural y reciclable\nDuración de 3 a 4 semanas\nSuper absorbente\nNo contiene polvo\nElimina olores\nNose adhiere al animal\nNo hace barro\nPh neutro\nNo tóxico, no contiene componentes químicos', 'Sanimiau', '<div id=\"tabs-1\"><p>Piedritas Sanitarias Livianas</p><p>Su Gato necesita ocultar los olores que produce diariamente y sabe que Sanimiau se lo permite, ya que posee un atractivo natural que hace que el animal utilice el producto sin necesidad de adiestramiento.</p></div>', 'inherit', 'closed', 'closed', '', '82-autosave-v1', '', '', '2020-05-19 20:15:19', '2020-05-19 20:15:19', '', 82, 'http://localhost/N-E/82-autosave-v1/', 0, 'revision', '', 0),
(86, 1, '2020-05-19 21:01:56', '2020-05-19 21:01:56', '<ul class=\"benefits\">\r\n 	<li>Brinda un apoyo nutricional de alta potencia para la energía y el bienestar</li>\r\n 	<li>Protege del daño causado por los radicales libres</li>\r\n 	<li>Propicia una respuesta normal de la insulina</li>\r\n 	<li>Mejora el flujo de sangre para beneficiar el corazón</li>\r\n 	<li>Mejora la absorción de nutrientes</li>\r\n 	<li>Contribuye a la recuperación de los músculos y las articulaciones después del ejercicio</li>\r\n 	<li>Aumenta la capacidad de recuperación después del ejercicio</li>\r\n</ul>', 'Peak performance para hombre', 'Nutrición que mejora la salud del corazón,\r\n\r\ndel metabolismo y de las células para que usted aproveche al máximo el esfuerzo que hace cada día.', 'publish', 'open', 'closed', '', 'peak-performance-para-hombre', '', '', '2020-05-19 21:02:17', '2020-05-19 21:02:17', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=86', 0, 'product', '', 0),
(87, 1, '2020-05-19 20:58:29', '2020-05-19 20:58:29', '', 'Peak Performance', '', 'inherit', 'closed', 'closed', '', 'peak-performance', '', '', '2020-05-19 20:58:29', '2020-05-19 20:58:29', '', 86, 'http://localhost/N-E/wp-content/uploads/2020/05/Peak-Performance.png', 0, 'attachment', 'image/png', 0),
(88, 1, '2020-05-19 21:13:10', '2020-05-19 21:13:10', '<ul class=\"benefits\">\n 	<li>Brinda un apoyo nutricional de alta potencia para la energía y el bienestar</li>\n 	<li>Protege del daño causado por los radicales libres</li>\n 	<li>Propicia una respuesta normal de la insulina</li>\n 	<li>Mejora el flujo de sangre para beneficiar el corazón</li>\n 	<li>Mejora la absorción de nutrientes</li>\n 	<li>Contribuye a la recuperación de los músculos y las articulaciones después del ejercicio</li>\n 	<li>Aumenta la capacidad de recuperación después del ejercicio</li>\n</ul>', 'Peak performance para hombre', '<p>Nutrición que mejora la salud del corazón,</p><p>del metabolismo y de las células para que usted aproveche al máximo el esfuerzo que hace cada día.</p>', 'inherit', 'closed', 'closed', '', '86-autosave-v1', '', '', '2020-05-19 21:13:10', '2020-05-19 21:13:10', '', 86, 'http://localhost/N-E/86-autosave-v1/', 0, 'revision', '', 0),
(89, 1, '2020-05-19 21:35:40', '2020-05-19 21:35:40', '', 'Tienda', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-05-19 21:35:40', '2020-05-19 21:35:40', '', 30, 'http://localhost/N-E/30-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2020-05-20 03:28:32', '2020-05-20 03:28:32', '', 'NewPresentacion', '', 'publish', 'closed', 'closed', '', 'new-slideshow', '', '', '2020-05-20 03:35:26', '2020-05-20 03:35:26', '', 0, 'http://localhost/N-E/?post_type=ml-slider&#038;p=90', 0, 'ml-slider', '', 0),
(91, 1, '2020-05-20 03:30:23', '2020-05-20 03:30:23', '', '400g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '400g_esmx_extralarge', '', '', '2020-05-20 03:30:23', '2020-05-20 03:30:23', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/400g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2020-05-20 03:30:26', '2020-05-20 03:30:26', '', '401g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '401g_esmx_extralarge', '', '', '2020-05-20 03:30:26', '2020-05-20 03:30:26', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/401g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(93, 1, '2020-05-20 03:30:29', '2020-05-20 03:30:29', '', '402g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '402g_esmx_extralarge', '', '', '2020-05-20 03:30:29', '2020-05-20 03:30:29', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/402g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2020-05-20 03:30:32', '2020-05-20 03:30:32', '', '860g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '860g_esmx_extralarge', '', '', '2020-05-20 03:30:32', '2020-05-20 03:30:32', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/860g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(95, 1, '2020-05-20 03:30:34', '2020-05-20 03:30:34', '', '861g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '861g_esmx_extralarge', '', '', '2020-05-20 03:30:34', '2020-05-20 03:30:34', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/861g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(96, 1, '2020-05-20 03:30:37', '2020-05-20 03:30:37', '', '8889g_esMx_ExtraLarge', '', 'inherit', 'closed', 'closed', '', '8889g_esmx_extralarge', '', '', '2020-05-20 03:30:37', '2020-05-20 03:30:37', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/8889g_esMx_ExtraLarge.jpg', 0, 'attachment', 'image/jpeg', 0),
(97, 1, '2020-05-20 03:30:39', '2020-05-20 03:30:39', '', 'head_sanimiau', '', 'inherit', 'closed', 'closed', '', 'head_sanimiau', '', '', '2020-05-20 03:30:39', '2020-05-20 03:30:39', '', 0, 'http://localhost/N-E/wp-content/uploads/2020/05/head_sanimiau.jpg', 0, 'attachment', 'image/jpeg', 0),
(98, 1, '2020-05-20 03:30:48', '2020-05-20 03:30:48', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image', '', '', '2020-05-20 03:35:31', '2020-05-20 03:35:31', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=98', 0, 'ml-slide', '', 0),
(99, 1, '2020-05-20 03:30:50', '2020-05-20 03:30:50', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-2', '', '', '2020-05-20 03:35:31', '2020-05-20 03:35:31', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=99', 1, 'ml-slide', '', 0),
(100, 1, '2020-05-20 03:30:51', '2020-05-20 03:30:51', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-3', '', '', '2020-05-20 03:35:31', '2020-05-20 03:35:31', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=100', 2, 'ml-slide', '', 0),
(101, 1, '2020-05-20 03:30:51', '2020-05-20 03:30:51', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-4', '', '', '2020-05-20 03:35:32', '2020-05-20 03:35:32', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=101', 3, 'ml-slide', '', 0),
(102, 1, '2020-05-20 03:30:52', '2020-05-20 03:30:52', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-5', '', '', '2020-05-20 03:35:32', '2020-05-20 03:35:32', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=102', 4, 'ml-slide', '', 0),
(103, 1, '2020-05-20 03:30:53', '2020-05-20 03:30:53', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-6', '', '', '2020-05-20 03:35:32', '2020-05-20 03:35:32', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=103', 5, 'ml-slide', '', 0),
(104, 1, '2020-05-20 03:30:54', '2020-05-20 03:30:54', '', 'Slider 90 - image', '', 'publish', 'closed', 'closed', '', 'slider-90-image-7', '', '', '2020-05-20 03:35:33', '2020-05-20 03:35:33', '', 0, 'http://localhost/N-E/?post_type=ml-slide&#038;p=104', 6, 'ml-slide', '', 0),
(105, 1, '2020-05-20 03:43:03', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-20 03:43:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=105', 0, 'product', '', 0),
(106, 1, '2020-05-20 04:03:20', '2020-05-20 04:03:20', '{\n    \"1589867191-tg::sliderz_namemyslider1\": {\n        \"value\": \"meta:90\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-20 04:03:20\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '2782bc2c-8b34-4534-934a-cde2c52a0ae5', '', '', '2020-05-20 04:03:20', '2020-05-20 04:03:20', '', 0, 'http://localhost/N-E/2782bc2c-8b34-4534-934a-cde2c52a0ae5/', 0, 'customize_changeset', '', 0),
(107, 1, '2020-05-20 04:06:55', '2020-05-20 04:06:55', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n@media screen and (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\nz\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-20 04:06:55\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ee21b1cf-ce9d-464f-98e9-af59d391e755', '', '', '2020-05-20 04:06:55', '2020-05-20 04:06:55', '', 0, 'http://localhost/N-E/ee21b1cf-ce9d-464f-98e9-af59d391e755/', 0, 'customize_changeset', '', 0),
(108, 1, '2020-05-20 04:12:03', '2020-05-20 04:12:03', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n@media screen and (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\nz\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-20 04:12:03\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '62a2387e-921b-40f8-b4e3-837edd8e81ac', '', '', '2020-05-20 04:12:03', '2020-05-20 04:12:03', '', 0, 'http://localhost/N-E/62a2387e-921b-40f8-b4e3-837edd8e81ac/', 0, 'customize_changeset', '', 0),
(109, 1, '2020-05-20 04:14:05', '2020-05-20 04:14:05', '{\n    \"simple_css[css]\": {\n        \"value\": \"\\nbody {\\n    background: rgb(23, 40, 41);\\n}\\n\\n\\nelement.style {\\n    overflow: visible;\\n}\\n\\n@media (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n}\\n.navbar-menu {\\n    background-color: #172829;\\n}\\n.navbar-menu {\\n    padding-top: 10px;\\n    padding-right: 0px;\\n    padding-bottom: 10px;\\n    padding-left: 0px;\\n    display: block;\\n    float: right;\\n    margin-top: 0px;\\n    margin-right: 0px;\\n    margin-bottom: 0px;\\n    margin-left: 0px;\\n}\\n\\n@media screen and (max-width: 993px)\\n.navbar-menu {\\n    width: 100%;\\n    background-color: #172829;\\n    position: absolute;\\n    z-index: 999999;\\n}\\n\\n#i5ghz {\\n    width: 80%;\\n    float: left;\\n    min-height: 75px;\\n    height: auto;\\n    text-align: center;\\n    color: #35e19b;\\n}\\nz\\na, .entry-meta a, .comment-metadata a {\\n    color: #53d8b1;\\n}\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-05-20 04:14:05\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0eb35f3a-7375-48e4-83db-468b45e5874b', '', '', '2020-05-20 04:14:05', '2020-05-20 04:14:05', '', 0, 'http://localhost/N-E/0eb35f3a-7375-48e4-83db-468b45e5874b/', 0, 'customize_changeset', '', 0),
(110, 1, '2020-05-20 06:03:30', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-20 06:03:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=110', 0, 'product', '', 0),
(111, 1, '2020-05-20 06:28:00', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-20 06:28:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=111', 0, 'product', '', 0),
(112, 1, '2020-05-20 06:31:11', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-20 06:31:11', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=112', 0, 'product', '', 0),
(113, 1, '2020-05-20 06:39:21', '2020-05-20 06:39:21', '<h2>Presentamos Oligo</h2>\r\nEsta fórmula ha sido creada específicamente para suplir las necesidades nutricionales cambiantes de las personas mayores de 50 años; no contiene hierro y posee altos niveles de vitamina D y vitaminas antioxidantes como las vitaminas E y A para una óptima salud inmunitaria. Debido a que la capacidad del cuerpo para utilizar algunos minerales disminuye con la edad, también incluye altos niveles de cromo, magnesio y calcio.', 'Vitality para mayores de 50', 'Las vitaminas y minerales Vitality,\r\n\r\nayudan a complementar la nutrición diaria,\r\n\r\nademás de ser producidas mediante la exclusiva tecnología <i>Oligo</i>.', 'publish', 'closed', 'closed', '', 'vitality-para-mayores-de-50', '', '', '2020-05-20 06:45:53', '2020-05-20 06:45:53', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=113', 0, 'product', '', 0),
(114, 1, '2020-05-20 06:41:08', '2020-05-20 06:41:08', '', 'VitalityGreen', '', 'inherit', 'closed', 'closed', '', 'vitalitygreen', '', '', '2020-05-20 06:41:08', '2020-05-20 06:41:08', '', 113, 'http://localhost/N-E/wp-content/uploads/2020/05/VitalityGreen.png', 0, 'attachment', 'image/png', 0),
(115, 1, '2020-05-20 06:47:06', '2020-05-20 06:47:06', '<ul class=\"benefits\">\r\n 	<li>Brinda un apoyo nutricional de alta potencia para la energía y el bienestar</li>\r\n 	<li>Protege del daño causado por los radicales libres</li>\r\n 	<li>Propicia una respuesta normal de la insulina</li>\r\n 	<li>Mejora el flujo de sangre para beneficiar el corazón</li>\r\n 	<li>Mejora la absorción de nutrientes</li>\r\n 	<li>Contribuye a la recuperación de los músculos y las articulaciones después del ejercicio</li>\r\n 	<li>Aumenta la capacidad de recuperación después del ejercicio</li>\r\n</ul>', 'Peak performance para mujer', 'Nutrición que mejora la salud del corazón,\r\n\r\ndel metabolismo y de las células para que usted aproveche al máximo el esfuerzo que hace cada día.', 'publish', 'open', 'closed', '', 'peak-performance-para-mujer', '', '', '2020-05-20 06:51:23', '2020-05-20 06:51:23', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=115', 0, 'product', '', 0),
(116, 1, '2020-05-20 06:50:50', '2020-05-20 06:50:50', '', 'Peak Performance woman', '', 'inherit', 'closed', 'closed', '', 'peak-performance-woman', '', '', '2020-05-20 06:50:50', '2020-05-20 06:50:50', '', 115, 'http://localhost/N-E/wp-content/uploads/2020/05/Peak-Performance-woman.png', 0, 'attachment', 'image/png', 0),
(117, 1, '2020-05-20 07:07:09', '2020-05-20 07:07:09', 'Ahora, existe una forma eficaz y ecológica de mantener la taza del inodoro limpia y oliendo bien. El nuevo Safe &amp; Mighty ofrece un poder limpiador inigualable con su fórmula natural que mantiene el inodoro oliendo tan limpio como se ve. ¿Quién dice que no se puede tener todo?\r\n\r\nSafe &amp; Mighty no contiene cloro ni sustancias químicas fuertes y no requiere una tapa a prueba de niños.', 'Safe & Mighty', 'Este limpiador de la taza del inodoro es eficaz pero seguro,\r\n\r\nporque está potenciado por ácidos orgánicos en lugar de sustancias químicas como el cloro.\r\n\r\nDeja la taza del inodoro limpia y con una fragancia agradable.\r\n\r\nEl envase con cuello sesgado lanza un chorro de limpiador concentrado que se adhiere fácilmente donde más se necesita.', 'publish', 'open', 'closed', '', 'safe-mighty', '', '', '2020-05-20 07:09:11', '2020-05-20 07:09:11', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=117', 0, 'product', '', 0),
(118, 1, '2020-05-20 07:06:47', '2020-05-20 07:06:47', '', 'SafeyMighty', '', 'inherit', 'closed', 'closed', '', 'safeymighty', '', '', '2020-05-20 07:06:47', '2020-05-20 07:06:47', '', 117, 'http://localhost/N-E/wp-content/uploads/2020/05/SafeyMighty.png', 0, 'attachment', 'image/png', 0),
(119, 1, '2020-05-20 09:00:06', '2020-05-20 09:00:06', 'El limpiador de muebles <i>Rustic Touch</i> enriquece sus muebles, dándoles brillo, protección y acondicionamiento con acondicionadores naturales y el poder protector de la cera de carnauba.', 'Rustic Touch', 'Rustic Touch contiene cera de carnauba y acondicionadores de origen natural que protegen y acondicionan la madera,\r\nel vinilo y el cuero para preservarlo y dejarlo reluciente. (Rociador se vende por separado)', 'publish', 'open', 'closed', '', 'rustic-touch', '', '', '2020-05-20 09:00:08', '2020-05-20 09:00:08', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=119', 0, 'product', '', 0),
(120, 1, '2020-05-20 08:56:47', '2020-05-20 08:56:47', '', 'Rustic Touch', '', 'inherit', 'closed', 'closed', '', 'rustic-touch', '', '', '2020-05-20 08:56:47', '2020-05-20 08:56:47', '', 119, 'http://localhost/N-E/wp-content/uploads/2020/05/Rustic-Touch.png', 0, 'attachment', 'image/png', 0),
(121, 1, '2020-05-20 09:00:08', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-20 09:00:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/N-E/?post_type=product&p=121', 0, 'product', '', 0),
(122, 1, '2020-05-20 09:00:40', '2020-05-20 09:00:40', 'Este limpiador de baño, 12 veces concentrado, elimina los residuos de jabón y las manchas de agua dura gracias al poder del ácido cítrico proveniente de los limones y del ácido glicólico derivado de las plantas. Además, no emana vapores nocivos ni contiene abrasivos y no hace falta fregar mucho. No se incluye la botella rociadora.', 'Tub & Tile', 'Con su espuma duradera y su fresca fragancia cítrica, Tub &amp; Tile elimina fácilmente los restos de jabón y las resistentes manchas de agua dura. Cada botella de concentrado tiene el poder limpiador de 20 limones (ácido cítrico) y rinde seis botellas de limpiador listo para usar. Usted ahorrará tiempo, esfuerzo y dinero, y los baños de su casa quedarán relucientes.\r\n<ul>\r\n 	<li>Limpia tinas, regaderas, lavabos, inodoros y otras superficies del baño.**</li>\r\n 	<li>No contiene cloro ni emana vapores nocivos.</li>\r\n 	<li>Rocíelo, déjelo actuar por unos minutos y luego restriegue y enjuague.</li>\r\n</ul>', 'publish', 'open', 'closed', '', 'rustic-touch-copia', '', '', '2020-05-20 09:05:49', '2020-05-20 09:05:49', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=122', 0, 'product', '', 0),
(123, 1, '2020-05-20 09:04:31', '2020-05-20 09:04:31', '', 'TubyTile', '', 'inherit', 'closed', 'closed', '', 'tubytile', '', '', '2020-05-20 09:04:31', '2020-05-20 09:04:31', '', 122, 'http://localhost/N-E/wp-content/uploads/2020/05/TubyTile.png', 0, 'attachment', 'image/png', 0),
(124, 1, '2020-05-20 09:32:34', '2020-05-20 09:32:34', 'El repuesto del ambientador <i>Revive</i> se debe utilizar con su respectivo rociador. El rociador no está incluido, no se olvide de comprarlo.', 'Revive', 'Con su espuma duradera y su fresca fragancia cítrica, Tub &amp; Tile elimina fácilmente los restos de jabón y las resistentes manchas de agua dura. Cada botella de concentrado tiene el poder limpiador de 20 limones (ácido cítrico) y rinde seis botellas de limpiador listo para usar. Usted ahorrará tiempo, esfuerzo y dinero, y los baños de su casa quedarán relucientes.\n<ul>\n 	<li>Limpia tinas, regaderas, lavabos, inodoros y otras superficies del baño.**</li>\n 	<li>No contiene cloro ni emana vapores nocivos.</li>\n 	<li>Rocíelo, déjelo actuar por unos minutos y luego restriegue y enjuague.</li>\n</ul>', 'inherit', 'closed', 'closed', '', '122-autosave-v1', '', '', '2020-05-20 09:32:34', '2020-05-20 09:32:34', '', 122, 'http://localhost/N-E/122-autosave-v1/', 0, 'revision', '', 0),
(125, 1, '2020-05-20 09:33:01', '2020-05-20 09:33:01', 'El limpiador de muebles Rustic Touch enriquece sus muebles, dándoles brillo, protección y acondicionamiento con acondicionadores naturales y el poder protector de la cera de carnauba.', 'Revive', 'El repuesto del ambientador <i>Revive</i> se debe utilizar con su respectivo rociador. El rociador no está incluido, no se olvide de comprarlo.', 'publish', 'open', 'closed', '', 'revive', '', '', '2020-05-20 09:37:06', '2020-05-20 09:37:06', '', 0, 'http://localhost/N-E/?post_type=product&#038;p=125', 0, 'product', '', 0),
(126, 1, '2020-05-20 09:36:53', '2020-05-20 09:36:53', '', 'Revive', '', 'inherit', 'closed', 'closed', '', 'revive', '', '', '2020-05-20 09:36:53', '2020-05-20 09:36:53', '', 125, 'http://localhost/N-E/wp-content/uploads/2020/05/Revive.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 15, 'product_count_product_cat', '5'),
(2, 15, 'display_type', 'products'),
(3, 15, 'thumbnail_id', '59'),
(4, 17, 'order', '0'),
(5, 17, 'display_type', 'subcategories'),
(6, 17, 'thumbnail_id', '0'),
(7, 18, 'order', '0'),
(8, 18, 'display_type', 'subcategories'),
(9, 18, 'thumbnail_id', '0'),
(10, 19, 'order', '0'),
(11, 19, 'display_type', 'subcategories'),
(12, 19, 'thumbnail_id', '0'),
(13, 19, 'product_count_product_cat', '2'),
(14, 17, 'product_count_product_cat', '3'),
(15, 18, 'product_count_product_cat', '2'),
(16, 20, 'order', '0'),
(17, 20, 'display_type', 'products'),
(18, 20, 'thumbnail_id', '71'),
(19, 21, 'order', '0'),
(20, 21, 'display_type', 'products'),
(21, 21, 'thumbnail_id', '72'),
(22, 22, 'order', '0'),
(23, 22, 'display_type', 'products'),
(24, 22, 'thumbnail_id', '73'),
(25, 23, 'order', '0'),
(26, 23, 'display_type', 'products'),
(27, 23, 'thumbnail_id', '74'),
(28, 24, 'order', '0'),
(29, 24, 'display_type', 'products'),
(30, 24, 'thumbnail_id', '75'),
(31, 25, 'order', '0'),
(32, 25, 'display_type', 'products'),
(33, 25, 'thumbnail_id', '76'),
(34, 26, 'order', '0'),
(35, 26, 'display_type', 'subcategories'),
(36, 26, 'thumbnail_id', '0'),
(37, 20, 'product_count_product_cat', '5'),
(38, 26, 'product_count_product_cat', '1'),
(39, 27, 'order', '0'),
(40, 27, 'display_type', 'subcategories'),
(41, 27, 'thumbnail_id', '0'),
(42, 27, 'product_count_product_cat', '2'),
(43, 29, 'order', '0'),
(44, 29, 'display_type', 'subcategories'),
(45, 29, 'thumbnail_id', '0'),
(46, 30, 'order', '0'),
(47, 30, 'display_type', 'subcategories'),
(48, 30, 'thumbnail_id', '0'),
(49, 30, 'product_count_product_cat', '3'),
(50, 31, 'order', '0'),
(51, 31, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Nutrición', 'nutricion', 0),
(16, 'MenuBar', 'menubar', 0),
(17, 'Multivitaminas', 'multivitaminas', 0),
(18, 'Hombres', 'hombres', 0),
(19, 'Mujeres', 'mujeres', 0),
(20, 'Hogar', 'hogar', 0),
(21, 'Cuidado Personal', 'cuidado-personal', 0),
(22, 'Belleza', 'belleza', 0),
(23, 'Botiquin', 'botiquin', 0),
(24, 'Aceites esenciales', 'aceites-esenciales', 0),
(25, 'Ahorros Adicionales', 'ahorros-adicionales', 0),
(26, 'Cuidado de mascotas', 'cuidado-de-mascotas', 0),
(27, 'Peak performance', 'peak-performance', 0),
(28, '90', '90', 0),
(29, 'Accesorios', 'accesorios', 0),
(30, 'Lavanderia', 'lavanderia', 0),
(31, 'Limpiador Domestico', 'limpiador-domestico', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(29, 1, 0),
(36, 16, 0),
(45, 16, 0),
(46, 16, 0),
(47, 16, 0),
(48, 16, 0),
(61, 2, 0),
(61, 17, 0),
(61, 19, 0),
(64, 2, 0),
(64, 17, 0),
(64, 18, 0),
(82, 2, 0),
(82, 20, 0),
(82, 26, 0),
(86, 2, 0),
(86, 15, 0),
(86, 27, 0),
(98, 28, 0),
(99, 28, 0),
(100, 28, 0),
(101, 28, 0),
(102, 28, 0),
(103, 28, 0),
(104, 28, 0),
(113, 2, 0),
(113, 17, 0),
(113, 18, 0),
(113, 19, 0),
(115, 2, 0),
(115, 15, 0),
(115, 27, 0),
(117, 2, 0),
(117, 20, 0),
(117, 30, 0),
(119, 2, 0),
(119, 20, 0),
(119, 30, 0),
(122, 2, 0),
(122, 20, 0),
(122, 30, 0),
(125, 2, 0),
(125, 20, 0),
(125, 31, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'product_type', '', 0, 10),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 2),
(16, 16, 'nav_menu', '', 0, 5),
(17, 17, 'product_cat', '', 15, 3),
(18, 18, 'product_cat', '', 17, 2),
(19, 19, 'product_cat', '', 17, 2),
(20, 20, 'product_cat', '', 0, 5),
(21, 21, 'product_cat', '', 0, 0),
(22, 22, 'product_cat', '', 0, 0),
(23, 23, 'product_cat', '', 0, 0),
(24, 24, 'product_cat', '', 0, 0),
(25, 25, 'product_cat', '', 0, 0),
(26, 26, 'product_cat', '', 20, 1),
(27, 27, 'product_cat', '', 15, 2),
(28, 28, 'ml-slider', '', 0, 7),
(29, 29, 'product_cat', '', 24, 0),
(30, 30, 'product_cat', '', 20, 3),
(31, 31, 'product_cat', '', 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Luis'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"7ebac514f1b9bca6e6242d8afb9582a17b66307ba5993109ddb614ff01abe589\";a:4:{s:10:\"expiration\";i:1590037908;s:2:\"ip\";s:12:\"192.168.1.70\";s:2:\"ua\";s:131:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 Edg/81.0.416.77\";s:5:\"login\";i:1589865108;}s:64:\"91186a907a74a0120e81cbd3b587b08ebf38c746f836dbc50ea1a94b1c9f16a6\";a:4:{s:10:\"expiration\";i:1590127306;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:131:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 Edg/81.0.416.77\";s:5:\"login\";i:1589954506;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}'),
(19, 1, '_woocommerce_tracks_anon_id', 'woo:RHa3o/7O2Dh+bpiFhNBpNL1w'),
(20, 1, 'wc_last_active', '1589932800'),
(21, 1, 'last_update', '1589875916'),
(22, 1, 'woocommerce_admin_activity_panel_inbox_last_read', '1589875874007'),
(23, 1, 'wp_user-settings', 'libraryContent=browse&align=center&imgsize=large&editor=tinymce'),
(24, 1, 'wp_user-settings-time', '1589967423'),
(25, 1, '_order_count', '0'),
(30, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(31, 1, 'metaboxhidden_nav-menus', 'a:5:{i:0;s:21:\"add-post-type-product\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";i:3;s:15:\"add-product_cat\";i:4;s:15:\"add-product_tag\";}'),
(32, 1, 'nav_menu_recently_edited', '16'),
(33, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:0:{}}'),
(34, 1, 'closedpostboxes_product', 'a:1:{i:0;s:19:\"tagsdiv-product_tag\";}'),
(35, 1, 'metaboxhidden_product', 'a:2:{i:0;s:10:\"postcustom\";i:1;s:7:\"slugdiv\";}'),
(36, 1, 'wp_metaslider_user_saw_callout_toolbar', '1'),
(37, 1, 'dismissed_no_secure_connection_notice', '1'),
(38, 1, 'closedpostboxes_page', 'a:1:{i:0;s:18:\"simple_css_metabox\";}'),
(39, 1, 'metaboxhidden_page', 'a:0:{}'),
(40, 1, 'meta-box-order_page', 'a:3:{s:6:\"normal\";s:57:\"simple_css_metabox,themesgenerator_metabox-custom-metabox\";s:4:\"side\";s:0:\"\";s:8:\"advanced\";s:0:\"\";}'),
(43, 2, 'nickname', 'Cliente'),
(44, 2, 'first_name', 'Cliente'),
(45, 2, 'last_name', 'Cliente'),
(46, 2, 'description', ''),
(47, 2, 'rich_editing', 'true'),
(48, 2, 'syntax_highlighting', 'true'),
(49, 2, 'comment_shortcuts', 'false'),
(50, 2, 'admin_color', 'fresh'),
(51, 2, 'use_ssl', '0'),
(52, 2, 'show_admin_bar_front', 'true'),
(53, 2, 'locale', ''),
(54, 2, 'wp_capabilities', 'a:1:{s:8:\"customer\";b:1;}'),
(55, 2, 'wp_user_level', '0'),
(56, 2, 'dismissed_wp_pointers', ''),
(57, 2, 'last_update', '1589948304'),
(59, 2, 'wc_last_active', '1589932800'),
(61, 2, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:1:{s:32:\"93db85ed909c13838ff95ccfa94cebd9\";a:6:{s:3:\"key\";s:32:\"93db85ed909c13838ff95ccfa94cebd9\";s:10:\"product_id\";i:86;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";}}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'Luis', '$P$BwqcJ8NoaQpdfJeBrKM.xqAlXbfPUj/', 'luis', '1730505@upv.edu.mx', 'http://1730505.com/N-E', '2020-05-14 19:28:03', '', 0, 'Luis'),
(2, 'Cliente', '$P$B8t/pznHDtF4jM4JCzwgRBva0sngRk.', 'cliente', 'correousertb@gmail.com', 'http://Cliente.com', '2020-05-20 04:18:20', '1589948304:$P$BV0085ca0.QrUWDtcT9IJmmAtWhBKR/', 0, 'Cliente Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_admin_notes`
--

CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_wc_admin_notes`
--

INSERT INTO `wp_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `icon`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`) VALUES
(1, 'wc-admin-welcome-note', 'info', 'en_US', 'New feature(s)', 'Welcome to the new WooCommerce experience! In this new release you\'ll be able to have a glimpse of how your store is doing in the Dashboard, manage important aspects of your business (such as managing orders, stock, reviews) from anywhere in the interface, dive into your store data with a completely new Analytics section and more!', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-15 18:37:18', NULL, 0),
(2, 'wc-admin-store-notice-setting-moved', 'info', 'en_US', 'Looking for the Store Notice setting?', 'It can now be found in the Customizer.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-15 18:37:19', NULL, 0),
(3, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-15 18:37:24', NULL, 0),
(4, 'wc-admin-onboarding-profiler-reminder', 'update', 'en_US', 'Welcome to WooCommerce! Set up your store and start selling', 'We\'re here to help you going through the most important steps to get your store up and running.', 'info', '{}', 'actioned', 'woocommerce-admin', '2020-05-15 18:37:50', NULL, 0),
(5, 'wc-admin-mobile-app', 'info', 'en_US', 'Instala la aplicación móvil WooCommerce', 'Instala la aplicación móvil de WooCommerce para gestionar pedidos, recibir avisos de ventas y ver métricas clave – allí donde estés.', 'phone', '{}', 'unactioned', 'woocommerce-admin', '2020-05-18 05:09:54', NULL, 0),
(6, 'wc-admin-onboarding-email-marketing', 'info', 'en_US', 'Trucos, actualizaciones de productos e inspiración', 'Estamos aquí por ti - consigue trucos, actualizaciones de productos e inspiración en tu buzón.', 'mail', '{}', 'unactioned', 'woocommerce-admin', '2020-05-18 05:09:56', NULL, 0),
(7, 'wc-admin-store-notice-giving-feedback', 'info', 'en_US', 'Valora tu experiencia', '´Si te gusta WooCommerce Admin, por favor, déjanos una valoración de 5 estrellas. ¡Muchas gracias por adelantado!', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-19 05:11:45', NULL, 0),
(8, 'wc-admin-facebook-extension', 'info', 'en_US', 'Vende en Facebook', 'Haz crecer tu negocio dirigiéndote a las personas adecuadas e impulsando las ventas con Facebook. Puedes instalar ahora esta extensión gratuita.', 'thumbs-up', '{}', 'unactioned', 'woocommerce-admin', '2020-05-19 05:11:46', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_admin_note_actions`
--

CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_wc_admin_note_actions`
--

INSERT INTO `wp_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`) VALUES
(1, 1, 'learn-more', 'Learn more', 'https://woocommerce.wordpress.com/', 'actioned', 0),
(2, 2, 'open-customizer', 'Open Customizer', 'customize.php', 'actioned', 0),
(3, 3, 'connect', 'Connect', '?page=wc-addons&section=helper', 'unactioned', 0),
(4, 4, 'continue-profiler', 'Continue Store Setup', 'http://1730505.com/N-E/wp-admin/admin.php?page=wc-admin&enable_onboarding=1', 'unactioned', 1),
(5, 4, 'skip-profiler', 'Skip Setup', 'http://1730505.com/N-E/wp-admin/admin.php?page=wc-admin&reset_profiler=0', 'actioned', 0),
(6, 5, 'learn-more', 'Aprende más', 'https://woocommerce.com/mobile/', 'actioned', 0),
(7, 6, 'yes-please', '¡Sí, por favor!', 'https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin', 'actioned', 0),
(8, 7, 'share-feedback', 'Valoración', 'https://wordpress.org/support/plugin/woocommerce-admin/reviews/?rate=5#new-post', 'actioned', 0),
(9, 8, 'learn-more', 'Aprende más', 'https://woocommerce.com/products/facebook/', 'unactioned', 0),
(10, 8, 'install-now', 'Instalar ahora', '', 'unactioned', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_category_lookup`
--

CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_wc_category_lookup`
--

INSERT INTO `wp_wc_category_lookup` (`category_tree_id`, `category_id`) VALUES
(15, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_customer_lookup`
--

CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_download_log`
--

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_order_coupon_lookup`
--

CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_order_product_lookup`
--

CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_order_stats`
--

CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_order_tax_lookup`
--

CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_product_meta_lookup`
--

CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_wc_product_meta_lookup`
--

INSERT INTO `wp_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(61, 'NuMuMu', 0, 0, '500.0000', '500.0000', 0, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(64, 'NuMuHo', 0, 0, '500.0000', '500.0000', 0, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(82, 'SaHoCuMa', 0, 0, '150.0000', '150.0000', 1, 100, 'instock', 0, '0.00', 0, 'taxable', ''),
(86, 'NuPe', 0, 0, '2398.0000', '2398.0000', 0, 2000, 'instock', 0, '0.00', 0, 'taxable', ''),
(113, 'NuMu50', 0, 0, '500.0000', '500.0000', 0, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(115, 'NuPe-1', 0, 0, '2398.0000', '2398.0000', 0, 2000, 'instock', 0, '0.00', 0, 'taxable', ''),
(117, 'HoLaSa', 0, 0, '5.0000', '5.0000', 1, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(119, 'HoLaRu', 0, 0, '100.0000', '100.0000', 1, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(122, 'HoLaTu', 0, 0, '100.0000', '100.0000', 1, 200, 'instock', 0, '0.00', 0, 'taxable', ''),
(125, 'HoLaRu-1', 0, 0, '100.0000', '100.0000', 1, 200, 'instock', 0, '0.00', 0, 'taxable', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_tax_rate_classes`
--

CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_wc_tax_rate_classes`
--

INSERT INTO `wp_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wc_webhooks`
--

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(11, '075a115867d2faf688f3ff0cdf5cc89c', 'a:1:{s:8:\"customer\";s:732:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:25:\"2020-05-19T08:11:56+00:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"GB\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"GB\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:18:\"1730505@upv.edu.mx\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}', 1590038941),
(17, 'a45a2e9c144143e51d07dcb319b3a1cd', 'a:1:{s:8:\"customer\";s:736:\"a:26:{s:2:\"id\";s:1:\"2\";s:13:\"date_modified\";s:25:\"2020-05-20T04:18:24+00:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"GB\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"GB\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:22:\"correousertb@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}', 1590121243),
(18, '1', 'a:8:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:732:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:25:\"2020-05-19T08:11:56+00:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"GB\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"GB\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:18:\"1730505@upv.edu.mx\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";s:10:\"wc_notices\";N;}', 1590132135);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indices de la tabla `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indices de la tabla `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indices de la tabla `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indices de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indices de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indices de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indices de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indices de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indices de la tabla `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indices de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indices de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indices de la tabla `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indices de la tabla `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `note_id` (`note_id`);

--
-- Indices de la tabla `wp_wc_category_lookup`
--
ALTER TABLE `wp_wc_category_lookup`
  ADD PRIMARY KEY (`category_tree_id`,`category_id`);

--
-- Indices de la tabla `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indices de la tabla `wp_wc_order_coupon_lookup`
--
ALTER TABLE `wp_wc_order_coupon_lookup`
  ADD PRIMARY KEY (`order_id`,`coupon_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indices de la tabla `wp_wc_order_product_lookup`
--
ALTER TABLE `wp_wc_order_product_lookup`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indices de la tabla `wp_wc_order_stats`
--
ALTER TABLE `wp_wc_order_stats`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`(191));

--
-- Indices de la tabla `wp_wc_order_tax_lookup`
--
ALTER TABLE `wp_wc_order_tax_lookup`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indices de la tabla `wp_wc_product_meta_lookup`
--
ALTER TABLE `wp_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Indices de la tabla `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(191));

--
-- Indices de la tabla `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indices de la tabla `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indices de la tabla `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`);

--
-- Indices de la tabla `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indices de la tabla `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indices de la tabla `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indices de la tabla `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indices de la tabla `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indices de la tabla `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indices de la tabla `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indices de la tabla `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indices de la tabla `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664;

--
-- AUTO_INCREMENT de la tabla `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1461;

--
-- AUTO_INCREMENT de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=633;

--
-- AUTO_INCREMENT de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  MODIFY `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD CONSTRAINT `fk_wp_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-07-2020 a las 21:10:20
-- Versión del servidor: 10.3.22-MariaDB-0ubuntu0.19.10.1
-- Versión de PHP: 7.3.17-1+ubuntu19.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gpsystem_admin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_vehicle` tinyint(1) DEFAULT 1,
  `is_device` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 11),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 14),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 15),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 12),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'is_vehicle', 'checkbox', 'Valido para Vehículo', 0, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'is_device', 'checkbox', 'Valido para Dispositivo', 0, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(27, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(28, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 5, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 3),
(30, 5, 'brand_id', 'text', 'Brand Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(31, 5, 'is_vehicle', 'checkbox', 'Valido para Vehículo', 0, 1, 1, 1, 1, 1, '{}', 5),
(32, 5, 'is_device', 'checkbox', 'Valido para Dispositivo', 0, 1, 1, 1, 1, 1, '{}', 6),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(35, 5, 'model_element_belongsto_brand_relationship', 'relationship', 'brands', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(36, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(37, 6, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(38, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(39, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(40, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(41, 7, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 3),
(42, 7, 'region_id', 'text', 'Region Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(43, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(44, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(45, 7, 'city_belongsto_region_relationship', 'relationship', 'Región', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Region\",\"table\":\"regions\",\"type\":\"belongsTo\",\"column\":\"region_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(46, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(47, 8, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(48, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(49, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(50, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(51, 9, 'ip', 'text', 'Dirección IP', 1, 1, 1, 1, 1, 1, '{}', 2),
(52, 9, 'port', 'text', 'Puerto', 1, 1, 1, 1, 1, 1, '{}', 3),
(53, 9, 'is_active', 'checkbox', 'Activo', 1, 1, 1, 1, 1, 1, '{}', 4),
(54, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(55, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(56, 1, 'user_belongsto_vendor_relationship', 'relationship', 'Cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Vendor\",\"table\":\"vendors\",\"type\":\"belongsTo\",\"column\":\"vendor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(57, 1, 'vendor_id', 'text', 'Vendor Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(58, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 10),
(59, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(60, 10, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 4),
(61, 10, 'phone', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 5),
(62, 10, 'region_id', 'text', 'Region Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(63, 10, 'city_id', 'text', 'City Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(64, 10, 'address', 'text_area', 'Dirección', 1, 1, 1, 1, 1, 1, '{}', 8),
(65, 10, 'logo', 'image', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 9),
(66, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 10),
(67, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(68, 10, 'vendor_belongsto_region_relationship', 'relationship', 'Región', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Region\",\"table\":\"regions\",\"type\":\"belongsTo\",\"column\":\"region_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(69, 10, 'vendor_belongsto_city_relationship', 'relationship', 'Ciudad', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\City\",\"table\":\"cities\",\"type\":\"belongsTo\",\"column\":\"city_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(70, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 11, 'imei', 'text', 'IMEI', 1, 1, 1, 1, 1, 1, '{}', 5),
(72, 11, 'brand_id', 'text', 'Brand Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(73, 11, 'model_element_id', 'text', 'Model Element Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(74, 11, 'server_id', 'text', 'Server Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(75, 11, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 1, '{}', 9),
(76, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(77, 11, 'device_belongsto_brand_relationship', 'relationship', 'Marca', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(78, 11, 'device_belongsto_model_element_relationship', 'relationship', 'Modelo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\ModelElement\",\"table\":\"model_elements\",\"type\":\"belongsTo\",\"column\":\"model_element_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(79, 11, 'device_belongsto_server_relationship', 'relationship', 'Servidor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Server\",\"table\":\"servers\",\"type\":\"belongsTo\",\"column\":\"server_id\",\"key\":\"id\",\"label\":\"ip\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(80, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 12, 'vendor_id', 'text', 'Vendor Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(82, 12, 'vehicle_number', 'text', 'Numero de Placa', 1, 1, 1, 1, 1, 1, '{}', 7),
(83, 12, 'brand_id', 'text', 'Brand Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(84, 12, 'model_element_id', 'text', 'Model Element Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(85, 12, 'vehicle_type_id', 'text', 'Vehicle Type Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(86, 12, 'photo', 'image', 'Foto', 0, 1, 1, 1, 1, 1, '{}', 11),
(87, 12, 'is_active', 'checkbox', 'Activo', 1, 1, 1, 1, 1, 1, '{}', 12),
(88, 12, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 1, '{}', 13),
(89, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(90, 12, 'vehicle_belongsto_vendor_relationship', 'relationship', 'Cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Vendor\",\"table\":\"vendors\",\"type\":\"belongsTo\",\"column\":\"vendor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(91, 12, 'vehicle_belongsto_brand_relationship', 'relationship', 'Marca', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(92, 12, 'vehicle_belongsto_model_element_relationship', 'relationship', 'Modelo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\ModelElement\",\"table\":\"model_elements\",\"type\":\"belongsTo\",\"column\":\"model_element_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(93, 12, 'vehicle_belongsto_vehicle_type_relationship', 'relationship', 'Tipo de Vehiculo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\VehicleType\",\"table\":\"vehicle_types\",\"type\":\"belongsTo\",\"column\":\"vehicle_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(94, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(95, 14, 'vehicle_id', 'text', 'Vehicle Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(96, 14, 'device_id', 'text', 'Device Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(97, 14, 'date_active', 'date', 'Fecha Activacion', 1, 1, 1, 1, 1, 1, '{}', 6),
(98, 14, 'date_inactive', 'date', 'Fecha Inactivacion', 0, 1, 1, 1, 1, 1, '{}', 7),
(99, 14, 'is_active', 'checkbox', 'Activo', 1, 1, 1, 1, 1, 1, '{}', 8),
(100, 14, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 1, '{}', 9),
(101, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(102, 14, 'vehicle_device_belongsto_vehicle_relationship', 'relationship', 'Vehiculo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Vehicle\",\"table\":\"vehicles\",\"type\":\"belongsTo\",\"column\":\"vehicle_id\",\"key\":\"id\",\"label\":\"vehicle_number\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(103, 14, 'vehicle_device_belongsto_device_relationship', 'relationship', 'Dispositivo', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Device\",\"table\":\"devices\",\"type\":\"belongsTo\",\"column\":\"device_id\",\"key\":\"id\",\"label\":\"imei\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'App\\Http\\Controllers\\UserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 00:48:35', '2020-07-21 03:38:37'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(4, 'brands', 'brands', 'Marca', 'Marcas', NULL, 'App\\Brand', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(5, 'model_elements', 'model-elements', 'Modelo', 'Modelos', NULL, 'App\\ModelElement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 00:50:37', '2020-07-21 00:52:28'),
(6, 'regions', 'regions', 'Region', 'Regiones', NULL, 'App\\Region', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(7, 'cities', 'cities', 'Ciudad', 'Ciudades', NULL, 'App\\City', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 00:56:55', '2020-07-21 00:57:35'),
(8, 'vehicle_types', 'vehicle-types', 'Tipo de Vehículo', 'Tipos de Vehículos', NULL, 'App\\VehicleType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 00:58:52', '2020-07-21 00:59:12'),
(9, 'servers', 'servers', 'Servidor', 'Servidores', NULL, 'App\\Server', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(10, 'vendors', 'vendors', 'Cliente', 'Clientes', NULL, 'App\\Vendor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 01:16:29', '2020-07-21 01:20:42'),
(11, 'devices', 'devices', 'Dispositivo', 'Dispositivos', NULL, 'App\\Device', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 01:23:55', '2020-07-21 01:26:21'),
(12, 'vehicles', 'vehicles', 'Vehiculo', 'Vehiculos', NULL, 'App\\Vehicle', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 01:35:26', '2020-07-21 01:38:50'),
(14, 'vehicle_devices', 'vehicle-devices', 'Dispositivo en Vehiculo', 'Dispositivos en Vehiculos', NULL, 'App\\VehicleDevice', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-21 01:43:57', '2020-07-21 01:45:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `imei` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `model_element_id` bigint(20) UNSIGNED NOT NULL,
  `server_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-07-21 00:48:35', '2020-07-21 01:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-07-21 00:48:35', '2020-07-21 00:48:35', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-07-21 00:48:35', '2020-07-21 00:48:35', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-07-21 00:48:35', '2020-07-21 00:48:35', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2020-07-21 00:48:35', '2020-07-21 01:55:12', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-07-21 00:48:35', '2020-07-21 01:55:12', 'voyager.hooks', NULL),
(12, 1, 'Marcas', '', '_self', NULL, NULL, 23, 4, '2020-07-21 00:49:53', '2020-07-21 01:57:47', 'voyager.brands.index', NULL),
(13, 1, 'Modelos', '', '_self', NULL, NULL, 23, 5, '2020-07-21 00:50:37', '2020-07-21 01:57:47', 'voyager.model-elements.index', NULL),
(15, 1, 'Regiones', '', '_self', NULL, NULL, 23, 2, '2020-07-21 00:56:27', '2020-07-21 01:57:47', 'voyager.regions.index', NULL),
(16, 1, 'Ciudades', '', '_self', NULL, NULL, 23, 3, '2020-07-21 00:56:55', '2020-07-21 01:57:47', 'voyager.cities.index', NULL),
(17, 1, 'Tipos de Vehículos', '', '_self', NULL, '#000000', 23, 6, '2020-07-21 00:58:52', '2020-07-21 01:57:47', 'voyager.vehicle-types.index', 'null'),
(18, 1, 'Servidores', '', '_self', NULL, NULL, 23, 1, '2020-07-21 01:01:19', '2020-07-21 01:57:47', 'voyager.servers.index', NULL),
(19, 1, 'Clientes', '', '_self', NULL, NULL, NULL, 8, '2020-07-21 01:16:29', '2020-07-21 01:58:00', 'voyager.vendors.index', NULL),
(20, 1, 'Dispositivos', '', '_self', NULL, NULL, 23, 7, '2020-07-21 01:23:55', '2020-07-21 01:57:47', 'voyager.devices.index', NULL),
(21, 1, 'Vehiculos', '', '_self', NULL, NULL, 23, 8, '2020-07-21 01:35:26', '2020-07-21 01:57:47', 'voyager.vehicles.index', NULL),
(22, 1, 'Dispositivos en Vehiculos', '', '_self', NULL, NULL, NULL, 9, '2020-07-21 01:43:57', '2020-07-21 01:58:00', 'voyager.vehicle-devices.index', NULL),
(23, 1, 'Configuración', '', '_self', 'voyager-settings', '#000000', NULL, 7, '2020-07-21 01:55:02', '2020-07-21 01:58:00', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_01_01_000000_add_voyager_user_fields', 1),
(3, '2016_01_01_000000_create_data_types_table', 1),
(4, '2016_05_19_173453_create_menu_table', 1),
(5, '2016_10_21_190000_create_roles_table', 1),
(6, '2016_10_21_190000_create_settings_table', 1),
(7, '2016_11_30_135954_create_permission_table', 1),
(8, '2016_11_30_141208_create_permission_role_table', 1),
(9, '2016_12_26_201236_data_types__add__server_side', 1),
(10, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(11, '2017_01_14_005015_create_translations_table', 1),
(12, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(13, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(14, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(15, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(16, '2017_08_05_000000_add_group_to_settings_table', 1),
(17, '2017_11_26_013050_add_user_role_relationship', 1),
(18, '2017_11_26_015000_create_user_roles_table', 1),
(19, '2018_03_11_000000_add_user_settings', 1),
(20, '2018_03_14_000000_add_details_to_data_types_table', 1),
(21, '2018_03_16_000000_make_settings_value_nullable', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2020_07_20_185221_create_regions_table', 1),
(24, '2020_07_20_185231_create_cities_table', 1),
(25, '2020_07_20_195257_create_brands_table', 1),
(26, '2020_07_20_195306_create_model_elements_table', 1),
(27, '2020_07_20_200130_create_vehicle_types_table', 1),
(28, '2020_07_20_200149_create_servers_table', 1),
(29, '2020_07_20_200242_create_devices_table', 1),
(30, '2020_07_20_200909_create_vendors_table', 1),
(31, '2020_07_20_200924_create_vehicles_table', 1),
(32, '2020_07_20_200950_create_vehicle_devices_table', 1),
(33, '2020_07_20_201932_create_traces_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_elements`
--

CREATE TABLE `model_elements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `is_vehicle` tinyint(1) DEFAULT 1,
  `is_device` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(2, 'browse_bread', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(3, 'browse_database', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(4, 'browse_media', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(5, 'browse_compass', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(6, 'browse_menus', 'menus', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(7, 'read_menus', 'menus', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(8, 'edit_menus', 'menus', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(9, 'add_menus', 'menus', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(10, 'delete_menus', 'menus', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(11, 'browse_roles', 'roles', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(12, 'read_roles', 'roles', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(13, 'edit_roles', 'roles', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(14, 'add_roles', 'roles', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(15, 'delete_roles', 'roles', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(16, 'browse_users', 'users', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(17, 'read_users', 'users', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(18, 'edit_users', 'users', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(19, 'add_users', 'users', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(20, 'delete_users', 'users', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(21, 'browse_settings', 'settings', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(22, 'read_settings', 'settings', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(23, 'edit_settings', 'settings', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(24, 'add_settings', 'settings', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(25, 'delete_settings', 'settings', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(26, 'browse_hooks', NULL, '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(27, 'browse_brands', 'brands', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(28, 'read_brands', 'brands', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(29, 'edit_brands', 'brands', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(30, 'add_brands', 'brands', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(31, 'delete_brands', 'brands', '2020-07-21 00:49:53', '2020-07-21 00:49:53'),
(32, 'browse_model_elements', 'model_elements', '2020-07-21 00:50:37', '2020-07-21 00:50:37'),
(33, 'read_model_elements', 'model_elements', '2020-07-21 00:50:37', '2020-07-21 00:50:37'),
(34, 'edit_model_elements', 'model_elements', '2020-07-21 00:50:37', '2020-07-21 00:50:37'),
(35, 'add_model_elements', 'model_elements', '2020-07-21 00:50:37', '2020-07-21 00:50:37'),
(36, 'delete_model_elements', 'model_elements', '2020-07-21 00:50:37', '2020-07-21 00:50:37'),
(37, 'browse_regions', 'regions', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(38, 'read_regions', 'regions', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(39, 'edit_regions', 'regions', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(40, 'add_regions', 'regions', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(41, 'delete_regions', 'regions', '2020-07-21 00:56:27', '2020-07-21 00:56:27'),
(42, 'browse_cities', 'cities', '2020-07-21 00:56:55', '2020-07-21 00:56:55'),
(43, 'read_cities', 'cities', '2020-07-21 00:56:55', '2020-07-21 00:56:55'),
(44, 'edit_cities', 'cities', '2020-07-21 00:56:55', '2020-07-21 00:56:55'),
(45, 'add_cities', 'cities', '2020-07-21 00:56:55', '2020-07-21 00:56:55'),
(46, 'delete_cities', 'cities', '2020-07-21 00:56:55', '2020-07-21 00:56:55'),
(47, 'browse_vehicle_types', 'vehicle_types', '2020-07-21 00:58:52', '2020-07-21 00:58:52'),
(48, 'read_vehicle_types', 'vehicle_types', '2020-07-21 00:58:52', '2020-07-21 00:58:52'),
(49, 'edit_vehicle_types', 'vehicle_types', '2020-07-21 00:58:52', '2020-07-21 00:58:52'),
(50, 'add_vehicle_types', 'vehicle_types', '2020-07-21 00:58:52', '2020-07-21 00:58:52'),
(51, 'delete_vehicle_types', 'vehicle_types', '2020-07-21 00:58:52', '2020-07-21 00:58:52'),
(52, 'browse_servers', 'servers', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(53, 'read_servers', 'servers', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(54, 'edit_servers', 'servers', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(55, 'add_servers', 'servers', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(56, 'delete_servers', 'servers', '2020-07-21 01:01:19', '2020-07-21 01:01:19'),
(57, 'browse_vendors', 'vendors', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(58, 'read_vendors', 'vendors', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(59, 'edit_vendors', 'vendors', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(60, 'add_vendors', 'vendors', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(61, 'delete_vendors', 'vendors', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(62, 'browse_devices', 'devices', '2020-07-21 01:23:55', '2020-07-21 01:23:55'),
(63, 'read_devices', 'devices', '2020-07-21 01:23:55', '2020-07-21 01:23:55'),
(64, 'edit_devices', 'devices', '2020-07-21 01:23:55', '2020-07-21 01:23:55'),
(65, 'add_devices', 'devices', '2020-07-21 01:23:55', '2020-07-21 01:23:55'),
(66, 'delete_devices', 'devices', '2020-07-21 01:23:55', '2020-07-21 01:23:55'),
(67, 'browse_vehicles', 'vehicles', '2020-07-21 01:35:26', '2020-07-21 01:35:26'),
(68, 'read_vehicles', 'vehicles', '2020-07-21 01:35:26', '2020-07-21 01:35:26'),
(69, 'edit_vehicles', 'vehicles', '2020-07-21 01:35:26', '2020-07-21 01:35:26'),
(70, 'add_vehicles', 'vehicles', '2020-07-21 01:35:26', '2020-07-21 01:35:26'),
(71, 'delete_vehicles', 'vehicles', '2020-07-21 01:35:26', '2020-07-21 01:35:26'),
(72, 'browse_vehicle_devices', 'vehicle_devices', '2020-07-21 01:43:57', '2020-07-21 01:43:57'),
(73, 'read_vehicle_devices', 'vehicle_devices', '2020-07-21 01:43:57', '2020-07-21 01:43:57'),
(74, 'edit_vehicle_devices', 'vehicle_devices', '2020-07-21 01:43:57', '2020-07-21 01:43:57'),
(75, 'add_vehicle_devices', 'vehicle_devices', '2020-07-21 01:43:57', '2020-07-21 01:43:57'),
(76, 'delete_vehicle_devices', 'vehicle_devices', '2020-07-21 01:43:57', '2020-07-21 01:43:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(67, 3),
(68, 1),
(68, 3),
(69, 1),
(69, 3),
(70, 1),
(70, 3),
(71, 1),
(71, 3),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(74, 3),
(75, 1),
(75, 3),
(76, 1),
(76, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Portuguesa', '2020-07-21 00:57:47', '2020-07-21 00:57:47'),
(2, 'Yaracuy', '2020-07-21 03:10:24', '2020-07-21 03:10:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-07-21 00:48:35', '2020-07-21 00:48:35'),
(3, 'system_administrator', 'Administrador de Sistema', '2020-07-21 02:00:10', '2020-07-21 02:00:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servers`
--

CREATE TABLE `servers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'GpSystem', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'GpSystem', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'GpSystem', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'GpSystem', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traces`
--

CREATE TABLE `traces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` decimal(8,2) NOT NULL,
  `longitude` decimal(8,2) NOT NULL,
  `speed` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `vendor_id`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Carlos Vargas', NULL, 'cvargas@frontuari.net', 'users/default.png', NULL, '$2y$10$tougj0BRTxmwUZdVCqJmE.n5nwaebkJrGQqsmrYgIlsVJS5JdaCIO', 'ZlJjtw9tgBInNa5itYFMt5FKbBOSqMNPJJbUUIOKfaNmdH92qTrQLlHpIXnX', NULL, '2020-07-21 00:48:57', '2020-07-21 00:48:57'),
(2, 3, 'Jhon', NULL, 'administrador@administrador.com', 'users/default.png', NULL, '$2y$10$rH7IQswNEaXCqTOQSoHbWu5EkchhAhnQQFkScUyNH0MyMQ1l2/goq', NULL, '{\"locale\":\"en\"}', '2020-07-21 01:59:01', '2020-07-21 02:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_number` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `model_element_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_type_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicle_devices`
--

CREATE TABLE `vehicle_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `date_active` date NOT NULL,
  `date_inactive` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_region_id_foreign` (`region_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_brand_id_foreign` (`brand_id`),
  ADD KEY `devices_model_element_id_foreign` (`model_element_id`),
  ADD KEY `devices_server_id_foreign` (`server_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_elements`
--
ALTER TABLE `model_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_elements_brand_id_foreign` (`brand_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `traces`
--
ALTER TABLE `traces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traces_vendor_id_foreign` (`vendor_id`),
  ADD KEY `traces_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `traces_device_id_foreign` (`device_id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vehicles_brand_id_foreign` (`brand_id`),
  ADD KEY `vehicles_model_element_id_foreign` (`model_element_id`),
  ADD KEY `vehicles_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indices de la tabla `vehicle_devices`
--
ALTER TABLE `vehicle_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_devices_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `vehicle_devices_device_id_foreign` (`device_id`);

--
-- Indices de la tabla `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_region_id_foreign` (`region_id`),
  ADD KEY `vendors_city_id_foreign` (`city_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `model_elements`
--
ALTER TABLE `model_elements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servers`
--
ALTER TABLE `servers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `traces`
--
ALTER TABLE `traces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehicle_devices`
--
ALTER TABLE `vehicle_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_model_element_id_foreign` FOREIGN KEY (`model_element_id`) REFERENCES `model_elements` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_elements`
--
ALTER TABLE `model_elements`
  ADD CONSTRAINT `model_elements_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `traces`
--
ALTER TABLE `traces`
  ADD CONSTRAINT `traces_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `traces_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `traces_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicles_model_element_id_foreign` FOREIGN KEY (`model_element_id`) REFERENCES `model_elements` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicles_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicles_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehicle_devices`
--
ALTER TABLE `vehicle_devices`
  ADD CONSTRAINT `vehicle_devices_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_devices_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vendors_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

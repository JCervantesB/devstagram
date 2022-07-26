/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comentarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_user_id_foreign` (`user_id`),
  KEY `comentarios_post_id_foreign` (`post_id`),
  CONSTRAINT `comentarios_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comentarios` (`id`, `user_id`, `post_id`, `comentario`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Genial!!', '2022-05-17 20:15:35', '2022-05-17 20:15:35');




INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 3, 1, '2022-05-17 20:13:13', '2022-05-17 20:13:13');
INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2022-05-17 20:15:54', '2022-05-17 20:15:54');
INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(4, 1, 2, '2022-05-17 20:35:31', '2022-05-17 20:35:31');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(18, '2022_05_05_175010_add_username_to_users_table', 1),
(20, '2022_05_11_194054_create_posts_table', 2),
(22, '2022_05_13_203644_create_comentarios_table', 3),
(23, '2022_05_17_184905_create_likes_table', 4);





INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nuevo curso de Big Data', 'Listo mi nuevo curso de Big Data', '36337990-f426-4711-878b-6f82cc049c2a.jpg', 3, '2022-05-13 16:45:41', '2022-05-13 16:45:41');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Trabajando', 'Otro día mas trabajando en la programación con Laravel!', '420d068d-e6fa-4735-a652-bebd0fbcd9a6.jpg', 3, '2022-05-13 16:49:33', '2022-05-13 16:49:33');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'Un día en el trabajo', 'Analizando el código de los alumnos', '42df157d-0998-46ee-bd28-1b518c0f7379.jpg', 3, '2022-05-13 17:25:49', '2022-05-13 17:25:49');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'DevStagram', 'Creando DevStagram en Laravel 9', '558b8589-aa86-4b64-bac4-c6ebbca52d2d.jpg', 3, '2022-05-13 17:53:26', '2022-05-13 17:53:26'),
(5, 'Ideas', 'Las que conducen y arrastran al mundo no son las máquinas, sino las ideas.', 'ab7587ae-2353-4a35-b02f-e41b418d68a2.jpg', 3, '2022-05-13 17:56:29', '2022-05-13 17:56:29'),
(6, 'Aprende JS', 'Aprende JS y aprendelo Ahora', '65551f11-5c36-4be7-bc53-076fe230f3d0.png', 3, '2022-05-13 17:59:48', '2022-05-13 17:59:48'),
(8, 'Trabajando', 'Trabajando Ando...', '76c293c9-fb8c-4fc9-acef-b62d7e327568.jpg', 3, '2022-05-13 18:01:19', '2022-05-13 18:01:19'),
(9, 'Code', 'Un día de código', '74eb8315-d9fc-4210-95f4-3e076961abf2.jpg', 3, '2022-05-13 18:02:08', '2022-05-13 18:02:08');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`) VALUES
(1, 'Juan', 'correo@correo.com', NULL, '$2y$10$7adBoiKZAGNtwa32cx7zfOIBlbniZN2eDxEz3KgBopgu4oRVsQWVK', NULL, '2022-05-05 18:32:50', '2022-05-05 18:32:50', 'codigo-con-juan');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`) VALUES
(3, 'Julio Cervantes', 'imjcervantes@gmail.com', NULL, '$2y$10$MnE74/moT1ewDYHdDRBMJ.zTv1uH/Jq9LDs0qzQZIsn5egaQUpa8G', 'nLatSiUsxQOkTYgLxSBwmziAZfplu0PuJjNOU5GeT9LkagXJpYRnnVDqRBDJ', '2022-05-05 18:38:19', '2022-05-05 18:38:19', 'imjcervantes');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`) VALUES
(6, 'Ract Dev', 'correo2@correo.com', NULL, '$2y$10$HK/C6T0g/7L5sigTKOMPHurWo8zSyc.unTn2USZi2qL7d62Rw/fgK', 'wHLpcLFzkoMq4HXbkRTd8xc8uTAuBuguIY60AJQfAiI0OJKbVxnM9eaM73Rj', '2022-05-05 18:58:06', '2022-05-05 18:58:06', 'reactdev');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`) VALUES
(7, 'DonCursos', 'correo3@correo.com', NULL, '$2y$10$iZCueIxWcS5B38HaAyIiW.nyBvs40Lu1xVYM9D.R9rB.ZN/DHwyz.', NULL, '2022-05-05 19:00:35', '2022-05-05 19:00:35', 'doncursos');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS buku;
CREATE TABLE `buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_buku` int(10) unsigned DEFAULT NULL,
  `kode_isbn` varchar(100) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `jumlah_buku` int(10) unsigned DEFAULT NULL,
  `previews_buku` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_rows;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_types;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS jenis_buku;
CREATE TABLE `jenis_buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_buku` varchar(255) DEFAULT NULL,
  `limit_peminjaman` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS kelas;
CREATE TABLE `kelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `ruang_kelas` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kelas_kode_kelas_unique` (`kode_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS main_transaction;
CREATE TABLE `main_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned DEFAULT NULL,
  `buku` int(10) unsigned DEFAULT NULL,
  `petugas` int(10) unsigned DEFAULT NULL,
  `tanngal_pinjam` datetime DEFAULT NULL,
  `jumlah_pinjam` int(10) unsigned DEFAULT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `denda` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menus;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menu_items;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_resets;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permissions;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permission_role;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS personal_access_tokens;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS settings;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS siswa;
CREATE TABLE `siswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(11) DEFAULT NULL,
  `nipd` int(11) DEFAULT NULL,
  `nisn` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tahun_masuk` date DEFAULT NULL,
  `tahun_lulus` date DEFAULT NULL,
  `kode_siswa` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswa_kode_siswa_unique` (`kode_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS translations;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS user_roles;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO data_rows(id,data_type_id,field,type,display_name,required,browse,read,edit,add,delete,details,order) VALUES('1','1','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('2','1','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('3','1','\'email\'','\'text\'','\'Email\'','1','1','1','1','1','1','NULL','3'),('4','1','\'password\'','\'password\'','\'Password\'','1','0','0','1','1','0','NULL','4'),('5','1','\'remember_token\'','\'text\'','\'Remember Token\'','0','0','0','0','0','0','NULL','5'),('6','1','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','0','0','0','NULL','6'),('7','1','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','7'),('8','1','\'avatar\'','\'image\'','\'Avatar\'','0','1','1','1','1','1','NULL','8'),('9','1','\'user_belongsto_role_relationship\'','\'relationship\'','\'Role\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22726f6c655f6964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22726f6c6573222c227069766f74223a307d\'','10'),('10','1','\'user_belongstomany_role_relationship\'','\'relationship\'','\'Roles\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22757365725f726f6c6573222c227069766f74223a2231222c227461676761626c65223a2230227d\'','11'),('11','1','\'settings\'','\'hidden\'','\'Settings\'','0','0','0','0','0','0','NULL','12'),('12','2','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('13','2','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('14','2','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('15','2','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('16','3','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('17','3','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('18','3','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('19','3','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('20','3','\'display_name\'','\'text\'','\'Display Name\'','1','1','1','1','1','1','NULL','5'),('21','1','\'role_id\'','\'text\'','\'Role\'','1','1','1','1','1','1','NULL','9'),('22','4','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('23','4','\'jenis_buku\'','\'text\'','\'Jenis Buku\'','0','1','1','1','1','1','X\'7b7d\'','2'),('24','4','\'limit_peminjaman\'','\'text\'','\'Limit Peminjaman\'','0','1','1','1','1','1','X\'7b7d\'','3'),('25','4','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','4'),('26','4','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','5'),('27','5','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('28','5','\'jenis_buku\'','\'text\'','\'Jenis Buku\'','0','1','1','1','1','1','X\'7b7d\'','2'),('29','5','\'kode_isbn\'','\'text\'','\'Kode Isbn\'','0','1','1','1','1','1','X\'7b7d\'','3'),('30','5','\'judul\'','\'text\'','\'Judul\'','0','1','1','1','1','1','X\'7b7d\'','4'),('31','5','\'cover\'','\'image\'','\'Cover\'','0','1','1','1','1','1','X\'7b22726573697a65223a7b227769647468223a2231303030222c22686569676874223a6e756c6c7d2c227175616c697479223a2231303025222c22757073697a65223a747275652c227468756d626e61696c73223a5b7b226e616d65223a226d656469756d222c227363616c65223a22353025227d2c7b226e616d65223a22736d616c6c222c227363616c65223a22323525227d2c7b226e616d65223a2263726f70706564222c2263726f70223a7b227769647468223a22333030222c22686569676874223a22323530227d7d5d7d\'','5'),('32','5','\'penulis\'','\'text\'','\'Penulis\'','0','1','1','1','1','1','X\'7b7d\'','6'),('33','5','\'jumlah_buku\'','\'text\'','\'Jumlah Buku\'','0','1','1','1','1','1','X\'7b7d\'','7'),('34','5','\'previews_buku\'','\'file\'','\'Previews Buku\'','0','1','1','1','1','1','X\'7b7d\'','8'),('35','5','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','9'),('36','5','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','10'),('37','5','\'buku_belongsto_jenis_buku_relationship\'','\'relationship\'','\'jenis_buku\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c4a656e697342756b75222c227461626c65223a226a656e69735f62756b75222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a226a656e69735f62756b75222c226b6579223a226964222c226c6162656c223a226a656e69735f62756b75222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','11'),('38','6','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('39','6','\'kode_kelas\'','\'text\'','\'Kode Kelas\'','1','1','1','1','1','1','X\'7b7d\'','2'),('40','6','\'jurusan\'','\'text\'','\'Jurusan\'','1','1','1','1','1','1','X\'7b7d\'','3'),('41','6','\'nama_kelas\'','\'text\'','\'Nama Kelas\'','1','1','1','1','1','1','X\'7b7d\'','4'),('42','6','\'ruang_kelas\'','\'text\'','\'Ruang Kelas\'','0','1','1','1','1','1','X\'7b7d\'','5'),('43','6','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','6'),('44','6','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','7'),('57','8','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('58','8','\'kelas\'','\'text\'','\'Kelas\'','0','1','1','1','1','1','X\'7b7d\'','2'),('59','8','\'nipd\'','\'text\'','\'Nipd\'','0','1','1','1','1','1','X\'7b7d\'','3'),('60','8','\'nisn\'','\'text\'','\'Nisn\'','0','1','1','1','1','1','X\'7b7d\'','4'),('61','8','\'nama_lengkap\'','\'text\'','\'Nama Lengkap\'','0','1','1','1','1','1','X\'7b7d\'','5'),('62','8','\'alamat\'','\'text_area\'','\'Alamat\'','0','1','1','1','1','1','X\'7b7d\'','6'),('63','8','\'status\'','\'select_dropdown\'','\'Status\'','0','1','1','1','1','1','X\'7b2264656661756c74223a22616b746966222c226f7074696f6e73223a7b22616b746966223a22616b746966222c227061736966223a227061736966222c226b656c756172223a226b656c756172227d7d\'','7'),('64','8','\'tahun_masuk\'','\'date\'','\'Tahun Masuk\'','0','1','1','1','1','1','X\'7b7d\'','8'),('65','8','\'tahun_lulus\'','\'date\'','\'Tahun Lulus\'','0','1','1','1','1','1','X\'7b7d\'','9'),('66','8','\'kode_siswa\'','\'text\'','\'Kode Siswa\'','0','1','1','1','1','1','X\'7b7d\'','10'),('67','8','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','11'),('68','8','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','12'),('69','8','\'siswa_belongsto_kela_relationship\'','\'relationship\'','\'kelas\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c4b656c6173222c227461626c65223a226b656c6173222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a226b656c6173222c226b6579223a226964222c226c6162656c223a226e616d615f6b656c6173222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','13'),('70','9','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('71','9','\'siswa\'','\'text\'','\'Siswa\'','0','1','1','1','1','1','X\'7b7d\'','2'),('72','9','\'buku\'','\'text\'','\'Buku\'','0','1','1','1','1','1','X\'7b7d\'','3'),('73','9','\'petugas\'','\'text\'','\'Petugas\'','0','1','1','1','1','1','X\'7b7d\'','4'),('74','9','\'tanngal_pinjam\'','\'date\'','\'Tanngal Pinjam\'','0','1','1','1','1','1','X\'7b7d\'','5'),('75','9','\'jumlah_pinjam\'','\'text\'','\'Jumlah Pinjam\'','0','1','1','1','1','1','X\'7b7d\'','6'),('76','9','\'tanggal_kembali\'','\'date\'','\'Tanggal Kembali\'','0','1','1','1','1','1','X\'7b7d\'','7'),('77','9','\'keterangan\'','\'text_area\'','\'Keterangan\'','0','1','1','1','1','1','X\'7b7d\'','8'),('78','9','\'denda\'','\'text\'','\'Denda\'','0','1','1','1','1','1','X\'7b7d\'','9'),('79','9','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','10'),('80','9','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','11'),('81','9','\'main_transaction_belongsto_buku_relationship\'','\'relationship\'','\'buku\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c42756b75222c227461626c65223a2262756b75222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2262756b75222c226b6579223a226964222c226c6162656c223a226a7564756c222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','12'),('82','9','\'main_transaction_belongsto_siswa_relationship\'','\'relationship\'','\'siswa\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c5369737761222c227461626c65223a227369737761222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a227369737761222c226b6579223a226964222c226c6162656c223a226e616d615f6c656e676b6170222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','13'),('83','9','\'main_transaction_belongsto_user_relationship\'','\'relationship\'','\'users\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2270657475676173222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','14');

INSERT INTO data_types(id,name,slug,display_name_singular,display_name_plural,icon,model_name,policy_name,controller,description,generate_permissions,server_side,details,created_at,updated_at) VALUES('1','\'users\'','\'users\'','\'User\'','\'Users\'','\'voyager-person\'','\'TCG\\\\Voyager\\\\Models\\\\User\'','\'TCG\\\\Voyager\\\\Policies\\\\UserPolicy\'','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerUserController\'','\'\'','1','0','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('2','\'menus\'','\'menus\'','\'Menu\'','\'Menus\'','\'voyager-list\'','\'TCG\\\\Voyager\\\\Models\\\\Menu\'','NULL','\'\'','\'\'','1','0','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('3','\'roles\'','\'roles\'','\'Role\'','\'Roles\'','\'voyager-lock\'','\'TCG\\\\Voyager\\\\Models\\\\Role\'','NULL','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerRoleController\'','\'\'','1','0','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('4','\'jenis_buku\'','\'jenis-buku\'','\'Jenis Buku\'','\'Jenis Buku\'','\'voyager-documentation\'','\'App\\\\Models\\\\JenisBuku\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c7d\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('5','\'buku\'','\'buku\'','\'Buku\'','\'Buku\'','\'voyager-book\'','\'App\\\\Models\\\\Buku\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-11 12:00:46\'','\'2023-10-11 12:03:37\''),('6','\'kelas\'','\'kelas\'','\'Kelas\'','\'Kelas\'','\'voyager-study\'','\'App\\\\Models\\\\Kelas\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c7d\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('8','\'siswa\'','\'siswa\'','\'Siswa\'','\'Siswa\'','\'voyager-group\'','\'App\\\\Models\\\\Siswa\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:17:17\''),('9','\'main_transaction\'','\'main-transaction\'','\'Main Transaction\'','\'Main Transaction\'','\'voyager-window-list\'','\'App\\\\Models\\\\MainTransaction\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:38:34\'');


INSERT INTO jenis_buku(id,jenis_buku,limit_peminjaman,created_at,updated_at) VALUES('1','\'pelajaran\'','\'1 Tahun\'','\'2023-10-11 11:49:25\'','\'2023-10-11 11:49:25\''),('2','\'Bacaan\'','\'1 Minggu\'','\'2023-10-11 11:50:12\'','\'2023-10-11 11:50:12\'');

INSERT INTO kelas(id,kode_kelas,jurusan,nama_kelas,ruang_kelas,created_at,updated_at) VALUES('1','\'A001\'','\'PPLG\'','\'nurhid\'','\'c.44\'','\'2023-10-16 02:39:36\'','\'2023-10-16 02:39:36\''),('2','\'A003\'','\'PPLG\'','\'12 PPLG 4\'','\'c.45\'','\'2023-10-16 03:20:09\'','\'2023-10-16 03:20:09\'');

INSERT INTO main_transaction(id,siswa,buku,petugas,tanngal_pinjam,jumlah_pinjam,tanggal_kembali,keterangan,denda,created_at,updated_at) VALUES('1','1','2','2','\'2023-10-16 00:00:00\'','1','\'2023-10-17 00:00:00\'','NULL','NULL','\'2023-10-16 03:39:36\'','\'2023-10-16 03:39:36\'');

INSERT INTO menus(id,name,created_at,updated_at) VALUES('1','\'admin\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'');

INSERT INTO menu_items(id,menu_id,title,url,target,icon_class,color,parent_id,order,created_at,updated_at,route,parameters) VALUES('1','1','\'Dashboard\'','\'\'','\'_self\'','\'voyager-boat\'','NULL','NULL','1','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.dashboard\'','NULL'),('2','1','\'Media\'','\'\'','\'_self\'','\'voyager-images\'','NULL','NULL','5','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.media.index\'','NULL'),('3','1','\'Users\'','\'\'','\'_self\'','\'voyager-person\'','NULL','NULL','3','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.users.index\'','NULL'),('4','1','\'Roles\'','\'\'','\'_self\'','\'voyager-lock\'','NULL','NULL','2','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.roles.index\'','NULL'),('5','1','\'Tools\'','\'\'','\'_self\'','\'voyager-tools\'','NULL','NULL','9','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','NULL','NULL'),('6','1','\'Menu Builder\'','\'\'','\'_self\'','\'voyager-list\'','NULL','5','10','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.menus.index\'','NULL'),('7','1','\'Database\'','\'\'','\'_self\'','\'voyager-data\'','NULL','5','11','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.database.index\'','NULL'),('8','1','\'Compass\'','\'\'','\'_self\'','\'voyager-compass\'','NULL','5','12','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.compass.index\'','NULL'),('9','1','\'BREAD\'','\'\'','\'_self\'','\'voyager-bread\'','NULL','5','13','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.bread.index\'','NULL'),('10','1','\'Settings\'','\'\'','\'_self\'','\'voyager-settings\'','NULL','NULL','14','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\'','\'voyager.settings.index\'','NULL'),('11','1','\'Jenis Buku\'','\'\'','\'_self\'','\'voyager-documentation\'','NULL','NULL','15','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\'','\'voyager.jenis-buku.index\'','NULL'),('12','1','\'Buku\'','\'\'','\'_self\'','\'voyager-book\'','NULL','NULL','16','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\'','\'voyager.buku.index\'','NULL'),('13','1','\'Kelas\'','\'\'','\'_self\'','\'voyager-study\'','NULL','NULL','17','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\'','\'voyager.kelas.index\'','NULL'),('15','1','\'Siswa\'','\'\'','\'_self\'','\'voyager-group\'','NULL','NULL','18','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\'','\'voyager.siswa.index\'','NULL'),('16','1','\'Main Transaction\'','\'\'','\'_self\'','\'voyager-window-list\'','NULL','NULL','19','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\'','\'voyager.main-transaction.index\'','NULL');

INSERT INTO migrations(id,migration,batch) VALUES('1','\'2014_10_12_000000_create_users_table\'','1'),('2','\'2014_10_12_100000_create_password_resets_table\'','1'),('3','\'2016_01_01_000000_add_voyager_user_fields\'','1'),('4','\'2016_01_01_000000_create_data_types_table\'','1'),('5','\'2016_05_19_173453_create_menu_table\'','1'),('6','\'2016_10_21_190000_create_roles_table\'','1'),('7','\'2016_10_21_190000_create_settings_table\'','1'),('8','\'2016_11_30_135954_create_permission_table\'','1'),('9','\'2016_11_30_141208_create_permission_role_table\'','1'),('10','\'2016_12_26_201236_data_types__add__server_side\'','1'),('11','\'2017_01_13_000000_add_route_to_menu_items_table\'','1'),('12','\'2017_01_14_005015_create_translations_table\'','1'),('13','\'2017_01_15_000000_make_table_name_nullable_in_permissions_table\'','1'),('14','\'2017_03_06_000000_add_controller_to_data_types_table\'','1'),('15','\'2017_04_21_000000_add_order_to_data_rows_table\'','1'),('16','\'2017_07_05_210000_add_policyname_to_data_types_table\'','1'),('17','\'2017_08_05_000000_add_group_to_settings_table\'','1'),('18','\'2017_11_26_013050_add_user_role_relationship\'','1'),('19','\'2017_11_26_015000_create_user_roles_table\'','1'),('20','\'2018_03_11_000000_add_user_settings\'','1'),('21','\'2018_03_14_000000_add_details_to_data_types_table\'','1'),('22','\'2018_03_16_000000_make_settings_value_nullable\'','1'),('23','\'2019_08_19_000000_create_failed_jobs_table\'','1'),('24','\'2019_12_14_000001_create_personal_access_tokens_table\'','1');


INSERT INTO permissions(id,key,table_name,created_at,updated_at) VALUES('1','\'browse_admin\'','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('2','\'browse_bread\'','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('3','\'browse_database\'','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('4','\'browse_media\'','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('5','\'browse_compass\'','NULL','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('6','\'browse_menus\'','\'menus\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('7','\'read_menus\'','\'menus\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('8','\'edit_menus\'','\'menus\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('9','\'add_menus\'','\'menus\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('10','\'delete_menus\'','\'menus\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('11','\'browse_roles\'','\'roles\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('12','\'read_roles\'','\'roles\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('13','\'edit_roles\'','\'roles\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('14','\'add_roles\'','\'roles\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('15','\'delete_roles\'','\'roles\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('16','\'browse_users\'','\'users\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('17','\'read_users\'','\'users\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('18','\'edit_users\'','\'users\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('19','\'add_users\'','\'users\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('20','\'delete_users\'','\'users\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('21','\'browse_settings\'','\'settings\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('22','\'read_settings\'','\'settings\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('23','\'edit_settings\'','\'settings\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('24','\'add_settings\'','\'settings\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('25','\'delete_settings\'','\'settings\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('26','\'browse_jenis_buku\'','\'jenis_buku\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('27','\'read_jenis_buku\'','\'jenis_buku\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('28','\'edit_jenis_buku\'','\'jenis_buku\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('29','\'add_jenis_buku\'','\'jenis_buku\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('30','\'delete_jenis_buku\'','\'jenis_buku\'','\'2023-10-11 11:48:36\'','\'2023-10-11 11:48:36\''),('31','\'browse_buku\'','\'buku\'','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\''),('32','\'read_buku\'','\'buku\'','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\''),('33','\'edit_buku\'','\'buku\'','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\''),('34','\'add_buku\'','\'buku\'','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\''),('35','\'delete_buku\'','\'buku\'','\'2023-10-11 12:00:47\'','\'2023-10-11 12:00:47\''),('36','\'browse_kelas\'','\'kelas\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('37','\'read_kelas\'','\'kelas\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('38','\'edit_kelas\'','\'kelas\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('39','\'add_kelas\'','\'kelas\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('40','\'delete_kelas\'','\'kelas\'','\'2023-10-16 02:37:59\'','\'2023-10-16 02:37:59\''),('46','\'browse_siswa\'','\'siswa\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\''),('47','\'read_siswa\'','\'siswa\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\''),('48','\'edit_siswa\'','\'siswa\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\''),('49','\'add_siswa\'','\'siswa\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\''),('50','\'delete_siswa\'','\'siswa\'','\'2023-10-16 03:14:17\'','\'2023-10-16 03:14:17\''),('51','\'browse_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\''),('52','\'read_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\''),('53','\'edit_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\''),('54','\'add_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\''),('55','\'delete_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:34:59\'','\'2023-10-16 03:34:59\'');

INSERT INTO permission_role(permission_id,role_id) VALUES('1','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('10','1'),('11','1'),('12','1'),('13','1'),('14','1'),('15','1'),('16','1'),('17','1'),('18','1'),('19','1'),('20','1'),('21','1'),('22','1'),('23','1'),('24','1'),('25','1'),('26','1'),('26','3'),('27','1'),('27','3'),('28','1'),('28','3'),('29','1'),('29','3'),('30','1'),('30','3'),('31','1'),('31','3'),('32','1'),('32','3'),('33','1'),('33','3'),('34','1'),('34','3'),('35','1'),('35','3'),('36','1'),('36','3'),('37','1'),('37','3'),('38','1'),('38','3'),('39','1'),('39','3'),('40','1'),('40','3'),('46','1'),('47','1'),('48','1'),('49','1'),('50','1'),('51','1'),('51','3'),('52','1'),('52','3'),('53','1'),('53','3'),('54','1'),('54','3'),('55','1'),('55','3');


INSERT INTO roles(id,name,display_name,created_at,updated_at) VALUES('1','\'admin\'','\'Administrator\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('2','\'user\'','\'Normal User\'','\'2023-10-09 11:15:04\'','\'2023-10-09 11:15:04\''),('3','\'petugas\'','\'petugas\'','\'2023-10-16 03:41:45\'','\'2023-10-16 03:58:30\'');

INSERT INTO settings(id,key,display_name,value,details,type,order,group) VALUES('1','\'site.title\'','\'Site Title\'','X\'53697465205469746c65\'','X\'\'','\'text\'','1','\'Site\''),('2','\'site.description\'','\'Site Description\'','X\'53697465204465736372697074696f6e\'','X\'\'','\'text\'','2','\'Site\''),('3','\'site.logo\'','\'Site Logo\'','X\'\'','X\'\'','\'image\'','3','\'Site\''),('4','\'site.google_analytics_tracking_id\'','\'Google Analytics Tracking ID\'','X\'\'','X\'\'','\'text\'','4','\'Site\''),('5','\'admin.bg_image\'','\'Admin Background Image\'','X\'\'','X\'\'','\'image\'','5','\'Admin\''),('6','\'admin.title\'','\'Admin Title\'','X\'566f7961676572\'','X\'\'','\'text\'','1','\'Admin\''),('7','\'admin.description\'','\'Admin Description\'','X\'57656c636f6d6520746f20566f79616765722e20546865204d697373696e672041646d696e20666f72204c61726176656c\'','X\'\'','\'text\'','2','\'Admin\''),('8','\'admin.loader\'','\'Admin Loader\'','X\'\'','X\'\'','\'image\'','3','\'Admin\''),('9','\'admin.icon_image\'','\'Admin Icon Image\'','X\'\'','X\'\'','\'image\'','4','\'Admin\''),('10','\'admin.google_analytics_client_id\'','\'Google Analytics Client ID (used for admin dashboard)\'','X\'\'','X\'\'','\'text\'','1','\'Admin\'');

INSERT INTO siswa(id,kelas,nipd,nisn,nama_lengkap,alamat,status,tahun_masuk,tahun_lulus,kode_siswa,created_at,updated_at) VALUES('1','\'1\'','12345','\'12345\'','\'faiz rasyad\'','X\'6a6c2079756b\'','\'aktif\'','\'2023-10-16\'','\'2023-11-16\'','\'11929\'','\'2023-10-16 03:18:53\'','\'2023-10-16 03:18:53\''),('2','\'2\'','123456','\'123456\'','\'pak jo\'','X\'6a6c206b7579\'','\'aktif\'','\'2023-10-16\'','\'2023-10-16\'','\'11928\'','\'2023-10-16 03:20:51\'','\'2023-10-16 03:20:51\'');


INSERT INTO users(id,role_id,name,email,avatar,email_verified_at,password,remember_token,settings,created_at,updated_at) VALUES('2','1','\'admin\'','\'admin@faizrasyad.com\'','\'users/default.png\'','NULL','\'$2y$10$enfoXFu7LrbDP03kgmdvpuyNJjYTZ5fLtj.JHxw37ept9MaWW1llS\'','NULL','NULL','\'2023-10-11 11:34:39\'','\'2023-10-11 11:34:39\'');
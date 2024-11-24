-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 24 nov. 2024 à 19:56
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce-sql`
--
CREATE DATABASE IF NOT EXISTS `e-commerce-sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `e-commerce-sql`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `rue` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `region` varchar(100) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `user_id` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `id_utilisateur`, `rue`, `ville`, `region`, `code_postal`, `pays`) VALUES
(1, 8, '5897 Langworth Mountain', 'Lake Francis', NULL, '06888', 'Nauru'),
(2, 7, '151 Feil Manor Apt. 087', 'Madilynborough', NULL, '06090', 'Micronesia'),
(3, 8, '535 Alexis Glen', 'East Eugeniaside', NULL, '23076-4589', 'Poland'),
(4, 6, '3855 Giovanny Curve', 'West Jermaine', NULL, '26118', 'Brazil'),
(5, 1, '22756 Ivory Path Apt. 887', 'Dallasstad', NULL, '45857', 'Angola'),
(6, 10, '698 Ruecker Walks', 'South Tyriquefurt', NULL, '55067', 'Myanmar'),
(7, 4, '452 Andreanne Roads Suite 064', 'Morarbury', NULL, '06909', 'Saint Helena'),
(8, 7, '8914 Kiehn Dale Apt. 623', 'Destinyshire', NULL, '62293-1380', 'Zimbabwe'),
(9, 10, '2337 Lubowitz Throughway Suite 500', 'West Patience', NULL, '45510-3564', 'Kazakhstan'),
(10, 5, '4057 Tod Center', 'Zacharyborough', NULL, '23786', 'Norfolk Island');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `etat` varchar(50) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_commande`),
  KEY `user_id` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_utilisateur`, `etat`, `date_creation`) VALUES
(1, 6, 'En cours', '2024-10-20 12:37:31'),
(2, 4, 'En attente', '2024-04-08 18:01:18'),
(3, 3, 'En cours', '2024-01-13 13:21:37'),
(4, 6, 'En cours', '2024-08-02 20:23:40'),
(5, 9, 'En attente', '2024-02-14 15:39:35'),
(6, 1, 'En cours', '2024-09-04 10:44:04'),
(7, 9, 'En attente', '2024-11-14 07:36:11'),
(8, 3, 'En attente', '2024-10-16 13:04:52'),
(9, 1, 'En attente', '2024-09-02 13:24:04'),
(10, 10, 'En cours', '2024-08-17 06:50:03'),
(11, 9, 'En cours', '2024-01-19 14:06:45');

-- --------------------------------------------------------

--
-- Structure de la table `commande_article`
--

DROP TABLE IF EXISTS `commande_article`;
CREATE TABLE IF NOT EXISTS `commande_article` (
  `id_commande` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `product_id` (`id_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_evaluation` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `id_produit` int NOT NULL,
  `note` int DEFAULT NULL,
  `commentaire` text,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_evaluation`),
  KEY `user_id` (`id_utilisateur`),
  KEY `product_id` (`id_produit`)
) ;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id_evaluation`, `id_utilisateur`, `id_produit`, `note`, `commentaire`, `date_creation`) VALUES
(1, 2, 3, 1, 'Tenetur dolore exercitationem ut possimus voluptatum ut quaerat.', '2024-07-03 08:06:44'),
(2, 10, 7, 2, 'Dolores assumenda sunt reiciendis debitis sunt et unde vero.', '2024-07-07 21:53:02'),
(3, 1, 6, 5, 'Officia illum eligendi et qui.', '2024-09-21 13:31:47'),
(4, 6, 6, 1, 'Numquam nesciunt omnis fugit qui.', '2024-09-02 08:43:24'),
(5, 5, 1, 2, 'Odit voluptatem aliquid natus sed sapiente omnis dicta.', '2024-08-02 22:45:14'),
(6, 1, 8, 4, 'Possimus eius non amet autem id vitae veritatis.', '2024-03-04 16:44:41'),
(7, 7, 1, 1, 'Sit nam consectetur consequatur explicabo magnam ut est.', '2024-02-13 18:21:13'),
(8, 6, 4, 2, 'Dolor eaque nostrum ut quo porro rerum doloribus quis.', '2024-04-04 23:37:06'),
(9, 9, 2, 1, 'Voluptas voluptates velit recusandae minima.', '2024-01-21 19:07:48'),
(10, 9, 8, 4, 'Ut et delectus voluptatem nulla neque.', '2024-02-13 13:49:29'),
(11, 7, 9, 1, 'Distinctio et ratione quae eos.', '2024-02-25 02:44:26');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_facture` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `id_commande` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date_emission` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_facture`),
  KEY `user_id` (`id_utilisateur`),
  KEY `command_id` (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `id_utilisateur`, `id_commande`, `total`, `date_emission`) VALUES
(1, 5, 6, 494.05, '2024-05-21 01:26:39'),
(2, 7, 1, 335.82, '2024-07-20 04:45:19'),
(3, 6, 9, 734.70, '2024-02-24 06:53:05'),
(4, 7, 2, 330.87, '2024-04-05 06:01:44'),
(5, 4, 10, 35.56, '2024-11-09 06:47:04'),
(6, 1, 7, 946.87, '2024-05-30 02:29:50'),
(7, 3, 1, 858.09, '2024-02-25 22:43:26'),
(8, 4, 9, 366.85, '2024-11-11 11:53:46'),
(9, 3, 10, 244.74, '2024-04-03 22:07:40'),
(10, 1, 7, 162.21, '2024-02-14 08:20:45'),
(11, 2, 4, 896.23, '2024-10-20 10:25:43');

-- --------------------------------------------------------

--
-- Structure de la table `moyen_paiement`
--

DROP TABLE IF EXISTS `moyen_paiement`;
CREATE TABLE IF NOT EXISTS `moyen_paiement` (
  `id_paiement` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `methode` varchar(50) NOT NULL,
  `numero_carte` varchar(50) NOT NULL,
  `iban` varchar(34) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paiement`),
  KEY `user_id` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `moyen_paiement`
--

INSERT INTO `moyen_paiement` (`id_paiement`, `id_utilisateur`, `methode`, `numero_carte`, `iban`, `date_creation`) VALUES
(1, 6, 'PayPal', '373498841731487', 'FR52101096882140797739HB621', '2024-11-24 19:44:43'),
(2, 10, 'Carte bancaire', '3589634544337321', 'FR786100370391ERA85N63K9744', '2024-11-24 19:45:34'),
(3, 4, 'Carte bancaire', '2720484545036379', 'FR151316737913R9T45C29ZJZ84', '2024-11-24 19:45:34'),
(4, 3, 'Carte bancaire', '2667178146356724', 'FR363569244139153HU732VS235', '2024-11-24 19:45:34'),
(5, 2, 'Carte bancaire', '3528238416036252', 'FR820704818563C7F5QOH1G5B34', '2024-11-24 19:45:34'),
(6, 3, 'Virement bancaire', '4556286417255515', 'FR97781598306693AAI65JKR660', '2024-11-24 19:45:34'),
(7, 8, 'Virement bancaire', '4929102516476292', 'FR58084234032894L9039I5R182', '2024-11-24 19:45:34'),
(8, 10, 'PayPal', '6011887249119482', 'FR6522086653009Z8333W3T4136', '2024-11-24 19:45:34'),
(9, 5, 'PayPal', '4485297909003', 'FR784664789090J4034213VF514', '2024-11-24 19:45:34'),
(10, 8, 'Virement bancaire', '6011468890273264', 'FR345752055737RD3ENGYT4L979', '2024-11-24 19:45:34'),
(11, 5, 'PayPal', '4916262118118000', 'FR421679632820FWD70KMR68Q23', '2024-11-24 19:45:34');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_panier`),
  KEY `user_id` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `id_utilisateur`, `date_creation`) VALUES
(1, 9, '2024-11-24 19:45:43'),
(2, 8, '2024-11-24 19:46:28'),
(3, 3, '2024-11-24 19:46:28'),
(4, 7, '2024-11-24 19:46:28'),
(5, 2, '2024-11-24 19:46:28'),
(6, 7, '2024-11-24 19:46:28'),
(7, 5, '2024-11-24 19:46:28'),
(8, 9, '2024-11-24 19:46:28'),
(9, 2, '2024-11-24 19:46:28'),
(10, 2, '2024-11-24 19:46:28'),
(11, 5, '2024-11-24 19:46:28');

-- --------------------------------------------------------

--
-- Structure de la table `panier_article`
--

DROP TABLE IF EXISTS `panier_article`;
CREATE TABLE IF NOT EXISTS `panier_article` (
  `id_panier` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_panier`,`id_produit`),
  KEY `product_id` (`id_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_photo`),
  KEY `user_id` (`id_utilisateur`),
  KEY `product_id` (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id_photo`, `id_utilisateur`, `id_produit`, `url`, `created_at`) VALUES
(1, 6, 2, 'https://via.placeholder.com/640x480.png/0055cc?text=products+facilis', '2024-11-24 19:46:34'),
(2, 8, 7, 'https://via.placeholder.com/640x480.png/0099aa?text=products+ut', '2024-11-24 19:47:30'),
(3, 7, 6, 'https://via.placeholder.com/640x480.png/001177?text=products+dolores', '2024-11-24 19:47:30'),
(4, 5, 3, 'https://via.placeholder.com/640x480.png/0000dd?text=products+sunt', '2024-11-24 19:47:30'),
(5, 7, 7, 'https://via.placeholder.com/640x480.png/00ccff?text=products+atque', '2024-11-24 19:47:30'),
(6, 2, 6, 'https://via.placeholder.com/640x480.png/00ccdd?text=products+et', '2024-11-24 19:47:30'),
(7, 1, 4, 'https://via.placeholder.com/640x480.png/00bbbb?text=products+iste', '2024-11-24 19:47:30'),
(8, 4, 3, 'https://via.placeholder.com/640x480.png/0077cc?text=products+accusantium', '2024-11-24 19:47:30'),
(9, 4, 8, 'https://via.placeholder.com/640x480.png/00eedd?text=products+et', '2024-11-24 19:47:30'),
(10, 2, 4, 'https://via.placeholder.com/640x480.png/00cc44?text=products+aut', '2024-11-24 19:47:30'),
(11, 3, 10, 'https://via.placeholder.com/640x480.png/007788?text=products+ex', '2024-11-24 19:47:30');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text,
  `prix` decimal(10,2) NOT NULL,
  `quantite_stock` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom`, `description`, `prix`, `quantite_stock`, `created_at`) VALUES
(1, 'suscipit', 'Voluptatem molestias harum debitis qui velit facilis deserunt a. Quod sed et officiis consequatur voluptatem sunt quod. Voluptatem esse consequatur ea saepe. Aut libero magni ut a non nobis fuga.', 77.52, 92, '2024-01-24 00:22:07'),
(2, 'et', 'Quidem hic consequatur aut sit error molestiae. Voluptas eum possimus recusandae. Fugit ratione impedit autem sapiente architecto. Velit provident deserunt beatae quidem aut veritatis minus dolores.', 903.13, 14, '2024-06-26 07:14:14'),
(3, 'sequi', 'Consequatur fugit quis assumenda sit aut suscipit et. Qui excepturi incidunt voluptatum vel consequatur et. Mollitia ullam soluta illo totam et cumque ea laudantium.', 620.00, 58, '2024-09-24 15:12:01'),
(4, 'et', 'Quae voluptates eveniet fugit voluptates totam vero. Tenetur voluptas incidunt sit praesentium minus deserunt. Autem consequatur ut eum dignissimos fugit neque.', 910.75, 54, '2024-01-23 19:07:27'),
(5, 'quidem', 'Animi alias est dolore necessitatibus. A exercitationem voluptatem necessitatibus. Distinctio et aut sit mollitia eos.', 62.55, 20, '2024-03-25 01:35:27'),
(6, 'voluptas', 'Eos et omnis tenetur aperiam accusamus. Deserunt facilis non non provident qui quisquam rerum. Distinctio laudantium dolor odio eaque.', 283.60, 53, '2024-08-02 06:58:46'),
(7, 'ipsum', 'Eius qui dolor aut voluptatem nisi veritatis odit cum. Corporis et soluta dolorem eos numquam quis enim. Voluptatum nulla hic ullam id minus aliquid vitae.', 45.50, 72, '2024-09-08 03:46:09'),
(8, 'et', 'Et expedita temporibus aut voluptatem. Ut aut accusantium voluptas optio et earum. Omnis enim ipsum quo molestiae.', 843.77, 13, '2024-03-14 09:10:57'),
(9, 'velit', 'Aut error cum ut architecto dolorum. Vitae molestiae est omnis earum. Quos ut quos debitis impedit.', 519.83, 47, '2024-08-14 00:03:23'),
(10, 'quia', 'In impedit dignissimos aut ipsam quidem ratione et consequatur. Eveniet dolore aut est quaerat qui exercitationem. Voluptatum neque dolore similique voluptas.', 970.20, 81, '2024-11-15 08:22:28'),
(11, 'a', 'Minima officiis maxime et ut. Excepturi quidem qui sit. Esse nesciunt delectus ipsum est. Dolores consequuntur aspernatur sit consequuntur ut sit.', 304.88, 20, '2024-02-11 04:31:22');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `prenom`, `nom`, `email`, `mot_de_passe`, `telephone`, `date_creation`) VALUES
(1, 'Verla', 'Mraz', 'selmer86@treutel.net', '$2y$10$XiXBhN7o6O7sgDotY46APuB7Y9BUuN3sKqfCPAN0nCUBBzZWdxXh.', '(907) 337-9064', '2024-11-24 19:52:19'),
(2, 'Jace', 'Herzog', 'coy86@hotmail.com', '$2y$10$OBIgAuyi5OlxwneRPLgEqeW8lobZiJJiTIcs7tMLylpDyQyDF3thW', '+1.865.912.0488', '2024-11-24 19:52:50'),
(3, 'Frederick', 'Weimann', 'lavina.quitzon@yahoo.com', '$2y$10$junbP./B6YZ2W8Y1Jb7XJuFYgQkvQNHNdB2Sd0S0YAidNvkN0ifVe', '765.748.8458', '2024-11-24 19:52:50'),
(4, 'Ben', 'Simonis', 'eve36@hotmail.com', '$2y$10$VuFrTucg2s5EUoArsZq/S.cxFleDetLhKluM9wnj8J1upZ8CzRjC2', '1-862-875-1546', '2024-11-24 19:52:50'),
(5, 'Mya', 'Howell', 'fquitzon@mraz.com', '$2y$10$bjFgGlr0DubLRJpJoxNNfexkDsa54nX8ZgsMz/3/CmAefg2RTBtrO', '+1.380.289.7565', '2024-11-24 19:52:51'),
(6, 'Justyn', 'Buckridge', 'malika75@hotmail.com', '$2y$10$23c4Y7cgWPQ4xBNl/44CYOGR3XULkOGbjKZgKlZvzhOj0Zd6oLlv2', '1-424-546-0460', '2024-11-24 19:52:51'),
(7, 'Ova', 'Schuster', 'leannon.vicky@yahoo.com', '$2y$10$q8fkbPuTzUyUB6GzGWDUNerGlqyjwz7M3cP/D4nEwEdwjL3v1YvDm', '1-878-335-4415', '2024-11-24 19:52:51'),
(8, 'Mathew', 'Predovic', 'zack04@predovic.info', '$2y$10$uK53KRg9p0snUw9/zoJeFOfg38QLrTw6htD/qrE/NnF6gPtOK3M96', '240-362-8631', '2024-11-24 19:52:51'),
(9, 'Sean', 'Leuschke', 'modesto90@yahoo.com', '$2y$10$NsJfeHLVot2r1cP.SeytZ.vvWdclreSwF5jiyTP578GHA/cyJrjVC', '1-283-575-9658', '2024-11-24 19:52:51'),
(10, 'Kailey', 'Carter', 'arnold.shanahan@grady.com', '$2y$10$P/gRdBFQqTRX5yCX69ovy.QibVfapBJF0XIJDbSBopnvLtUJ2wXOm', '+1 (352) 272-85', '2024-11-24 19:52:51'),
(11, 'Francisca', 'O\'Hara', 'zakary.armstrong@williamson.biz', '$2y$10$Gu18z.ewOdFXEtkIpSuJ2OqYU9i6Eyd87Us0r54EQC7Y9oDFFUjiW', '(531) 998-1270', '2024-11-24 19:52:51');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2025 at 12:33 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unisphere`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id_article` int NOT NULL,
  `date` date NOT NULL,
  `titre` varchar(30) DEFAULT NULL,
  `contenu` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `atl_annonces`
--

CREATE TABLE `atl_annonces` (
  `annonce_id` int NOT NULL,
  `conducteur_id` int DEFAULT NULL,
  `depart` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `date_heure` datetime DEFAULT NULL,
  `places_disponibles` int DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `statut` enum('ouverte','fermée','annulée') DEFAULT 'ouverte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atl_evaluations`
--

CREATE TABLE `atl_evaluations` (
  `evaluation_id` int NOT NULL,
  `conducteur_id` int DEFAULT NULL,
  `auteur_id` int DEFAULT NULL,
  `note` int DEFAULT NULL,
  `commentaire` text,
  `date_evaluation` datetime DEFAULT CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `atl_passagers_par_annonce`
--

CREATE TABLE `atl_passagers_par_annonce` (
  `id` int NOT NULL,
  `annonce_id` int DEFAULT NULL,
  `passager_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atl_reservations`
--

CREATE TABLE `atl_reservations` (
  `reservation_id` int NOT NULL,
  `annonce_id` int DEFAULT NULL,
  `passager_id` int DEFAULT NULL,
  `statut` enum('en attente','confirmée','annulée') DEFAULT 'en attente',
  `date_reservation` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atl_trajets`
--

CREATE TABLE `atl_trajets` (
  `trajet_id` int NOT NULL,
  `annonce_id` int DEFAULT NULL,
  `conducteur_id` int DEFAULT NULL,
  `passager_id` int DEFAULT NULL,
  `date_effective` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bel_activites`
--

CREATE TABLE `bel_activites` (
  `id_activite` int NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text,
  `lieu` varchar(150) DEFAULT NULL,
  `date` datetime NOT NULL,
  `capacite` int DEFAULT NULL,
  `statut` enum('ouverte','complète','annulée') DEFAULT 'ouverte',
  `organisateur_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bel_activites`
--

INSERT INTO `bel_activites` (`id_activite`, `titre`, `description`, `lieu`, `date`, `capacite`, `statut`, `organisateur_id`) VALUES
(1, 'Atelier Peinture', 'Atelier créatif de peinture sur toile', 'Salle A1', '2025-04-10 14:00:00', 20, 'ouverte', 1),
(2, 'Cours de Yoga', 'Session de yoga pour débutants', 'Salle B2', '2025-04-12 10:00:00', 15, 'ouverte', 2),
(3, 'Escape Game', 'Jeu d\'évasion en équipe', 'Salle C3', '2025-04-15 18:00:00', 8, 'ouverte', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bel_reservations`
--

CREATE TABLE `bel_reservations` (
  `id_reservation` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `activite_id` int NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` enum('confirmée','annulée') DEFAULT 'confirmée'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bel_reservations`
--

INSERT INTO `bel_reservations` (`id_reservation`, `utilisateur_id`, `activite_id`, `date`, `statut`) VALUES
(2, 2, 2, '2025-03-26 11:00:00', 'confirmée'),
(6, 4, 1, '2025-04-09 00:59:39', 'confirmée'),
(8, 4, 2, '2025-04-09 01:00:31', 'confirmée'),
(9, 1, 3, '2025-04-09 01:00:49', 'confirmée'),
(10, 7, 1, '2025-04-09 01:02:22', 'confirmée');

-- --------------------------------------------------------

--
-- Table structure for table `cap_activity_log`
--

CREATE TABLE `cap_activity_log` (
  `id` int NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cap_activity_log`
--

INSERT INTO `cap_activity_log` (`id`, `activity_type`, `details`, `created_at`) VALUES
(1, 'Post Created', 'Post ID: 1, User ID: 1', '2025-01-06 14:05:11'),
(2, 'Like Added', 'Post ID: 1, User ID: 2', '2025-01-06 14:06:33'),
(3, 'Post Created', 'Post ID: 2, User ID: 2', '2025-01-06 14:06:37'),
(4, 'Post Created', 'Post ID: 3, User ID: 2', '2025-01-06 14:07:25'),
(5, 'Like Added', 'Post ID: 3, User ID: 1', '2025-02-03 13:44:55'),
(6, 'Post Created', 'Post ID: 4, User ID: 1', '2025-02-04 13:08:25'),
(7, 'Like Added', 'Post ID: 1, User ID: 1', '2025-02-04 13:08:30'),
(8, 'Subscription Added', 'Subscriber ID: 1, Subscribed To ID: 2', '2025-02-04 14:36:27'),
(9, 'Post Created', 'Post ID: 5, User ID: 5', '2025-02-04 14:37:48'),
(10, 'Subscription Added', 'Subscriber ID: 5, Subscribed To ID: 2', '2025-02-04 14:37:53'),
(11, 'Like Added', 'Post ID: 3, User ID: 5', '2025-02-04 14:42:12'),
(12, 'Like Added', 'Post ID: 1, User ID: 5', '2025-02-04 14:42:15'),
(13, 'Subscription Added', 'Subscriber ID: 5, Subscribed To ID: 1', '2025-02-04 14:42:25'),
(14, 'Subscription Added', 'Subscriber ID: 1, Subscribed To ID: 5', '2025-02-04 15:01:08'),
(15, 'Post Created', 'Post ID: 6, User ID: 6', '2025-02-04 15:07:48'),
(16, 'Like Added', 'Post ID: 5, User ID: 6', '2025-02-04 15:07:51'),
(17, 'Post Created', 'Post ID: 7, User ID: 6', '2025-02-04 15:07:56'),
(18, 'Post Created', 'Post ID: 8, User ID: 6', '2025-02-04 15:08:03'),
(19, 'Subscription Added', 'Subscriber ID: 6, Subscribed To ID: 5', '2025-02-04 15:08:06'),
(20, 'Subscription Removed', 'Subscriber ID: 6, Subscribed To ID: 5', '2025-02-04 15:08:08'),
(21, 'Subscription Added', 'Subscriber ID: 6, Subscribed To ID: 5', '2025-02-04 15:08:13'),
(22, 'Subscription Added', 'Subscriber ID: 6, Subscribed To ID: 1', '2025-02-04 15:08:15'),
(23, 'Like Added', 'Post ID: 3, User ID: 6', '2025-02-04 15:08:29'),
(24, 'Post Created', 'Post ID: 9, User ID: 1', '2025-02-04 15:11:08'),
(25, 'Like Added', 'Post ID: 6, User ID: 5', '2025-02-04 15:11:23'),
(26, 'Post Created', 'Post ID: 10, User ID: 1', '2025-02-04 15:18:16'),
(27, 'Post Created', 'Post ID: 11, User ID: 1', '2025-02-05 08:46:23'),
(28, 'Post Created', 'Post ID: 12, User ID: 1', '2025-02-19 13:59:27'),
(29, 'Post Created', 'Post ID: 13, User ID: 1', '2025-02-19 13:59:32'),
(30, 'Like Added', 'Post ID: 12, User ID: 1', '2025-02-19 13:59:35'),
(31, 'Subscription Added', 'Subscriber ID: 1, Subscribed To ID: 6', '2025-02-19 13:59:50'),
(32, 'Like Added', 'Post ID: 12, User ID: 7', '2025-02-19 14:02:23'),
(33, 'Subscription Added', 'Subscriber ID: 7, Subscribed To ID: 1', '2025-02-19 14:02:24'),
(34, 'Post Created', 'Post ID: 14, User ID: 7', '2025-02-19 14:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `cap_like`
--

CREATE TABLE `cap_like` (
  `id_post` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cap_like`
--

INSERT INTO `cap_like` (`id_post`, `user_id`, `post_id`) VALUES
(2, 1, 3),
(4, 5, 3),
(6, 6, 5),
(7, 6, 3),
(8, 5, 6),
(9, 1, 12);

--
-- Triggers `cap_like`
--
DELIMITER $$
CREATE TRIGGER `after_like_insert` AFTER INSERT ON `cap_like` FOR EACH ROW BEGIN
    INSERT INTO cap_activity_log (activity_type, details)
    VALUES ('Like Added', CONCAT('Post ID: ', NEW.post_id, ', User ID: ', NEW.user_id));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_like_insert` BEFORE INSERT ON `cap_like` FOR EACH ROW BEGIN
    DECLARE like_exists INT;
    SELECT COUNT(*) INTO like_exists
    FROM cap_like
    WHERE user_id = NEW.user_id AND post_id = NEW.post_id;

    IF like_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User cannot like the same post multiple times';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cap_post`
--

CREATE TABLE `cap_post` (
  `id_post` int NOT NULL,
  `contenu` text NOT NULL,
  `post_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cap_post`
--

INSERT INTO `cap_post` (`id_post`, `contenu`, `post_id`, `user_id`, `CreatedAt`) VALUES
(3, '2026 bitcoin 200k tkt', NULL, 2, '2025-01-06 13:07:26'),
(4, 'ok', NULL, 1, '2025-02-04 12:08:26'),
(5, 'BO6 > MV3', NULL, 5, '2025-02-04 13:37:49'),
(6, 'GTA 6 en Q4 2025', NULL, 6, '2025-02-04 14:07:48'),
(7, 'de fou', 5, 6, '2025-02-04 14:07:57'),
(9, 'jamais', 6, 1, '2025-02-04 14:11:08'),
(10, 'mdr ok', 3, 1, '2025-02-04 14:18:16'),
(12, 'test', NULL, 1, '2025-02-19 12:59:27'),
(14, 'bonsoir', 12, 7, '2025-02-19 13:02:37');

--
-- Triggers `cap_post`
--
DELIMITER $$
CREATE TRIGGER `after_post_delete` AFTER DELETE ON `cap_post` FOR EACH ROW BEGIN
    DELETE FROM cap_like WHERE post_id = OLD.id_post;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_post_insert` AFTER INSERT ON `cap_post` FOR EACH ROW BEGIN
    INSERT INTO cap_activity_log (activity_type, details)
    VALUES ('Post Created', CONCAT('Post ID: ', NEW.id_post, ', User ID: ', NEW.user_id));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cap_subscription`
--

CREATE TABLE `cap_subscription` (
  `id` int NOT NULL,
  `subscriber_id` int NOT NULL,
  `subscribed_to_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cap_subscription`
--

INSERT INTO `cap_subscription` (`id`, `subscriber_id`, `subscribed_to_id`, `created_at`) VALUES
(1, 1, 2, '2025-02-04 14:36:27'),
(2, 5, 2, '2025-02-04 14:37:53'),
(3, 5, 1, '2025-02-04 14:42:25'),
(4, 1, 5, '2025-02-04 15:01:08'),
(6, 6, 5, '2025-02-04 15:08:13'),
(7, 6, 1, '2025-02-04 15:08:15'),
(8, 1, 6, '2025-02-19 13:59:50'),
(9, 7, 1, '2025-02-19 14:02:24');

--
-- Triggers `cap_subscription`
--
DELIMITER $$
CREATE TRIGGER `after_subscription_delete` AFTER DELETE ON `cap_subscription` FOR EACH ROW BEGIN
    INSERT INTO cap_activity_log (activity_type, details)
    VALUES ('Subscription Removed', CONCAT('Subscriber ID: ', OLD.subscriber_id, ', Subscribed To ID: ', OLD.subscribed_to_id));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_subscription_insert` AFTER INSERT ON `cap_subscription` FOR EACH ROW BEGIN
    INSERT INTO cap_activity_log (activity_type, details)
    VALUES ('Subscription Added', CONCAT('Subscriber ID: ', NEW.subscriber_id, ', Subscribed To ID: ', NEW.subscribed_to_id));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pol_categorie`
--

CREATE TABLE `pol_categorie` (
  `id_categorie` int NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pol_categorie`
--

INSERT INTO `pol_categorie` (`id_categorie`, `nom`) VALUES
(1, 'Support Technique'),
(2, 'Bug'),
(3, 'Demande de Fonctionnalité'),
(4, 'Question Générale'),
(5, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `pol_reponse_ticket`
--

CREATE TABLE `pol_reponse_ticket` (
  `id_reponse` int NOT NULL,
  `date_reponse` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contenu` text NOT NULL,
  `user_id` int NOT NULL,
  `ticket_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pol_reponse_ticket`
--

INSERT INTO `pol_reponse_ticket` (`id_reponse`, `date_reponse`, `contenu`, `user_id`, `ticket_id`) VALUES
(1, '2024-11-27 10:59:18', 'test', 1, 2),
(2, '2024-11-27 12:52:07', 'test2', 1, 2),
(3, '2024-11-27 12:54:05', 'azerty', 1, 3),
(4, '2024-11-27 12:54:12', 'azerty2', 1, 3),
(5, '2024-11-27 12:54:18', 'test', 1, 4),
(6, '2024-11-27 13:04:00', 'test', 2, 3),
(7, '2024-11-27 13:04:25', 'Lorem Ipsum est un générateur de faux textes aléatoires. Vous choisissez le nombre de paragraphes, de mots ou de listes. Vous obtenez alors un texte aléatoire', 2, 3),
(8, '2024-11-27 13:07:09', 'ok', 1, 3),
(10, '2024-11-27 13:17:11', 'ok', 2, 2),
(12, '2024-11-27 14:01:05', 'test', 1, 2),
(13, '2024-11-27 14:01:17', 'test', 2, 3),
(20, '2024-12-11 16:36:42', 'à l\'aide', 6, 17),
(21, '2024-12-11 16:37:00', 'ok', 1, 17),
(24, '2024-12-18 14:38:47', 'test', 1, 17),
(27, '2025-01-08 17:21:51', 'marche pas', 1, 21),
(28, '2025-01-08 17:25:25', 'A l\'aide', 6, 22),
(29, '2025-01-08 17:25:49', 'Merci de patienter', 1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `pol_ticket`
--

CREATE TABLE `pol_ticket` (
  `id_ticket` int NOT NULL,
  `date_creation` datetime NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `description` text,
  `statut` enum('ouvert','fermé') DEFAULT 'ouvert',
  `user_id` int NOT NULL,
  `categorie_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pol_ticket`
--

INSERT INTO `pol_ticket` (`id_ticket`, `date_creation`, `sujet`, `description`, `statut`, `user_id`, `categorie_id`) VALUES
(2, '2024-11-25 16:29:35', 'Erreur système', 'Un message d’erreur s’affiche lorsque j’essaie de sauvegarder mes modifications.', 'ouvert', 1, 3),
(3, '2024-11-25 16:29:35', 'Problème de paiement', 'Le paiement par carte bancaire échoue sur la page de commande.', 'ouvert', 1, 4),
(4, '2024-11-25 16:29:35', 'Demande d’assistance', 'Je souhaite être aidé pour configurer mon profil utilisateur.', 'fermé', 1, 1),
(5, '2024-11-25 16:29:35', 'Suggestion d’amélioration', 'Serait-il possible d’ajouter un mode sombre à l’application ?', 'ouvert', 1, 5),
(6, '2024-11-25 16:29:35', 'Bug d’affichage', 'Certains textes ne s’affichent pas correctement sur mobile.', 'ouvert', 1, 3),
(17, '2024-12-11 15:36:35', 'Probleme PC', 'PC HS', 'ouvert', 6, 1),
(21, '2025-01-08 16:21:39', 'Problème de connexion sur Capella', 'Connexion HS', 'ouvert', 1, 1),
(22, '2025-01-08 16:25:17', 'Probleme PC', 'PC HS', 'ouvert', 6, 1);

--
-- Triggers `pol_ticket`
--
DELIMITER $$
CREATE TRIGGER `delete_reponses_on_ticket_delete` AFTER DELETE ON `pol_ticket` FOR EACH ROW BEGIN
  DELETE FROM `POL_reponse_ticket` WHERE `ticket_id` = OLD.id_ticket;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role_name`) VALUES
(1, 'etudiant'),
(2, 'admin'),
(3, 'super_admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `etablissement` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT '1',
  `token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `etablissement`, `email`, `mdp`, `role_id`, `token`) VALUES
(1, 'Guerrand', 'Anthony', 'iris', 'anthony.guerrand92@gmail.com', 'root', 3, '43b0f964e7fd6beeda62872cb83038047c3f24147af5742b95b4a3b1dcfdbb75'),
(2, 'LOL', 'Alex', 'iris', 'fqf@gmail.com', 'root', 1, NULL),
(3, 'Pito', 'Jean', 'epita', 'jp@free.fr', 'root', 1, '572229f4935bfa564ca85bd83c0fd2aa2c46c3a5868f8bd156d198feacaea170'),
(4, 'alves', 'helder', 'iris', 'h@gmail.com', '123', 1, 'b4ce7108a42865b83cddc2890baaefe6b235a6abada696f107c7122f558658b6'),
(5, 'Guillaume ', 'Jean-marc', 'iris', 'a@gmail.com', '123456', 1, NULL),
(6, 'Dah', 'Jerome', 'iris', 'user@gmail.com', 'root', 1, NULL),
(7, 'toto', 'ayu', 'essec', 'aa@gmail.com', 'root', 1, 'ed67b9023515606548bf8bea2925d5007dc91e93fdf8ad16c17ade97df2dda08');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `before_user_delete` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
  -- Mettre le champ `user_id` à NULL pour les articles de l'utilisateur supprimé
  UPDATE `article`
  SET `user_id` = NULL
  WHERE `user_id` = OLD.id_user;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_email_before_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  DECLARE email_count INT;

  -- Vérifier si l'email existe déjà dans la table `user`
  SELECT COUNT(*)
  INTO email_count
  FROM `user`
  WHERE `email` = NEW.email;

  -- Si l'email existe déjà, lever une exception
  IF email_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cet email est déjà utilisé.';
  END IF;
  
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_user_logs` AFTER DELETE ON `user` FOR EACH ROW BEGIN
  -- Supprimer les logs associés à l'utilisateur supprimé
  DELETE FROM user_log
  WHERE user_id = OLD.id_user;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sub_before_user_delete` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
    -- Supprimer les abonnements où l'utilisateur est abonné à d'autres
    DELETE FROM `cap_subscription` WHERE `subscriber_id` = OLD.id_user;

    -- Supprimer les abonnements où l'utilisateur est suivi par d'autres
    DELETE FROM `cap_subscription` WHERE `subscribed_to_id` = OLD.id_user;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id_log` int NOT NULL,
  `date` datetime NOT NULL,
  `action` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id_log`, `date`, `action`, `description`, `ip_address`, `user_agent`, `user_id`) VALUES
(1, '2024-11-25 16:25:27', 'inscription', 'Nouvelle inscription pour l\'utilisateur: anthony.guerrand92@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(2, '2024-11-25 16:25:31', 'connexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1),
(3, '2024-11-26 15:10:55', 'connexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1),
(4, '2024-11-26 15:11:07', 'deconnexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1),
(5, '2024-11-26 15:41:56', 'inscription', 'Nouvelle inscription pour l\'utilisateur: fqf@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(6, '2024-11-26 15:42:01', 'connexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 2),
(7, '2024-11-27 14:20:22', 'inscription', 'Nouvelle inscription pour l\'utilisateur: jp@free.fr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(8, '2024-11-27 14:20:28', 'connexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 3),
(9, '2024-11-27 14:29:39', 'deconnexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 3),
(10, '2024-11-27 14:31:18', 'connexion', '', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 1),
(11, '2024-11-27 17:16:40', 'inscription', 'Nouvelle inscription pour l\'utilisateur: h@gmail.com', '10.0.221.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(12, '2024-11-27 17:16:46', 'connexion', '', '10.0.221.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 4),
(13, '2024-11-27 17:17:56', 'inscription', 'Nouvelle inscription pour l\'utilisateur: a@gmail.com', '10.0.221.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(14, '2024-11-27 17:18:03', 'connexion', '', '10.0.221.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 5),
(15, '2024-12-11 16:36:07', 'inscription', 'Nouvelle inscription pour l\'utilisateur: user@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL),
(16, '2025-02-19 15:01:15', 'inscription', 'Nouvelle inscription pour l\'utilisateur: aa@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `atl_annonces`
--
ALTER TABLE `atl_annonces`
  ADD PRIMARY KEY (`annonce_id`),
  ADD KEY `conducteur_id` (`conducteur_id`);

--
-- Indexes for table `atl_evaluations`
--
ALTER TABLE `atl_evaluations`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `conducteur_id` (`conducteur_id`),
  ADD KEY `auteur_id` (`auteur_id`);

--
-- Indexes for table `atl_passagers_par_annonce`
--
ALTER TABLE `atl_passagers_par_annonce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annonce_id` (`annonce_id`),
  ADD KEY `passager_id` (`passager_id`);

--
-- Indexes for table `atl_reservations`
--
ALTER TABLE `atl_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `annonce_id` (`annonce_id`),
  ADD KEY `passager_id` (`passager_id`);

--
-- Indexes for table `atl_trajets`
--
ALTER TABLE `atl_trajets`
  ADD PRIMARY KEY (`trajet_id`),
  ADD KEY `annonce_id` (`annonce_id`),
  ADD KEY `conducteur_id` (`conducteur_id`),
  ADD KEY `passager_id` (`passager_id`);

--
-- Indexes for table `bel_activites`
--
ALTER TABLE `bel_activites`
  ADD PRIMARY KEY (`id_activite`);

--
-- Indexes for table `bel_reservations`
--
ALTER TABLE `bel_reservations`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `activite_id` (`activite_id`);

--
-- Indexes for table `cap_activity_log`
--
ALTER TABLE `cap_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_like`
--
ALTER TABLE `cap_like`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `cap_post`
--
ALTER TABLE `cap_post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cap_subscription`
--
ALTER TABLE `cap_subscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriber_to_unique` (`subscriber_id`,`subscribed_to_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `subscribed_to_id` (`subscribed_to_id`);

--
-- Indexes for table `pol_categorie`
--
ALTER TABLE `pol_categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `pol_reponse_ticket`
--
ALTER TABLE `pol_reponse_ticket`
  ADD PRIMARY KEY (`id_reponse`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `pol_ticket`
--
ALTER TABLE `pol_ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atl_annonces`
--
ALTER TABLE `atl_annonces`
  MODIFY `annonce_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atl_evaluations`
--
ALTER TABLE `atl_evaluations`
  MODIFY `evaluation_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atl_passagers_par_annonce`
--
ALTER TABLE `atl_passagers_par_annonce`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atl_reservations`
--
ALTER TABLE `atl_reservations`
  MODIFY `reservation_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atl_trajets`
--
ALTER TABLE `atl_trajets`
  MODIFY `trajet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bel_activites`
--
ALTER TABLE `bel_activites`
  MODIFY `id_activite` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bel_reservations`
--
ALTER TABLE `bel_reservations`
  MODIFY `id_reservation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cap_activity_log`
--
ALTER TABLE `cap_activity_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cap_like`
--
ALTER TABLE `cap_like`
  MODIFY `id_post` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cap_post`
--
ALTER TABLE `cap_post`
  MODIFY `id_post` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cap_subscription`
--
ALTER TABLE `cap_subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pol_categorie`
--
ALTER TABLE `pol_categorie`
  MODIFY `id_categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pol_reponse_ticket`
--
ALTER TABLE `pol_reponse_ticket`
  MODIFY `id_reponse` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pol_ticket`
--
ALTER TABLE `pol_ticket`
  MODIFY `id_ticket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atl_annonces`
--
ALTER TABLE `atl_annonces`
  ADD CONSTRAINT `atl_annonces_ibfk_1` FOREIGN KEY (`conducteur_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atl_evaluations`
--
ALTER TABLE `atl_evaluations`
  ADD CONSTRAINT `atl_evaluations_ibfk_1` FOREIGN KEY (`conducteur_id`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `atl_evaluations_ibfk_2` FOREIGN KEY (`auteur_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atl_passagers_par_annonce`
--
ALTER TABLE `atl_passagers_par_annonce`
  ADD CONSTRAINT `atl_passagers_par_annonce_ibfk_1` FOREIGN KEY (`annonce_id`) REFERENCES `atl_annonces` (`annonce_id`),
  ADD CONSTRAINT `atl_passagers_par_annonce_ibfk_2` FOREIGN KEY (`passager_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atl_reservations`
--
ALTER TABLE `atl_reservations`
  ADD CONSTRAINT `atl_reservations_ibfk_1` FOREIGN KEY (`annonce_id`) REFERENCES `atl_annonces` (`annonce_id`),
  ADD CONSTRAINT `atl_reservations_ibfk_2` FOREIGN KEY (`passager_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atl_trajets`
--
ALTER TABLE `atl_trajets`
  ADD CONSTRAINT `atl_trajets_ibfk_1` FOREIGN KEY (`annonce_id`) REFERENCES `atl_annonces` (`annonce_id`),
  ADD CONSTRAINT `atl_trajets_ibfk_2` FOREIGN KEY (`conducteur_id`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `atl_trajets_ibfk_3` FOREIGN KEY (`passager_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `bel_reservations`
--
ALTER TABLE `bel_reservations`
  ADD CONSTRAINT `bel_reservations_ibfk_1` FOREIGN KEY (`activite_id`) REFERENCES `bel_activites` (`id_activite`);

--
-- Constraints for table `cap_like`
--
ALTER TABLE `cap_like`
  ADD CONSTRAINT `cap_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `cap_like_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `cap_post` (`id_post`) ON DELETE CASCADE;

--
-- Constraints for table `cap_post`
--
ALTER TABLE `cap_post`
  ADD CONSTRAINT `cap_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `cap_post` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `cap_post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `cap_subscription`
--
ALTER TABLE `cap_subscription`
  ADD CONSTRAINT `cap_subscription_ibfk_1` FOREIGN KEY (`subscriber_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `cap_subscription_ibfk_2` FOREIGN KEY (`subscribed_to_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `pol_reponse_ticket`
--
ALTER TABLE `pol_reponse_ticket`
  ADD CONSTRAINT `pol_reponse_ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `pol_reponse_ticket_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `pol_ticket` (`id_ticket`) ON DELETE CASCADE;

--
-- Constraints for table `pol_ticket`
--
ALTER TABLE `pol_ticket`
  ADD CONSTRAINT `pol_ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `pol_ticket_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `pol_categorie` (`id_categorie`) ON DELETE SET NULL;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`);

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

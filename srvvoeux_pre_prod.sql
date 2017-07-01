-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 18 Janvier 2017 à 11:20
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `srvvoeux_pre_prod`
--

-- --------------------------------------------------------

--
-- Structure de la table `alertes`
--

CREATE TABLE `alertes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `typeAlerte` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

CREATE TABLE `annee` (
  `id` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `annee`
--

INSERT INTO `annee` (`id`, `annee`, `etat`) VALUES
(1, 2016, 1),
(2, 2017, 0);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `annee_filiere_id` int(11) DEFAULT NULL,
  `DateFiliere` datetime NOT NULL,
  `Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `filiere`
--

INSERT INTO `filiere` (`id`, `user_id`, `annee_filiere_id`, `DateFiliere`, `Nom`, `niveau`) VALUES
(3, 4, 1, '2017-01-18 10:28:13', 'MIAGE', 'M1'),
(4, 64, 1, '2017-01-18 10:51:28', 'MIAGE', 'L3'),
(5, 4, 2, '2017-01-18 11:12:43', 'MIAGE', 'M1'),
(6, 64, 2, '2017-01-18 11:12:43', 'MIAGE', 'L3');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `type_enseignant_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `DateInscription` datetime NOT NULL,
  `NbHeurCours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `inscription`
--

INSERT INTO `inscription` (`id`, `type_enseignant_id`, `user_id`, `matiere_id`, `DateInscription`, `NbHeurCours`) VALUES
(4, NULL, 66, 2, '2017-01-18 11:12:05', 12);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `type_enseignant_id` int(11) DEFAULT NULL,
  `filiere_id` int(11) DEFAULT NULL,
  `Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nbrHeurGroupe` int(11) NOT NULL,
  `NombreGroupe` int(11) NOT NULL,
  `Semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`id`, `type_enseignant_id`, `filiere_id`, `Nom`, `nbrHeurGroupe`, `NombreGroupe`, `Semestre`) VALUES
(2, 5, 4, 'JAVA', 24, 1, 1),
(3, 5, 6, 'JAVA', 24, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_enseignant`
--

CREATE TABLE `type_enseignant` (
  `id` int(11) NOT NULL,
  `libelle` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `coef` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `type_enseignant`
--

INSERT INTO `type_enseignant` (`id`, `libelle`, `coef`) VALUES
(5, 'Cours', 1.5);

-- --------------------------------------------------------

--
-- Structure de la table `type_utilisateur`
--

CREATE TABLE `type_utilisateur` (
  `id` int(11) NOT NULL,
  `Code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `NbrHeures` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `type_utilisateur`
--

INSERT INTO `type_utilisateur` (`id`, `Code`, `Libelle`, `NbrHeures`) VALUES
(3, 'Pr', 'Professeur', 192),
(5, 'ATER', 'ATER', 192),
(6, 'Monit', 'Moniteur', 64),
(10, 'PRAG', 'PRAG', 384),
(11, 'PAST', 'PAST', 96),
(12, 'PRAS', 'PRAS', 192),
(13, 'Demi-ATER', 'Demi-ATER', 96),
(14, 'Demi-ATER(11/12)', 'Demi-ATER(11/12)', 88),
(16, 'PRAG(60%)', 'PRAG(60%)', 231),
(17, 'ATER (11/12)', 'ATER (11/12)', 176),
(18, 'ATER (6/12)', 'ATER (6/12)', 48),
(19, 'MC', 'MC', 192),
(21, 'Maitr conf', 'Maitre(sse) de conferences', 192),
(24, 'Demi-ATER(10/12)', 'Demi-ATER(10/12)', 80),
(25, 'MCF', 'MCF', 192),
(26, 'Vac', 'Vacataire', 187),
(30, 'Inde', 'Indéfini', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `Nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NombreHeurTheo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `type_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `Nom`, `Prenom`, `NombreHeurTheo`) VALUES
(1, 25, 'lblin', 'lblin', 'lelia.blin@ibisc.univ-evry.fr', 'lelia.blin@ibisc.univ-evry.fr', 1, 'bng5pl9216o0w44ocs0gk8ww848s84s', '$2y$13$bng5pl9216o0w44ocs0gku4gbXevAF3l8F1l0L2sY3aQLxXqYVJ/.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Blin', 'Lelia', 192),
(2, 3, 'angel', 'angel', 'eric.angel@ibisc.univ-evry.fr', 'eric.angel@ibisc.univ-evry.fr', 1, 'dngxgmtszxckss8cw48kgkwc00kc4oc', '$2y$13$dngxgmtszxckss8cw48kgeC3givGkXqPVwjuellX4hJyISa0GQUMm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Angel', 'Eric', 192),
(3, 3, 'Pommereau', 'pommereau', 'franck.pommereau@ibisc.fr', 'franck.pommereau@ibisc.fr', 1, 'ljimlfg6oq8o0c40g8ssg8kco8ow0so', '$2y$13$ljimlfg6oq8o0c40g8ssgujD2XJhjuMCEMSDvQ1Kl2.D4T8Bl5QW6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Pommereau', 'Franck', 192),
(4, 25, 'BENZAKKI', 'benzakki', 'judith.benzakki@ibisc.univ-evry.fr', 'judith.benzakki@ibisc.univ-evry.fr', 1, 'c8vrcmxexhc00o4ckos4cgsso4wgs48', '$2y$13$c8vrcmxexhc00o4ckos4ceKF.ASVP5V3lTwlzLne5E2LsGnIIaN9u', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Benzakki', 'Judith', 192),
(5, 3, 'Cerrito', 'cerrito', 'cerrito@ibisc.univ-evry.fr', 'cerrito@ibisc.univ-evry.fr', 1, 'hx03cvvb83wogo84o4wc0skcw4ww8wo', '$2y$13$hx03cvvb83wogo84o4wc0eTKxFLXa4nN.AJhQbUzpOyDSApGMsTq.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Cerrito', 'Serena', 192),
(6, 6, 'ylecornec', 'ylecornec', 'yves.stan.lecornec@gmail.com', 'yves.stan.lecornec@gmail.com', 1, 'rhvncjhq074044k4o0og00gs8k04sco', '$2y$13$rhvncjhq074044k4o0og0ugi4usfzmcCXep81UAKssGvRSyS/fUcC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Le Cornec', 'Yves Stan', 64),
(7, 3, 'Delaplace', 'delaplace', 'Franck.Delaplace@ibisc.fr', 'franck.delaplace@ibisc.fr', 1, 'bmmazjkxsp44goooc4swk0o8g0kosc0', '$2y$13$bmmazjkxsp44goooc4swkuf0BNBO0uS2eh5Qya2LxLIjFrCBMzrP6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Delaplace', 'Franck', 192),
(8, 3, 'Delosme', 'delosme', 'jean-marc.delosme@ibisc.univ-evry.fr', 'jean-marc.delosme@ibisc.univ-evry.fr', 1, '4g9elhij1maswwok4wg40cgccg8co4g', '$2y$13$4g9elhij1maswwok4wg40ODdvwcbbr22IJdZuK.DtBoxXNut57BNe', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Delosme', 'Jean-Marc', 192),
(9, 25, 'dupont', 'dupont', 'denis.dupont@ibisc.univ-evry.fr', 'denis.dupont@ibisc.univ-evry.fr', 1, 'sd9xuvgjhkgo8888cggoskkc8scok4s', '$2y$13$sd9xuvgjhkgo8888cggosePKuhc6oMD.BLx4P0DJn9pITv/TbvLZ6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Dupont', 'Denis', 192),
(10, 25, 'Djafri', 'djafri', 'bachir.djafri@ibisc.univ-evry.fr', 'bachir.djafri@ibisc.univ-evry.fr', 1, '5dmvr8bskokcco04wooss8s00c04okg', '$2y$13$5dmvr8bskokcco04woossuE/9v.CeFy5EbQgEgOfDPQfBGf7VIYbK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Djafri', 'Bachir', 192),
(11, 25, 'hutzler', 'hutzler', 'guillaume.hutzler@ibisc.univ-evry.fr', 'guillaume.hutzler@ibisc.univ-evry.fr', 1, 'mku8yvlqub4s4wso4kskgow44g4ccso', '$2y$13$mku8yvlqub4s4wso4kskgeu9uqkVMwjNEplSmvV0hlTuGKpNdQjiC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Hutzler', 'Guillaume', 192),
(12, 3, 'Klaudel', 'klaudel', 'hanna.klaudel@ibisc.univ-evry.fr', 'hanna.klaudel@ibisc.univ-evry.fr', 1, 'mdhjqfv90j4sc0g00c8gcokogcs8ogg', '$2y$13$mdhjqfv90j4sc0g00c8gcedUj5e.cBfM01.XUrNwq9z47wVs3x1pu', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Klaudel', 'Hanna', 192),
(13, 6, 'amezine', 'amezine', 'amezine@ibisc.univ-evry.fr', 'amezine@ibisc.univ-evry.fr', 1, 'omjsyaknnm8ck00sggg0sokckk40g00', '$2y$13$omjsyaknnm8ck00sggg0seuv/Rg6cPgwBRuAYo3eYYnRMDOkbOKGm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Mezine', 'Adel', 64),
(14, 11, 'pdeclercq', 'pdeclercq', 'phildeclercq@yahoo.fr', 'phildeclercq@yahoo.fr', 1, '9wkjm8p81i8gwkso0c0socw840ko0oc', '$2y$13$9wkjm8p81i8gwkso0c0soOeH5/Jac4uRGgtq/g4sKWhc02Enx/3Ni', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Declercq', 'Phillipe', 96),
(15, 10, 'bouffon', 'bouffon', 'Pascal.Petit@ibisc.univ-evry.fr', 'pascal.petit@ibisc.univ-evry.fr', 1, 'd0wn61g6gz4s8scokk40wkwg84gk4ks', '$2y$13$d0wn61g6gz4s8scokk40wehjedXNPBt3.dtpKqTbCBl67mzRGvynS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Petit', 'Pascal', 384),
(16, 3, 'HANCZAR', 'hanczar', 'blaise.hanczar@ibisc.univ-evry.fr', 'blaise.hanczar@ibisc.univ-evry.fr', 1, 'l5qoz2trz9cwkcc8s0o4co8wc0ww4k4', '$2y$13$l5qoz2trz9cwkcc8s0o4ceer.aRAKWKk9ZabhvnXe2uYMikiCeM06', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Hanczar', 'Blaise', 192),
(17, 11, 'Baczko', 'baczko', 'aleksander@orange.fr', 'aleksander@orange.fr', 1, 'h2swkpif5xk40s4c4k4wk04kowoos40', '$2y$13$h2swkpif5xk40s4c4k4wkucaJsKq.bmO94SDyuMuYhAKETVi1mf7y', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Baczko', 'Aleksander', 96),
(18, 25, 'Melliti', 'melliti', 'tarek.melliti@ibisc.fr', 'tarek.melliti@ibisc.fr', 1, 'thqei0qu300okgow4g4g84gc4sgcocs', '$2y$13$thqei0qu300okgow4g4g8ubAQIBFTdjeIUn0s6HUXB9w.hLPsFZ6G', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Melliti', 'Tarek', 192),
(19, 11, 'dploix', 'dploix', 'damien.ploix@info.univ-evry.fr', 'damien.ploix@info.univ-evry.fr', 1, 'qkfe8ivbv5wk44ow4040g8ow0wsccgk', '$2y$13$qkfe8ivbv5wk44ow4040guJzfGcE2l/ZSeRRtw1./nIROFZumeXNu', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Ploix', 'Damien', 96),
(20, 11, 'rozenberg', 'rozenberg', 'rozenber@club-internet.fr', 'rozenber@club-internet.fr', 1, 'i43zsu3nyko40w444g88w8k4soss84s', '$2y$13$i43zsu3nyko40w444g88wuExbsyPC/PldK2oqtMbIe9sYvI/mFw1y', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Rozenberg', 'Marc', 96),
(21, 6, 'Abasso', 'abasso', 'abasso@ibisc.univ-evry.fr', 'abasso@ibisc.univ-evry.fr', 1, 'omml5bfjalwcgsogwk4c08ockk8w4wk', '$2y$13$omml5bfjalwcgsogwk4c0u3X1RTkn14cbzCg8OyWHAfGC1RshMz36', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Basso Blandin', 'Adrien ', 64),
(22, 10, 'Forestier', 'forestier', 'odile.forestier@ufrst.univ-evry.fr', 'odile.forestier@ufrst.univ-evry.fr', 1, 'ncqetw5lxb4k0wogwskk88kwok8ow40', '$2y$13$ncqetw5lxb4k0wogwskk8u42t6QzpwXWHOtPqyPlVv3qCVICBxM7C', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Forestier', 'Odile', 384),
(23, 3, 'Chu', 'chu', 'feng.chu@ibisc.univ-evry.fr', 'feng.chu@ibisc.univ-evry.fr', 1, 'r9mhz06uwc0ooc48g4gw448csks0s0o', '$2y$13$r9mhz06uwc0ooc48g4gw4uT1G28i3G8ft60rXgSBXR9EOpGGBV.Wi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Chu', 'Feng', 192),
(24, 25, 'Zehraoui', 'zehraoui', 'zehraoui@ibisc.univ-evry.fr', 'zehraoui@ibisc.univ-evry.fr', 1, 's8tfryc8bf4cokoc488g800c04gcs8w', '$2y$13$s8tfryc8bf4cokoc488g8urqSx9zp6nM1oyA1m3ysyqq7F.3Y.sC2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Zehraoui', 'Farida', 192),
(25, 11, 'Lucas', 'lucas', 'patrice.lucas@cea.fr', 'patrice.lucas@cea.fr', 1, 'au6hfw4eelkoocc0ks8gsko4kss0k8o', '$2y$13$au6hfw4eelkoocc0ks8gseycvBm9ShMq2FOIT7zokdwc/oe21M0FS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Lucas', 'Patrice', 96),
(26, 6, 'gchauvincent@gmail.com', 'gchauvincent@gmail.com', 'gchauvincent@gmail.com', 'gchauvincent@gmail.com', 1, 'dkczrdadf7wowogkk0gco8oc48c8co0', '$2y$13$dkczrdadf7wowogkk0gcounHUDzyYcbGf.NCrvcy20jk3mV.lM0Zi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Chau', 'Vincent', 64),
(27, 11, 'elghoul', 'elghoul', 'm-elghoul@orange.fr', 'm-elghoul@orange.fr', 1, '9ogguf5tw0sgcco4gc448cwgks4k08k', '$2y$13$9ogguf5tw0sgcco4gc448OtUDkZWl8G0XmKQoHwUg.ksFJzKnZNz.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Elghoul', 'Mansour', 96),
(28, 13, 'Poligny', 'poligny', 'laurent.poligny@laposte.net', 'laurent.poligny@laposte.net', 1, '7ibn1sgwmps00oc4g0w4ws880cswsg8', '$2y$13$7ibn1sgwmps00oc4g0w4weBSG2DvLqC2Yc5DeJT5KpPRIYENmDPNC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Poligny', 'Laurent', 96),
(29, 25, 'TAHI', 'tahi', 'tahi@ibisc.univ-evry.fr', 'tahi@ibisc.univ-evry.fr', 1, 'h7k37lqv4fsw0w80oc4wsksgoo8wo4w', '$2y$13$h7k37lqv4fsw0w80oc4wsekc/Akfp8MFWVSTsK9Ef.pFBclhHab8y', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Tahi', 'Fariza', 192),
(30, 26, 'Thao', 'thao', 'Chi-Thao.le@cea.fr', 'chi-thao.le@cea.fr', 1, 'h1d390l7ajccogwcckc84ks84wkow88', '$2y$13$h1d390l7ajccogwcckc84e0Ut8SOcGS1diPt5zdE9upvvzr3AgFKy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Le', 'Thao', 187),
(31, 19, 'regnault', 'regnault', 'Damien.regnault@ibisc.fr', 'damien.regnault@ibisc.fr', 1, '5kuu1s64mzwogcwcsogo8kgco48o440', '$2y$13$5kuu1s64mzwogcwcsogo8e.3LgiDC02mk07Yzxu5kWqh1tZSZwvEy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Regnault', 'Damien', 192),
(32, 25, 'Montagne', 'montagne', 'Christophe.Montagne@ufrst.univ-evry.fr', 'christophe.montagne@ufrst.univ-evry.fr', 1, 'f92hrjuujm04swk4gs4sw4g8ow4swgo', '$2y$13$f92hrjuujm04swk4gs4swuTIlhGWZ/OJb9llu9VqZGB806zf8sjPy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Montagne', 'Christophe', 192),
(33, 26, 'BOURLIER', 'bourlier', 'sylvie.bourlier@free.fr', 'sylvie.bourlier@free.fr', 1, 'm0cl2k578fksssog8gkkcskg4gwkggg', '$2y$13$m0cl2k578fksssog8gkkce.pMhEvMOHbf9OfeojT8xDktXbAgu.He', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Bourlier', 'Sylvie', 187),
(34, 11, 'Ledoux', 'ledoux', 'franck.ledoux@live.fr', 'franck.ledoux@live.fr', 1, 'ths5mv7ja0gs004c0sw480kg8s08ko', '$2y$13$ths5mv7ja0gs004c0sw48uH6w.bEQOFIN3NdIXIWQHvsSarYoQXDi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Ledoux', 'Franck', 96),
(35, 26, 'ZZ-Ens-Autre-Dept', 'zz-ens-autre-dept', 'nowhere@null.org', 'nowhere@null.org', 1, 'd6h0q8scjzksgg0cc8k08w0cgw800oo', '$2y$13$d6h0q8scjzksgg0cc8k08uHMo99/0S8hhzwuwid4nvnRVKlxOcfGq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'ZZ-Ens-Autre-Dept', 'ZZ-Ens-Autre-Dept', 187),
(36, 12, 'Courtaud', 'courtaud', 'Didier.Courtaud@cea.fr', 'didier.courtaud@cea.fr', 1, 'f5816zhtan4kckkg4s4sw8g4g0sk0cc', '$2y$13$f5816zhtan4kckkg4s4swuMn16ZD9xKeuIYK4HncoQ8VRzj2YbjG2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Courtaud', 'Didier', 192),
(37, 26, 'DOS SANTOS UZARRALDE', 'dos santos uzarralde', 'pierre.dossantos-uzarralde@cea.fr', 'pierre.dossantos-uzarralde@cea.fr', 1, '683cdan6pd0k0g8s0sowswkookwwgoc', '$2y$13$683cdan6pd0k0g8s0sowsunDyZb9uu5.9CxvDmWjf1XPbuzq7BeCG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'DOS SANTOS UZARRALDE', 'Pierre', 187),
(38, 26, 'hanichi', 'hanichi', 'djelloul.hanichi@ibisc.univ-evry.fr', 'djelloul.hanichi@ibisc.univ-evry.fr', 1, '1f9ughw1izwgw8wow8cgoow8ggscc4g', '$2y$13$1f9ughw1izwgw8wow8cgoeON6RVMULwpmyVZxH4j3iAJuqyKOjHTm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Hanichi', 'Djelloul', 187),
(39, 25, 'abchiche', 'abchiche', 'nadia.abchiche@ibisc.fr', 'nadia.abchiche@ibisc.fr', 1, 'iz6jx18ja6g44ow8owsscos4scwk404', '$2y$13$iz6jx18ja6g44ow8owssceporczVNHyY4j6WkaEOJtzmqlK1Mnbn.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Abchiche', 'Nadia', 192),
(40, 10, 'BOUKHELIFA', 'boukhelifa', 'boukhelifafarid@sfr.fr', 'boukhelifafarid@sfr.fr', 1, 'n2t7zyg1jlcs8c0840o8gkwk4wwkkw0', '$2y$13$n2t7zyg1jlcs8c0840o8gemUidzuM3EKbLyEAnPqTC19qx.UA2Pey', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Boukhelifa', 'Farid', 384),
(41, 26, 'Hervioux', 'hervioux', 'dupont@lami.univ-evry.fr', 'dupont@lami.univ-evry.fr', 1, 'bvop6ky3lzk84w4c8c004gwwco0w04w', '$2y$13$bvop6ky3lzk84w4c8c004eQCTER0n5K6MRqu.I7iq8ggexT0xha2K', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Hervioux', 'P.', 187),
(42, 21, 'Sadi', 'sadi', 'Yasmina.Sadi@ufrst.univ-evry.fr', 'yasmina.sadi@ufrst.univ-evry.fr', 1, 'a0xb03and3400w8sccc0coo4owsggs8', '$2y$13$a0xb03and3400w8sccc0ce1W0gXRkvmry1BeJ8pD9kn4bSzaN0oQa', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Sadi', 'Yasmina', 192),
(43, 26, 'Quach', 'quach', 'quachhoangminh@gmail.com', 'quachhoangminh@gmail.com', 1, 'o1e5nw5tsrkkskc8o484o4gwkg0sgk', '$2y$13$o1e5nw5tsrkkskc8o484ouzX3EBiEIfuIcvcS6ElXNMuRsnMpq6b.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Quach', 'Hoang-Minh', 187),
(44, 26, 'Legrandgérard', 'legrandgérard', 'Yves.Legrandgerard@pps.jussieu.fr', 'yves.legrandgerard@pps.jussieu.fr', 1, 'hy5zlgs0kpsk0ggggw8c44gscgscc00', '$2y$13$hy5zlgs0kpsk0ggggw8c4uF8glL6T2V6QImLeqPk.NbksPyjudL4q', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Legrandgérard', 'Yves', 187),
(45, 26, 'ZZ-NonOuvert', 'zz-nonouvert', 'nowhere@nowhere.null', 'nowhere@nowhere.null', 1, '3lsz3rwrlso4cow8k4gwgg8okcgsc00', '$2y$13$3lsz3rwrlso4cow8k4gwgeUJH0jy6jpjkZFwroKjNU83bhLCgyHTq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'ZZ-NonOuvert', 'ZZ-NonOuvert', 187),
(46, 26, 'perraudin', 'perraudin', 'perraudin@ibisc.univ-evry.fr', 'perraudin@ibisc.univ-evry.fr', 1, 'iw53xn3mw68kooocw4w48s8c4goss00', '$2y$13$iw53xn3mw68kooocw4w48eT1E.k8nr2kYMLgnRdIzYqsC/KMHk7XS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Perraudin', 'Jean-Luc', 187),
(47, 26, 'NOLLET', 'nollet', 'sophie.nollet@hotmail.fr', 'sophie.nollet@hotmail.fr', 1, '44dmiiwo1s8wcsoo0owoss8c8sssksc', '$2y$13$44dmiiwo1s8wcsoo0owosewLo2xLyZHRadv.WleuDatcsaF/ItyES', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Nollet', 'Sophie', 187),
(48, 26, 'SOULABAIL', 'soulabail', 'soulabail@orange.fr', 'soulabail@orange.fr', 1, 'ebtydt9q0jcw0k8s0cw4c0wcgsg0ckw', '$2y$13$ebtydt9q0jcw0k8s0cw4cuxOXPkeWg8ci6NEClaqOyAAQCz9L7u92', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Soulabail', 'Yves', 187),
(49, 6, 'sobieraj', 'sobieraj', 'jsobieraj@ibisc.fr', 'jsobieraj@ibisc.fr', 1, '33g5hljlf86c08cw40soswgcgkkgcc0', '$2y$13$33g5hljlf86c08cw40sosuh/S1lmRujK4RNf.OskMM.SmswE5MW/e', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Sobieraj', 'Jeremy', 64),
(50, 6, 'biane', 'biane', 'celia.biane@yahoo.fr', 'celia.biane@yahoo.fr', 1, '8r9z7j0z8hs0g84k80s00gc4c4c8kc0', '$2y$13$8r9z7j0z8hs0g84k80s00e2jfR6r7d9BIotfQD77/Zn.EmUJZYnw.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Biane', 'Célia', 64),
(51, 3, 'Nazim', 'nazim', 'nazim.agoulmine@iup.univ-evry.fr', 'nazim.agoulmine@iup.univ-evry.fr', 1, '6798z954x2ck40g08wcs8gwow0ok44w', '$2y$13$6798z954x2ck40g08wcs8ekohnhS34e3O7tLskO9aCfTBNaWxg9LS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Agoulmine', 'Nazim', 192),
(52, 26, 'BUFFA', 'buffa', 'micbuffa@gmail.com', 'micbuffa@gmail.com', 1, 'j3fman2dn9c08kw4osw04k4c00kcws4', '$2y$13$j3fman2dn9c08kw4osw04eQu2W4Ze/ypg3iBAXS4k6z080MDHbQK.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'BUFFA', 'Michel', 187),
(53, 3, 'JANODET', 'janodet', 'jean.christophe.janodet@ibisc.fr', 'jean.christophe.janodet@ibisc.fr', 1, 'jox40ojg0tw8wsg8ooc4wsggkok8w8s', '$2y$13$jox40ojg0tw8wsg8ooc4weLCwlVR7xtGnWb0tdDg/oyYhIzwS/TKK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Janodet', 'Jean-Christophe', 192),
(54, 26, 'glucarelli', 'glucarelli', 'glucarelli@gmail.com', 'glucarelli@gmail.com', 1, '8dm638frteskg00skwkkgso8o0ggk0k', '$2y$13$8dm638frteskg00skwkkgeUI9FW0eOualDdQ4UJAHqXItN4GZSGt6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Lucarelli', 'Giorgio', 187),
(55, 25, 'fbelard', 'fbelard', 'f.belardinelli@imperial.ac.uk', 'f.belardinelli@imperial.ac.uk', 1, 'p9vbgf7jr2so048w0g804ow4okss4wc', '$2y$13$p9vbgf7jr2so048w0g804el.gL3ENO6zzHGe3dBK2itcH9wCwRhlC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Belardinelli', 'Francesco', 192),
(56, 6, 'david', 'david', 'adavid@ibisc.univ-evry.fr', 'adavid@ibisc.univ-evry.fr', 1, 'plupycmmyo00s8c40kocgg4gccogko0', '$2y$13$plupycmmyo00s8c40kocgeQL1vv5Ca0ZuBww/HEYReE2KXIjesCLG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'David', 'Amélie', 64),
(57, 25, 'mszafran', 'mszafran', 'marie.szafranski@ibisc.univ-evry.fr', 'marie.szafranski@ibisc.univ-evry.fr', 1, '7us1wqir4too44gk80ww84s40g0o8ks', '$2y$13$7us1wqir4too44gk80ww8uXcqdKIQkQVWyrMa0o1B2nZXUw8bITLi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Szafranski ', 'Marie', 192),
(58, 25, 'Thang', 'thang', 'thang.nguyen@ibisc.univ-evry.fr', 'thang.nguyen@ibisc.univ-evry.fr', 1, 'll8uvfckols8k8k8ogoc444s0w8ggk8', '$2y$13$ll8uvfckols8k8k8ogoc4uEvywisnQR91YfTZQbPSY3w9yQrdjCfe', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Nguyen', 'Kim Thang', 192),
(59, 6, 'fpapadopoulos', 'fpapadopoulos', 'fred94190@gmail.com', 'fred94190@gmail.com', 1, 'dot2fkahrps88gkws8440gkssooow08', '$2y$13$dot2fkahrps88gkws8440eFnClJKjX3osjypX/3Vu.fCF/jj.B.tq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Papadopoulos', 'Frédéric', 64),
(60, 26, 'ZZZZ', 'zzzz', 'zzzz@dddmdlk.com', 'zzzz@dddmdlk.com', 1, '54r7jq3abwwsc4so4g4wws40s0w0go4', '$2y$13$54r7jq3abwwsc4so4g4wweFxo/QRdB5ClndFpu94lkPXMI.1ZSnQa', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'ZZZZ', 'zzzz', 187),
(61, 10, 'MACNAMARA', 'macnamara', 'riordan.macnamara@gmail.com', 'riordan.macnamara@gmail.com', 1, 'qo8lxopkudc4k8oc8s8wcowkskgs8wc', '$2y$13$qo8lxopkudc4k8oc8s8wceAdNJiTK1VnaGjWibtKqb8sRW/yQW/gC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'MACNAMARA', 'Riordan', 384),
(62, 26, 'NICOLAS', 'nicolas', 'anne.nicolas@hupstream.com', 'anne.nicolas@hupstream.com', 1, 'pnu6r27mndww4wc84g8kso400g4g4sc', '$2y$13$pnu6r27mndww4wc84g8kseSEN4/A3ZwJO2AK6HPMvKsdwsQJ9cTP.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Nicolas', 'Anne', 187),
(63, 26, 'Morais', 'morais', 'sebastien.morais@free.fr', 'sebastien.morais@free.fr', 1, 'jon2qtr4qdc0ckc00cck0os00sk0osg', '$2y$13$jon2qtr4qdc0ckc00cck0e/pzCUzu3h5GUWFvb5JJX9LD2b.ECVYC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_ENSEIG";}', 0, NULL, 'Morais', 'Sébastien', 187),
(64, 26, 'youcef', 'youcef', 'youcef.boukersi@yahoo.fr', 'youcef.boukersi@yahoo.fr', 1, 'd0t26djhwe0w8coocg0gokwksccw8ss', '$2y$13$d0t26djhwe0w8coocg0goejmvzPY7wbi8X4uVRfXX9MmxGANP68zi', '2017-01-18 11:13:42', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'BOUKERSI', 'YOUCEF', 187),
(66, 30, 'XXX', 'xxx', 'XXXX@email.fr', 'xxxx@email.fr', 0, 'glloy7t0x3k88o04cs8kckw4k0w0w8c', '$2y$13$glloy7t0x3k88o04cs8kceqVbBWG1e/S8cusJdO31XuTzjsy.eDGK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'XXXXX', 'XXXXX', 10);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `alertes`
--
ALTER TABLE `alertes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DD01B8CCA76ED395` (`user_id`);

--
-- Index pour la table `annee`
--
ALTER TABLE `annee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2ED05D9EA76ED395` (`user_id`),
  ADD KEY `IDX_2ED05D9E20724294` (`annee_filiere_id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5E90F6D694B84BF5` (`type_enseignant_id`),
  ADD KEY `IDX_5E90F6D6A76ED395` (`user_id`),
  ADD KEY `IDX_5E90F6D6F46CD258` (`matiere_id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9014574A94B84BF5` (`type_enseignant_id`),
  ADD KEY `IDX_9014574A180AA129` (`filiere_id`);

--
-- Index pour la table `type_enseignant`
--
ALTER TABLE `type_enseignant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_utilisateur`
--
ALTER TABLE `type_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2DA1797792FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_2DA17977A0D96FBF` (`email_canonical`),
  ADD KEY `IDX_2DA17977C54C8C93` (`type_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `alertes`
--
ALTER TABLE `alertes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `annee`
--
ALTER TABLE `annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `type_enseignant`
--
ALTER TABLE `type_enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `type_utilisateur`
--
ALTER TABLE `type_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `alertes`
--
ALTER TABLE `alertes`
  ADD CONSTRAINT `FK_DD01B8CCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `FK_2ED05D9E20724294` FOREIGN KEY (`annee_filiere_id`) REFERENCES `annee` (`id`),
  ADD CONSTRAINT `FK_2ED05D9EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D694B84BF5` FOREIGN KEY (`type_enseignant_id`) REFERENCES `type_enseignant` (`id`),
  ADD CONSTRAINT `FK_5E90F6D6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5E90F6D6F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_9014574A180AA129` FOREIGN KEY (`filiere_id`) REFERENCES `filiere` (`id`),
  ADD CONSTRAINT `FK_9014574A94B84BF5` FOREIGN KEY (`type_enseignant_id`) REFERENCES `type_enseignant` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_2DA17977C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_utilisateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

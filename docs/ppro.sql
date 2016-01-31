-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 31. led 2016, 19:59
-- Verze serveru: 5.6.16
-- Verze PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `ppro`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_address`
--

CREATE TABLE IF NOT EXISTS `15pick12_address` (
  `id_address` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `15pick12_address`
--

INSERT INTO `15pick12_address` (`id_address`, `address`, `city`, `postal_code`) VALUES
(3, 'a', 'a', 'tets');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_component`
--

CREATE TABLE IF NOT EXISTS `15pick12_component` (
  `id_component` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_component_group` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_link` varchar(255) NOT NULL,
  `complexity` int(11) DEFAULT '0',
  PRIMARY KEY (`id_component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Vypisuji data pro tabulku `15pick12_component`
--

INSERT INTO `15pick12_component` (`id_component`, `id_component_group`, `name`, `description`, `description_link`, `complexity`) VALUES
(9, 14, 'Test', 'Je tento web vhodný pro eshop?', '#', 0),
(12, 14, 'Core', 'Core', 'Coew', 0),
(13, 17, 'Eshop', 'Eshop', 'asc', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_component_group`
--

CREATE TABLE IF NOT EXISTS `15pick12_component_group` (
  `id_component_group` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_component_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Vypisuji data pro tabulku `15pick12_component_group`
--

INSERT INTO `15pick12_component_group` (`id_component_group`, `name`, `description`) VALUES
(14, 'Core', 'Core'),
(17, 'Test', 'asc');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_gallery`
--

CREATE TABLE IF NOT EXISTS `15pick12_gallery` (
  `id_gallery` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_thumbnail` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id_gallery`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Vypisuji data pro tabulku `15pick12_gallery`
--

INSERT INTO `15pick12_gallery` (`id_gallery`, `name`, `description`, `id_thumbnail`) VALUES
(2, 'Test', 's', 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_image`
--

CREATE TABLE IF NOT EXISTS `15pick12_image` (
  `id_image` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_src` varchar(255) NOT NULL,
  `image_alt` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `thumbnail_src` varchar(255) NOT NULL,
  `id_gallery` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `15pick12_image`
--

INSERT INTO `15pick12_image` (`id_image`, `image_src`, `image_alt`, `description`, `thumbnail_src`, `id_gallery`) VALUES
(2, 'assets/uploads/12191774_10201104753138645_6762847735642819405_n.jpg', 'test', 'test', 'assets/uploads/thumbnail/12191774_10201104753138645_6762847735642819405_n.jpg', NULL),
(3, 'assets/uploads/banner_elysees_znacky.png', 'sfd', 'dfbsd', 'assets/uploads/thumbnail/banner_elysees_znacky.png', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template`
--

CREATE TABLE IF NOT EXISTS `15pick12_template` (
  `id_template` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_gallery` bigint(20) NOT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price_implement` int(50) DEFAULT NULL,
  `price_editing` int(50) DEFAULT NULL,
  PRIMARY KEY (`id_template`),
  KEY `user_template` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `price_implement`, `price_editing`) VALUES
(1, 2, 1, 'Divi', 'Popis', 5, 5),
(2, 0, NULL, 'Extra', 'svv', 50, 5),
(3, 0, NULL, 'Nexus', 'dfb', 5, 5),
(4, 0, NULL, 'Fable', 'gg', 5, 5),
(5, 0, NULL, 'Foxy', 'sdv', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template_components`
--

CREATE TABLE IF NOT EXISTS `15pick12_template_components` (
  `id_template_components` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_template` bigint(20) NOT NULL,
  `id_component` bigint(20) NOT NULL,
  PRIMARY KEY (`id_template_components`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Vypisuji data pro tabulku `15pick12_template_components`
--

INSERT INTO `15pick12_template_components` (`id_template_components`, `id_template`, `id_component`) VALUES
(23, 2, 9),
(24, 2, 13),
(30, 5, 13),
(33, 3, 12),
(34, 4, 9),
(37, 1, 9),
(38, 1, 12);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_user`
--

CREATE TABLE IF NOT EXISTS `15pick12_user` (
  `id_user` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_address` bigint(20) NOT NULL DEFAULT '0',
  `login` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `rights` int(2) DEFAULT '0',
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_login` (`login`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `15pick12_user`
--

INSERT INTO `15pick12_user` (`id_user`, `id_address`, `login`, `name`, `surname`, `email`, `password`, `salt`, `website`, `phone`, `rights`, `token`) VALUES
(1, 0, 'admin', 'admin', 'admin', 'test@test.czs', 'test', 'admin', 'admin', '123', 5, ''),
(5, 3, 'test', 'test', 'test', 'a@a.cz', '8baabfa7979b17fb6146ab9037838ccf4d6bd96017fe6c00ecac6ac0bffd3d42', 'f^URtg7AD(nyK.BH]V_Oc,=xm5>@5aggC>eDQ7zO;X=QTQ@vKj', 'web', '123456', 0, 'xeE9VRGY9zA3RbUMaaF36kFwhz7JNA2B');

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `15pick12_template`
--
ALTER TABLE `15pick12_template`
  ADD CONSTRAINT `user_template` FOREIGN KEY (`id_user`) REFERENCES `15pick12_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

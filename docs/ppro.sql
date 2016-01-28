-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 28. led 2016, 01:04
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Vypisuji data pro tabulku `15pick12_component`
--

INSERT INTO `15pick12_component` (`id_component`, `id_component_group`, `name`, `description`, `description_link`, `complexity`) VALUES
(9, 17, 'Test', 'Je tento web vhodný pro eshop?', '#', 0),
(12, 14, 'Core', 'Core', 'Coew', 0),
(13, 14, 'Eshop', 'Eshop', 'asc', 0);

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
-- Struktura tabulky `15pick12_image`
--

CREATE TABLE IF NOT EXISTS `15pick12_image` (
  `id_image` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_src` varchar(255) NOT NULL,
  `image_alt` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `price_implement`, `price_editing`) VALUES
(1, 1, 1, 'Divi', 'Popis', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template_components`
--

CREATE TABLE IF NOT EXISTS `15pick12_template_components` (
  `id_template_components` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_template` bigint(20) NOT NULL,
  `id_component` bigint(20) NOT NULL,
  PRIMARY KEY (`id_template_components`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Vypisuji data pro tabulku `15pick12_template_components`
--

INSERT INTO `15pick12_template_components` (`id_template_components`, `id_template`, `id_component`) VALUES
(17, 1, 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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

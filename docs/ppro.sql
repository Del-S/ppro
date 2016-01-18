-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 16. led 2016, 23:57
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
-- Struktura tabulky `15pick12_component`
--

CREATE TABLE IF NOT EXISTS `15pick12_component` (
  `id_component` bigint(20) unsigned NOT NULL,
  `component_group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_link` varchar(255) NOT NULL,
  `complexity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `15pick12_component`
--

INSERT INTO `15pick12_component` (`id_component`, `component_group`, `name`, `description`, `description_link`, `complexity`) VALUES
(1, 'Core', 'Blog', 'Je tento web vhodný pro blog?', '#', 0);

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
  `components` text NOT NULL,
  `user_ratings` text NOT NULL,
  `price_implement` int(50) DEFAULT NULL,
  `price_editing` int(50) DEFAULT NULL,
  PRIMARY KEY (`id_template`),
  KEY `user_template` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `components`, `user_ratings`, `price_implement`, `price_editing`) VALUES
(1, 0, 1, 'Divi', 'asdvsdv', '', '', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_user`
--

CREATE TABLE IF NOT EXISTS `15pick12_user` (
  `id_user` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_address` bigint(20) NOT NULL,
  `login` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `rights` int(2) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_login` (`login`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `15pick12_user`
--

INSERT INTO `15pick12_user` (`id_user`, `id_address`, `login`, `name`, `surname`, `email`, `password`, `hash`, `website`, `phone`, `rights`, `token`) VALUES
(1, 0, 'admin', 'admin', 'admin', 'admin@admin.chs', 'admin', 'admin', 'admin', '123', 5, '');

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
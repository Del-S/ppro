-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 27. led 2016, 23:11
-- Verze serveru: 10.1.9-MariaDB
-- Verze PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `ppro`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_component`
--

CREATE TABLE `15pick12_component` (
  `id_component` bigint(20) UNSIGNED NOT NULL,
  `id_component_group` bigint(20) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_link` varchar(255) NOT NULL,
  `complexity` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `15pick12_component`
--

INSERT INTO `15pick12_component` (`id_component`, `id_component_group`, `name`, `description`, `description_link`, `complexity`) VALUES
(1, 1, 'Blog', 'Je tento web vhodný pro blog?', '#', 0),
(2, 1, 'Eshop', 'Je tento web vhodný pdro eshop?', '#', 0),
(6, 1, 'Olina Koželuhová', 'cccc', '#', 0),
(7, 1, 'Hanka', 'bdbdbdbb', '#', 0),
(8, 1, '///', '//////', '#', 0),
(9, 1, 'gg', 'ggg', '#', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_component_group`
--

CREATE TABLE `15pick12_component_group` (
  `id_component_group` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `15pick12_component_group`
--

INSERT INTO `15pick12_component_group` (`id_component_group`, `name`, `description`) VALUES
(1, 'Core', 'K ?emu je šablona ur?ena??š??žýáíé');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_image`
--

CREATE TABLE `15pick12_image` (
  `id_image` bigint(20) UNSIGNED NOT NULL,
  `image_src` text NOT NULL,
  `image_alt` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `15pick12_image`
--

INSERT INTO `15pick12_image` (`id_image`, `image_src`, `image_alt`, `description`) VALUES
(40, 'assets/uploads/krajina1.jpg', 'e', 'e'),
(41, 'assets/uploads/krajina3.jpg', 'ee', 'ee'),
(42, 'assets/uploads/krajina2.jpg', 'rr', 'rr');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template`
--

CREATE TABLE `15pick12_template` (
  `id_template` bigint(20) UNSIGNED NOT NULL,
  `id_gallery` bigint(20) NOT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price_implement` int(50) DEFAULT NULL,
  `price_editing` int(50) DEFAULT NULL,
  `components` text NOT NULL,
  `user_ratings` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `price_implement`, `price_editing`, `components`, `user_ratings`) VALUES
(1, 0, 1, 'Divi', 'asdvsdv', 5, 5, '', '');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_user`
--

CREATE TABLE `15pick12_user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
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
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `15pick12_user`
--

INSERT INTO `15pick12_user` (`id_user`, `id_address`, `login`, `name`, `surname`, `email`, `password`, `hash`, `website`, `phone`, `rights`, `token`) VALUES
(1, 0, 'admin', 'admin', 'admin', 'test@test.czs', 'test', 'admin', 'admin', '123', 5, ''),
(2, 0, 'test', 'tests', 'test', 'test@test.cz', 'pass', 'password hash', 'web', '123456', 0, 'generate token');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `15pick12_component`
--
ALTER TABLE `15pick12_component`
  ADD PRIMARY KEY (`id_component`);

--
-- Klíče pro tabulku `15pick12_component_group`
--
ALTER TABLE `15pick12_component_group`
  ADD PRIMARY KEY (`id_component_group`);

--
-- Klíče pro tabulku `15pick12_image`
--
ALTER TABLE `15pick12_image`
  ADD PRIMARY KEY (`id_image`);

--
-- Klíče pro tabulku `15pick12_template`
--
ALTER TABLE `15pick12_template`
  ADD PRIMARY KEY (`id_template`),
  ADD KEY `user_template` (`id_user`);

--
-- Klíče pro tabulku `15pick12_user`
--
ALTER TABLE `15pick12_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_login` (`login`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `15pick12_component`
--
ALTER TABLE `15pick12_component`
  MODIFY `id_component` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pro tabulku `15pick12_component_group`
--
ALTER TABLE `15pick12_component_group`
  MODIFY `id_component_group` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `15pick12_image`
--
ALTER TABLE `15pick12_image`
  MODIFY `id_image` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT pro tabulku `15pick12_template`
--
ALTER TABLE `15pick12_template`
  MODIFY `id_template` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `15pick12_user`
--
ALTER TABLE `15pick12_user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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

-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 01. úno 2016, 02:54
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Vypisuji data pro tabulku `15pick12_component`
--

INSERT INTO `15pick12_component` (`id_component`, `id_component_group`, `name`, `description`, `description_link`, `complexity`) VALUES
(14, 22, 'Ano', 'Používá Builder.', '#', 0),
(16, 18, 'Eshop', 'Tato šablona je vhodný pro eshop.', '#', 0),
(17, 18, 'Blog', 'Tato šablona je vhodný pro blog.', '#', 0),
(18, 18, 'Magazín', 'Tato šablona je vhodná pro Magazíny.', '#', 0),
(19, 18, 'Multimédia', 'Šablona je vhodná pro fotky, videa a soubory.', '#', 0),
(20, 18, 'Business', 'Šablona je vhodná pro podnikové stránky.', '#', 0),
(21, 22, 'Ne', 'Nepoužívá Builder.', '#', 0),
(22, 25, 'Ano', 'Šablona je schopná dobrého zobrazení pro mobilní zařízení.', '#', 0),
(23, 25, 'Částečně', 'Šablona je pouze částečně uzpůsobena pro mobilní zařízení.', '#', 0),
(24, 25, 'Ne', 'Šablona nepodporuje zobrazení pro mobilní zařízení.', '#', 0),
(25, 24, 'Slider', 'Obrázkovy nebo video slider.', '#', 0),
(26, 24, 'Postranní lišta', 'Šablona obsahuje postranní lištu pro komponenty.', '#', 0),
(27, 24, 'Blog', 'Šablona pracuje s příspěvky a je možnost je zobrazit jako blog.', '#', 0),
(28, 21, 'Černá', '', '#', 0),
(29, 21, 'Červená', '', '#', 0),
(30, 21, 'Modrá', '', '#', 0),
(31, 21, 'Zelená', '', '#', 0),
(32, 21, 'Žlutá', '', '#', 0),
(33, 21, 'Bílá', '', '#', 0),
(34, 21, 'Fialová', '', '#', 0),
(35, 26, 'Ano', '', '#', 0),
(36, 26, 'Ne', '', '#', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_component_group`
--

CREATE TABLE IF NOT EXISTS `15pick12_component_group` (
  `id_component_group` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_component_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=27 ;

--
-- Vypisuji data pro tabulku `15pick12_component_group`
--

INSERT INTO `15pick12_component_group` (`id_component_group`, `name`, `description`) VALUES
(18, 'K čemu je šablona určena?', 'Hlavní funkce šablony a pro co je určena.'),
(21, 'Základní barevnost', 'Jakou má šablona základní barvu nebo barvy.'),
(22, 'Používá Builder?', 'Některé šablony mají inteligentní Builder pro možnost stavění veškerých boků webových stránek.'),
(24, 'Základní komponenty', 'Základní komponenty webu.'),
(25, 'Je responzivní?', 'Je šablona schopna dobrého zobrazení i pro mobilní zařízení?'),
(26, 'Je na celou šířku?', 'Šablona využívá zobrazení na celou šířku okna.');

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_gallery`
--

CREATE TABLE IF NOT EXISTS `15pick12_gallery` (
  `id_gallery` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_thumbnail_gallery` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id_gallery`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Vypisuji data pro tabulku `15pick12_gallery`
--

INSERT INTO `15pick12_gallery` (`id_gallery`, `name`, `description`, `id_thumbnail_gallery`) VALUES
(14, 'Divi Galerie', 'Galerie pro šablonu Divi', 16);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Vypisuji data pro tabulku `15pick12_image`
--

INSERT INTO `15pick12_image` (`id_image`, `image_src`, `image_alt`, `description`, `thumbnail_src`, `id_gallery`) VALUES
(13, 'assets/uploads/Divi_builder.png', 'Divi Builder', 'Divi builder umožňuje postavit jakýkoliv vzhled stránek.', 'assets/uploads/thumbnail/Divi_builder.png', 14),
(14, 'assets/uploads/Divi_headers.jpg', 'Vzhled Divi hlaviček', 'Rozdílné možnosti vzhledu vedle sebe.', 'assets/uploads/thumbnail/Divi_headers.jpg', 14),
(15, 'assets/uploads/Divi-2.jpg', 'Divi základní vzhled', '', 'assets/uploads/thumbnail/Divi-2.jpg', 14),
(16, 'assets/uploads/divi-large-3.jpg', 'Šablona Divi', '', 'assets/uploads/thumbnail/divi-large-3.jpg', 14),
(17, 'assets/uploads/Divi-second-design.jpg', 'Druhý vzhled Divi', '', 'assets/uploads/thumbnail/Divi-second-design.jpg', 14);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template`
--

CREATE TABLE IF NOT EXISTS `15pick12_template` (
  `id_template` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_gallery` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price_implement` int(50) DEFAULT NULL,
  `price_editing` int(50) DEFAULT NULL,
  PRIMARY KEY (`id_template`),
  KEY `user_template` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `price_implement`, `price_editing`) VALUES
(1, 14, 1, 'Divi', 'Jedna z nejnovějších šablon od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>. Tato šablona jako první představila Divi Builder, díky kterému je možné postavit si stránky podle svého přání.<br />\r\nPomocí rozdělení do sekcí a sloupců je možné postavit jakýkoliv vzhled. Do těchto sekcí se vkládají moduly a každý z těchto modulů má jinou funkci. Divi v této chvíli podporuje přes 40 modulů od slideru, blogu, galerie po cenové tabulky a počítadla.\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2000),
(2, NULL, NULL, 'Extra', 'svv', 50, 5),
(3, NULL, NULL, 'Nexus', 'dfb', 5, 5),
(4, NULL, NULL, 'Fable', 'gg', 5, 5),
(5, NULL, NULL, 'Foxy', 'sdv', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template_components`
--

CREATE TABLE IF NOT EXISTS `15pick12_template_components` (
  `id_template_components` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_template` bigint(20) NOT NULL,
  `id_component` bigint(20) NOT NULL,
  PRIMARY KEY (`id_template_components`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Vypisuji data pro tabulku `15pick12_template_components`
--

INSERT INTO `15pick12_template_components` (`id_template_components`, `id_template`, `id_component`) VALUES
(49, 3, 12),
(52, 5, 13),
(67, 2, 9),
(68, 2, 13),
(71, 4, 9),
(102, 1, 16),
(103, 1, 17),
(104, 1, 20),
(105, 1, 28),
(106, 1, 30),
(107, 1, 33),
(108, 1, 34),
(109, 1, 14),
(110, 1, 25),
(111, 1, 26),
(112, 1, 27),
(113, 1, 22),
(114, 1, 35);

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
(5, 3, 'test', 'testd', 'testd', 'a@a.cz', '8baabfa7979b17fb6146ab9037838ccf4d6bd96017fe6c00ecac6ac0bffd3d42', 'f^URtg7AD(nyK.BH]V_Oc,=xm5>@5aggC>eDQ7zO;X=QTQ@vKj', 'web', '123456', 0, 'xeE9VRGY9zA3RbUMaaF36kFwhz7JNA2B');

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

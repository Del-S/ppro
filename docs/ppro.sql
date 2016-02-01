-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 01. úno 2016, 12:58
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

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
(36, 26, 'Ne', '', '#', 0),
(37, 21, 'Hnědá', '', '#', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Vypisuji data pro tabulku `15pick12_gallery`
--

INSERT INTO `15pick12_gallery` (`id_gallery`, `name`, `description`, `id_thumbnail_gallery`) VALUES
(14, 'Divi Galerie', 'Galerie pro šablonu Divi', 16),
(15, 'Extra Galerie', 'Popis', 18),
(16, 'Nexus', 'Nexus', 22),
(17, 'Fusion', 'Fusion', 25),
(18, 'eStore', 'eStore', 28);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Vypisuji data pro tabulku `15pick12_image`
--

INSERT INTO `15pick12_image` (`id_image`, `image_src`, `image_alt`, `description`, `thumbnail_src`, `id_gallery`) VALUES
(13, 'assets/uploads/Divi_builder.png', 'Divi Builder', 'Divi builder umožňuje postavit jakýkoliv vzhled stránek.', 'assets/uploads/thumbnail/Divi_builder.png', 14),
(14, 'assets/uploads/Divi_headers.jpg', 'Vzhled Divi hlaviček', 'Rozdílné možnosti vzhledu vedle sebe.', 'assets/uploads/thumbnail/Divi_headers.jpg', 14),
(15, 'assets/uploads/Divi-2.jpg', 'Divi základní vzhled', '', 'assets/uploads/thumbnail/Divi-2.jpg', 14),
(16, 'assets/uploads/divi-large-3.jpg', 'Šablona Divi', '', 'assets/uploads/thumbnail/divi-large-3.jpg', 14),
(17, 'assets/uploads/Divi-second-design.jpg', 'Druhý vzhled Divi', '', 'assets/uploads/thumbnail/Divi-second-design.jpg', 14),
(18, 'assets/uploads/extra-large.jpg', 'Šablona Extra', '', 'assets/uploads/thumbnail/extra-large.jpg', 15),
(19, 'assets/uploads/Extra-theme.jpg', 'Extra', '', 'assets/uploads/thumbnail/Extra-theme.jpg', 15),
(20, 'assets/uploads/Extra-headers.jpg', 'Hlavičky Extra', '', 'assets/uploads/thumbnail/Extra-headers.jpg', 15),
(21, 'assets/uploads/Extra-blog.jpg', 'Extra Blog', '', 'assets/uploads/thumbnail/Extra-blog.jpg', 15),
(22, 'assets/uploads/nexus-large.jpg', 'Šablona Nexus', '', 'assets/uploads/thumbnail/nexus-large.jpg', 16),
(23, 'assets/uploads/nexus.jpg', 'Nexus', '', 'assets/uploads/thumbnail/nexus.jpg', 16),
(24, 'assets/uploads/nexus-post.jpg', 'Nexus příspěvek', '', 'assets/uploads/thumbnail/nexus-post.jpg', 16),
(25, 'assets/uploads/Fusion-large.jpg', 'Šablona Fusion', '', 'assets/uploads/thumbnail/Fusion-large.jpg', 17),
(26, 'assets/uploads/Fusion.jpg', 'Fusion', '', 'assets/uploads/thumbnail/Fusion.jpg', 17),
(27, 'assets/uploads/Fusion-blog.jpg', 'Fusion blog', '', 'assets/uploads/thumbnail/Fusion-blog.jpg', 17),
(28, 'assets/uploads/eStore-large.jpg', 'Šablona eStore', '', 'assets/uploads/thumbnail/eStore-large.jpg', 18),
(29, 'assets/uploads/eStore.jpg', 'eStore', '', 'assets/uploads/thumbnail/eStore.jpg', 18),
(30, 'assets/uploads/eStore-product.jpg', 'eStore-product', '', 'assets/uploads/thumbnail/eStore-product.jpg', 18);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Vypisuji data pro tabulku `15pick12_template`
--

INSERT INTO `15pick12_template` (`id_template`, `id_gallery`, `id_user`, `name`, `description`, `price_implement`, `price_editing`) VALUES
(1, 15, NULL, 'Extra', '<h2>Informace o šabloně Extra</h2>\r\n<p>Nejnovějších šablon od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>. Tato šablona je hlavně zaměřena na tvorbu blogů a online publikací. Je to druhá šablona využívající Divi builder.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 500),
(2, 14, NULL, 'Divi', '<h2>Informace o šabloně Divi</h2>\r\n<p>Jedna z nejnovějších šablon od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>. Tato šablona jako první představila Divi Builder, díky kterému je možné postavit si stránky podle svého přání.</p>\r\nPomocí rozdělení do sekcí a sloupců je možné postavit jakýkoliv vzhled. Do těchto sekcí se vkládají moduly a každý z těchto modulů má jinou funkci. Divi v této chvíli podporuje přes 40 modulů od slideru, blogu, galerie po cenové tabulky a počítadla.\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2000),
(3, 16, NULL, 'Nexus', '<h2>Informace o šabloně Nexus</h2>\r\n<p>Poslední šablona od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>, která nevyužívá Divi Builder. Tato šablona je hlavně zaměřena na tvorbu magazínů a online publikací.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2500),
(4, 17, NULL, 'Fusion', '<h2>Informace o šabloně Nexus</h2>\r\n<p>Šablona od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>. Tato šablona je hlavně zaměřena na webové stránky podniků a jejich prezentaci.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2500),
(5, 18, NULL, 'eStore', '<h2>Informace o šabloně Nexus</h2>\r\n<p>Jedna ze starších šablon od tvůrců <a href="http://www.elegantthemes.com/" title="Elegant Themes">ElegantThemes</a>. Tato šablona je zaměřena čistě na eshop a prodej produktů.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 3000),
(6, NULL, NULL, 'Vertex', '<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2000),
(7, NULL, NULL, 'Explorable', '<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 2500),
(8, NULL, NULL, 'ePhoto', '<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 3000),
(9, NULL, NULL, 'eGamer', '<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>\r\n<h2>Lorem ipsum</h2>\r\n<p>Čím pana k by indicie měsíců huby? Zesinala té měří a spíž aha čahouni. Řev, předpisu břeh vy se vaší, lezu náš ve obtěžoval loty zalepen nazlobil ptáčka! Dar ó zad zlá u vzniknout, mu docentem, korea mě. Ses za hm mě házeli kočár on peklu. Vlaku nu andrlík dopisovala, bezpráví přivedl, ho číhání, století, dydydy u oč velikým normálně.</p>\r\n<p>Řku se? Zůstaly mu židovská ve květ my močí zesílila mezera. Povím její vážil očí líto káravě sofi. Vzdělaní žít vede u instance jaký frank popisné. Hrát za živý, hotová seď otrávit. Bídu sebebohatší strašlivému vleze. Dycky čaj hocha osm s mokré ne roedlem svědčí.</p>', 500, 3000);

-- --------------------------------------------------------

--
-- Struktura tabulky `15pick12_template_components`
--

CREATE TABLE IF NOT EXISTS `15pick12_template_components` (
  `id_template_components` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_template` bigint(20) NOT NULL,
  `id_component` bigint(20) NOT NULL,
  PRIMARY KEY (`id_template_components`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=343 ;

--
-- Vypisuji data pro tabulku `15pick12_template_components`
--

INSERT INTO `15pick12_template_components` (`id_template_components`, `id_template`, `id_component`) VALUES
(193, 3, 18),
(194, 3, 28),
(195, 3, 31),
(196, 3, 33),
(197, 3, 21),
(198, 3, 25),
(199, 3, 26),
(200, 3, 27),
(201, 3, 22),
(202, 3, 36),
(214, 4, 17),
(215, 4, 20),
(216, 4, 28),
(217, 4, 31),
(218, 4, 33),
(219, 4, 34),
(220, 4, 21),
(221, 4, 25),
(222, 4, 26),
(223, 4, 22),
(224, 4, 35),
(225, 2, 16),
(226, 2, 17),
(227, 2, 18),
(228, 2, 19),
(229, 2, 20),
(230, 2, 28),
(231, 2, 30),
(232, 2, 31),
(233, 2, 33),
(234, 2, 34),
(235, 2, 14),
(236, 2, 25),
(237, 2, 26),
(238, 2, 27),
(239, 2, 22),
(240, 2, 35),
(241, 1, 17),
(242, 1, 18),
(243, 1, 19),
(244, 1, 28),
(245, 1, 31),
(246, 1, 33),
(247, 1, 14),
(248, 1, 25),
(249, 1, 26),
(250, 1, 27),
(251, 1, 22),
(252, 1, 36),
(262, 5, 16),
(263, 5, 20),
(264, 5, 28),
(265, 5, 33),
(266, 5, 21),
(267, 5, 25),
(268, 5, 26),
(269, 5, 23),
(270, 5, 36),
(282, 6, 17),
(283, 6, 20),
(284, 6, 28),
(285, 6, 29),
(286, 6, 33),
(287, 6, 21),
(288, 6, 25),
(289, 6, 26),
(290, 6, 27),
(291, 6, 22),
(292, 6, 35),
(303, 7, 19),
(304, 7, 20),
(305, 7, 28),
(306, 7, 30),
(307, 7, 33),
(308, 7, 21),
(309, 7, 25),
(310, 7, 26),
(311, 7, 22),
(312, 7, 35),
(313, 8, 17),
(314, 8, 19),
(315, 8, 28),
(316, 8, 30),
(317, 8, 33),
(318, 8, 21),
(319, 8, 25),
(320, 8, 26),
(321, 8, 27),
(322, 8, 24),
(323, 8, 36),
(333, 9, 18),
(334, 9, 19),
(335, 9, 28),
(336, 9, 33),
(337, 9, 37),
(338, 9, 21),
(339, 9, 25),
(340, 9, 26),
(341, 9, 23),
(342, 9, 36);

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

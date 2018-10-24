-- <one line to give the program's name and a brief idea of what it does.>
-- Copyright (C) <year>  <name of author>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

--
-- Structure de la table `llx_product_phone_raw`
--

CREATE TABLE IF NOT EXISTS `llx_product_phone_raw` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceName` varchar(200) NOT NULL,
  `Brand` varchar(200) NOT NULL,
  `technology` varchar(48) DEFAULT NULL,
  `gprs` varchar(4) DEFAULT NULL,
  `edge` varchar(5) DEFAULT NULL,
  `announced` varchar(79) DEFAULT NULL,
  `status` varchar(75) DEFAULT NULL,
  `dimensions` varchar(93) DEFAULT NULL,
  `weight` varchar(73) DEFAULT NULL,
  `sim` varchar(75) DEFAULT NULL,
  `type` varchar(94) DEFAULT NULL,
  `resolution` varchar(93) DEFAULT NULL,
  `display_c` varchar(197) DEFAULT NULL,
  `card_slot` varchar(92) DEFAULT NULL,
  `phonebook` varchar(85) DEFAULT NULL,
  `call_records` varchar(85) DEFAULT NULL,
  `camera_c` varchar(12) DEFAULT NULL,
  `alert_types` varchar(130) DEFAULT NULL,
  `loudspeaker_` varchar(45) DEFAULT NULL,
  `sound_c` varchar(179) DEFAULT NULL,
  `wlan` varchar(103) DEFAULT NULL,
  `bluetooth` varchar(39) DEFAULT NULL,
  `gps` varchar(48) DEFAULT NULL,
  `radio` varchar(92) DEFAULT NULL,
  `messaging` varchar(100) DEFAULT NULL,
  `clock` varchar(13) DEFAULT NULL,
  `alarm` varchar(13) DEFAULT NULL,
  `games` varchar(122) DEFAULT NULL,
  `languages` varchar(90) DEFAULT NULL,
  `java` varchar(49) DEFAULT NULL,
  `features_c` varchar(294) DEFAULT NULL,
  `battery_c` varchar(99) DEFAULT NULL,
  `colors` varchar(133) DEFAULT NULL,
  `_2g_bands` varchar(83) DEFAULT NULL,
  `_3_5mm_jack_` varchar(13) DEFAULT NULL,
  `stand_by` varchar(75) DEFAULT NULL,
  `talk_time` varchar(86) DEFAULT NULL,
  `infrared_port` varchar(13) DEFAULT NULL,
  `sar_us` varchar(104) DEFAULT NULL,
  `sar_eu` varchar(104) DEFAULT NULL,
  `browser` varchar(85) DEFAULT NULL,
  `memory_c` varchar(259) DEFAULT NULL,
  `sensors` varchar(122) DEFAULT NULL,
  `cpu` varchar(79) DEFAULT NULL,
  `internal` varchar(104) DEFAULT NULL,
  `size` varchar(96) DEFAULT NULL,
  `os` varchar(114) DEFAULT NULL,
  `keyboard` varchar(16) DEFAULT NULL,
  `primary_` varchar(105) DEFAULT NULL,
  `video` varchar(48) DEFAULT NULL,
  `secondary` varchar(74) DEFAULT NULL,
  `usb` varchar(78) DEFAULT NULL,
  `chipset` varchar(74) DEFAULT NULL,
  `network_c` varchar(89) DEFAULT NULL,
  `body_c` varchar(106) DEFAULT NULL,
  `speed` varchar(81) DEFAULT NULL,
  `_3g_bands` varchar(71) DEFAULT NULL,
  `features` varchar(91) DEFAULT NULL,
  `loudspeaker` varchar(77) DEFAULT NULL,
  `audio_quality` varchar(75) DEFAULT NULL,
  `protection` varchar(43) DEFAULT NULL,
  `music_play` varchar(37) DEFAULT NULL,
  `camera` varchar(35) DEFAULT NULL,
  `gpu` varchar(35) DEFAULT NULL,
  `multitouch` varchar(40) DEFAULT NULL,
  `_4g_bands` text,
  `display` varchar(95) DEFAULT NULL,
  `nfc` varchar(13) DEFAULT NULL,
  `performance` varchar(220) DEFAULT NULL,
  `build` varchar(220) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `sar` varchar(100) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `rowid` (`rowid`),
  UNIQUE KEY `unk_DeviceName_Brand` (`DeviceName`,`Brand`) COMMENT 'contrainte d''uniciter entre DeviceName et Brand'
)



--
-- Structure de la table `llx_product_phone`
--

CREATE TABLE IF NOT EXISTS `llx_product_phone` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(100) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `os_version_name` varchar(100) NOT NULL,
  `screen_resolution` varchar(100) NOT NULL,
  `phone_size` varchar(100) NOT NULL,
  `phone_weight` varchar(100) NOT NULL,
  `primary_camera_resolution` varchar(100) NOT NULL,
  `secondary_camera_resolution` varchar(100) NOT NULL,
  `cpu_number` varchar(255) NOT NULL,
  `cpu_speed` varchar(100) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `interne_memory` varchar(255) NOT NULL,
  `connexion_type` text NOT NULL,
  `battery_capacity` varchar(100) NOT NULL,
  `phone_color` varchar(255) NOT NULL,
  `sim1_format` varchar(100) NOT NULL,
  `sim2_format` varchar(100) NOT NULL,
  `dual_sim` varchar(200) NOT NULL,
  `fk_product_phone_raw` varchar(255) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `fk_product_phone_raw` (`fk_product_phone_raw`)
);


--
-- Structure de la table `llx_product_phone_product`
--

CREATE TABLE IF NOT EXISTS `llx_product_phone_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_phone_raw` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unk_productphone_product` (`fk_product_phone_raw`,`fk_product`)
);


--
-- Structure de la table `llx_c_product_phone_filter`
--

CREATE TABLE IF NOT EXISTS `llx_c_product_phone_filter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(250) NOT NULL,
  `type` enum('select','text','checkbox','button','radio') CHARACTER SET utf8 NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
);
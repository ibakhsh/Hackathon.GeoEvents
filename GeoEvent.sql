-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2017 at 03:00 PM
-- Server version: 5.6.24
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `GeoEvent`
--

-- --------------------------------------------------------

--
-- Table structure for table `GEO_DATA`
--

CREATE TABLE IF NOT EXISTS `GEO_DATA` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COORDINATES` varchar(4000) DEFAULT NULL,
  `LONGITUDE` float(30,15) DEFAULT NULL,
  `LATITUDE` float(30,15) DEFAULT NULL,
  `ELEMENT_TYPE` varchar(1000) NOT NULL,
  `RESOURCE_TYPE` int(11) NOT NULL,
  `GEO_LAYER` int(11) NOT NULL,
  `CATEGORY_TAGS` longtext,
  `PIC_URL` varchar(1000) DEFAULT NULL,
  `HASH_TAGS` varchar(4000) DEFAULT NULL,
  `OTHER_INFO` longtext,
  `JSON_DATA` longtext,
  `WIKI_URL` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GEO_DATA`
--

INSERT INTO `GEO_DATA` (`ID`, `TITLE`, `DESCRIPTION`, `COORDINATES`, `LONGITUDE`, `LATITUDE`, `ELEMENT_TYPE`, `RESOURCE_TYPE`, `GEO_LAYER`, `CATEGORY_TAGS`, `PIC_URL`, `HASH_TAGS`, `OTHER_INFO`, `JSON_DATA`, `WIKI_URL`) VALUES
(1, 'Mammoth Mountain volcano', 'Mammoth Mountain is a lava-dome complex on the SW rim of Long Valley caldera, California. Despite its close geographic relation, it is believed that it has its own magma chamber different from the ones underlying Long Valley caldera and the Inyo craters. ', '37.63°N / -119.03°W ', 37.630001068115234, -119.029998779296880, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'Golden Trout Creek volcano', 'The Golden Trout Creek volcanic field consists of a group of cinder cones and lava flows in the Toowa Toowa valley of the Sierra Nevada, California, about 25 km south of Mount Whitney. \r\nToowa valley is a broad and open valley about 8600 feet high, dotted with cones rising 100-200 m above the valley floor. 4 volcanic centers have been identified at the Golden Trout Creek volcanic field.', '36.36°N -118.32°W ', 36.360000610351560, 118.319999694824220, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(5, 'Mount Davidson', 'Is the highest natural point in San Francisco.It is located near the geographical center of the city', '37°44′18″N 122°27′12″W', 37.000000000000000, 122.000000000000000, '4', 0, 1, NULL, NULL, NULL, NULL, NULL, ''),
(6, 'Mount Davidson', 'Is the highest natural point in San Francisco.It is located near the geographical center of the city', '37°44′18″N 122°27′12″W', -122.455528259277340, 37.738338470458984, '4', 0, 1, NULL, NULL, NULL, NULL, NULL, ''),
(7, '.Coso volcano', 'The Coso volcanic field is located east of the Sierra Nevada Range at the western edge of the Basin and Range province, California. It consists of 38 old rhyolitic lava domes and basaltic cinder cones covering a 400 sq km area. volcano is located 200 km north of Los Angeles, California. ', '36.03°N -117.82°W ', 36.029998779296875, 17.819999694824220, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(8, 'Santa Clara volcano', ' The Santa Clara volcanic field is volcanic area north of St. George in SW Utah, which has been active since abaout 4 million years ago. It contains numerous cinder cones and lava flows. \r\nThe Santa Clara lava flow was erupted from 2 young cider cones above Snow Canyon about 10-20,000 years ago and is one of the youngest lava flows in the Colorado Plateau/Basin and Range region. The almost unvegetated lava flow extends 16 km to the south down Snow Canyon, excavated through rocks of the colorful Navajo Sandstone.\r\n', '37.26°N -113.63°W ', 37.259998321533200, 113.629997253417970, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(9, 'Kolob volcano', ' Kolob is a volcanic field in Zion National Park, Utah. It contains a chain of cinder cones and lava flows, the youngest one being the cinder cones in Diamond Valley. Other famous features of the area include the Kolob Canyons, Kolob Plateau, and Kolob Arch.', '37.33°N -113.12°W ', 37.330001831054690, -113.120002746582030, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(10, 'Bald Knoll volcano', 'Bald Knoll is the youngest of a group of basaltic cinder cones on the SW part of the Paunsaugunt Plateau in southern Utah, between the southern end of Bryce Canyon National Park and the western margin of Grand Staircase-Escalante National Monument. \r\nThe Bald Knoll cinder cone probably erupted only a few thousands years ago. It has an intact crater, which has produced a massive youthful-looking lava flow that traveled about 12 km to the SSE.', '37.33°N -112.41°W', 37.330001831054690, 112.410003662109380, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(11, '. Black Rock Desert volcano', 'The Black Rock Desert volcanic field of a group of small volcanic fields in south central Utah, at the eastern margin of the Great Basin. It is the youngest volcanic area in Utah and contains both Utah''s youngest known rhyolite dome (0.4 million years old) and its youngest lava flows, the roughly 660-year-old Ice Springs lava flows, located at Ice Springs, 15 km west of Meadow. These lava flows extend 4 km north and west from Black Rock Station.', '38.97°N  -112.5°W ', -116.893951416015620, 39.855232238769530, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(12, '9. Dotsero volcano', 'The small Dotsero maar in NW Colorado, 2 km NE of the small town Dotsero, near the junction of the Colorado and Eagle Rivers west of the Gore Range, is the only volcano in Colorado that has had activity in the past 10,000 years. \r\nIt erupted ca. 4000 years ago, producing an explosion crater (maar), lahars, and a 3 km long lava flow. \r\nThe crater of Dotsero is 700 m in diameter and 400 m deep with a flat floor covered by debris. It exposes a lithic-rich pyroclastic deposit, a strombolian scoria-fall deposit, lahars deposits, and a lava flow. ', '39.66°N -107.04°W  ', 39.659999847412110, 107.040000915527340, '3', 0, 0, NULL, NULL, NULL, NULL, NULL, ''),
(14, 'Pacific Coast Ranges', 'North America from Alaska south to Northern and Central Mexico.', '44°30′15.1″N 123°33′04.1″W', -117.640907287597660, 41.840984344482420, '4', 0, 1, NULL, NULL, NULL, NULL, NULL, ''),
(15, 'Death Valley National Park', 'Vast national park with over 3.4 million acres of desert & mountains for hiking, camping & biking.', '36°30''18.7"N 117°04''45.4"W\r\n', -117.081604003906250, 36.505393981933594, '6', 0, 1, 'mountains , ghosts , parks ', NULL, NULL, NULL, NULL, ''),
(16, 'Grand Staircase-Escalante National Monument', '1.7 million-acres of diverse, rugged terrain with opportunities for camping, hunting & hiking.', '37.334866, -110.983479', -111.073455810546880, 37.354675292968750, '6', 0, 1, 'mountain , park ', NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE`
--

CREATE TABLE IF NOT EXISTS `RESOURCE` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `TYPE` varchar(11) NOT NULL,
  `URL` varchar(1000) NOT NULL,
  `API_KEY` varchar(2000) NOT NULL,
  `USER_ID` varchar(200) NOT NULL,
  `PWD` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RESOURCE`
--

INSERT INTO `RESOURCE` (`ID`, `NAME`, `TYPE`, `URL`, `API_KEY`, `USER_ID`, `PWD`) VALUES
(1, 'Manual Entries', 'NONE', '', '', '', ''),
(2, 'Nasa Api', 'csv', 'https://airbornescience.nasa.gov', 'use your own', '', ''),
(3, 'Connecticute open data', 'json', 'https://data.ct.gov/resource/y6p2-px98.json?category=Fruit&item=Peaches', 'use your own', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GEO_DATA`
--
ALTER TABLE `GEO_DATA`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RESOURCE`
--
ALTER TABLE `RESOURCE`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GEO_DATA`
--
ALTER TABLE `GEO_DATA`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `RESOURCE`
--
ALTER TABLE `RESOURCE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

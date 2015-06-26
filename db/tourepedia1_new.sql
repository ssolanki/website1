-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2015 at 02:17 PM
-- Server version: 5.5.41-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tourepedia1`
--

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE IF NOT EXISTS `attractions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(200) NOT NULL,
  `places_id` int(11) NOT NULL,
  `attraction_about` varchar(500) NOT NULL,
  `attraction_timeSpan` varchar(200) NOT NULL,
  `attraction_cost` varchar(200) NOT NULL,
  `attraction_image` varchar(200) NOT NULL,
  `attraction_postalCode` varchar(20) NOT NULL,
  `attraction_overall_rating` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `attractions`
--

INSERT INTO `attractions` (`id`, `attraction_name`, `places_id`, `attraction_about`, `attraction_timeSpan`, `attraction_cost`, `attraction_image`, `attraction_postalCode`, `attraction_overall_rating`) VALUES
(1, 'Beas Kung', 1, 'Considered to be the birthplace of River Beas, Beas Kund is as breathtaking as it is astonishing. It is said sage Rishi Vyas took his daily bath here. The igloo like stone formation at the kund is the starting point for a number of treks, including Friendship and Hanuman Tibba peaks.', '06:00 AM - 06:00 PM', '', 'assets/images/manali/beas-kund/img1.jpg', '', 0),
(2, 'Hadimba Temple', 1, 'It is assumed that The Hidimba Devi temple is built around a cave where Hidimba performed meditation. The tower consists of three square roofs covered with timber tiles and a fourth brass cone-shaped roof at the top. The earth goddess Durga forms the theme of the main door carvings.The temple base is made out of whitewashed, mud-covered stonework.\nNOTE: This is a religious site. Please respect that fact and do not dress inappropriately.\n', '08:00 AM - 06:00 AM', '', 'assets/images/manali/hadimba-temple/img1.jpg', '', 0),
(3, 'Kullu', 1, 'Kullu is a broad open valley formed by the Beas river between Manali and Largi. This valley is famous for its temples, beauty and its majestic hills covered with Pine and Deodar Forest and sprawling Apple Orchards. Kullu valley is sandwiched between the Pir Panjal, Lower Himalayan and Great Himalayan range.', '24x7 Hrs', '', 'assets/images/manali/kullu/img1.jpg', '', 0),
(4, 'Rohtang Pass', 1, 'Rohtang pass is an adventure tourist site where it can be cold even on a summer day. It is the highest point on the Manali-Keylong road and provides a wide panoramic view of mountains rising far above clouds, which is truly breath taking. Close by is a small lake called Dassaur Lake. Beas Kund, the source of river Beas, is also nearby. In winter, the road of Rothang Pass is closed. If you are an adventure freak, you are in for a pleasant surprise as Rohtang Pass makes for some smashing adrenalin', '24x7 Hrs except Tuesday.', '', 'assets/images/manali/rohtang-pass/img1.jpg', '', 0),
(5, 'Solang Valley', 1, 'Solang Valley gives you stunning views of the snow capped peaks and beautiful glaciers. If you are in an adventurous mood, indulge in some skiing, paragliding or exciting ATB rides. There are a bundle of surprises in store for kids as well.\nIt is also an awesome picnic spot. There are innumerable shops selling delicious snacks.\n', '10:00 AM - 06:00 PM', 'Entry Fees: Rs 500 per person for zorbing \n RS 1,200 per person for paragliding \n Rs 500 per person for ropeway (both side\n', 'assets/images/manali/solang-valley/img1.jpg', '', 0),
(6, 'Van Vihar', 1, 'Away from the hustle bustle of the busy market, this protected piece of land is maintained by government authorities. The vast forest area has a children''s park complete with swings and slides and a small man made pond for boating. the Van Vihar is a perfect place to relax and rejuvenate.\n', '08:00 AM - 07:00 PM\n', 'Entry Fees: 10 Rs Per Person', 'assets/images/manali/van-vihar/img1.jpg', '', 0),
(7, 'Vashishta Hot Springs', 1, 'Soak yourself in Vashist Hot Water Sulphur Springs (across the famous Beas river) and feel the magic. The place has several modern bathrooms with Turkish style showers(connected to the spring through pipes). It is flocked by visitors who want to benefit from the medicinal properties of the sulphur spring as it is said to cure a number of skin allergies and other ailments.', '7:00 AM - 1:00 PM , \n2:00 PM - 10:00 PM\n', '', 'assets/images/manali/vashishta-hot-springs/img1.jpg', '', 0),
(8, 'Kasol', 1, 'Kasol, like many other Himalayan destinations, haunts you and invites you again and again. The\n\ndense pinewood-covered forests with little villages tucked in cosy corners make the topography all the \n\nmore exciting and is well-complimented by the fierce flow of the Parvati accompanying you from \nBhuntur.', 'Day time', '', 'assets/images/manali/vashishta-hot-springs/img1.jpg', '', 0),
(9, 'Manikaran', 1, 'Manikaran is located in the Parvati Valley between the rivers Beas and Parvati, northeast of Bhuntar in the Kullu District of Himachal Pradesh. It is at an altitude of 1760 m and is located about 45 km from Kullu.\n\nThis small town attracts tourists visiting Manali and Kullu to its hot springs and pilgrim centres. An experimental geothermal energy plant has also been set up here.', 'Day time', '', 'assets/images/manali/vashishta-hot-springs/img1.jpg', '', 0),
(10, 'Vashishta Hot Springs', 2, 'Soak yourself in Vashist Hot Water Sulphur Springs (across the famous Beas river) and feel the magic. The place has several modern bathrooms with Turkish style showers(connected to the spring through pipes). It is flocked by visitors who want to benefit from the medicinal properties of the sulphur spring as it is said to cure a number of skin allergies and other ailments.', '7:00 AM - 1:00 PM , \r\n2:00 PM - 10:00 PM\r\n', '', 'assets/images/manali/vashishta-hot-springs/img1.jpg', '', 0),
(11, 'Vashishta Hot Springs', 2, 'Soak yourself in Vashist Hot Water Sulphur Springs (across the famous Beas river) and feel the magic. The place has several modern bathrooms with Turkish style showers(connected to the spring through pipes). It is flocked by visitors who want to benefit from the medicinal properties of the sulphur spring as it is said to cure a number of skin allergies and other ailments.', '7:00 AM - 1:00 PM , \r\n2:00 PM - 10:00 PM\r\n', '', 'assets/images/manali/vashishta-hot-springs/img1.jpg', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attractions_images`
--

CREATE TABLE IF NOT EXISTS `attractions_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attractions_id` int(11) NOT NULL,
  `image_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `attractions_images`
--

INSERT INTO `attractions_images` (`id`, `attractions_id`, `image_name`) VALUES
(1, 1, 'assets/images/manali/beas-kund/img2.jpg'),
(2, 1, 'assets/images/manali/beas-kund/img3.jpg'),
(3, 1, 'assets/images/manali/beas-kund/img4.jpg'),
(4, 2, 'assets/images/manali/hadimba-temple/img2.jpg'),
(5, 2, 'assets/images/manali/hadimba-temple/img3.jpg'),
(6, 3, 'assets/images/manali/kullu/img2.jpg'),
(7, 3, 'assets/images/manali/kullu/img3.jpg'),
(8, 4, 'assets/images/manali/rohtang-pass/img2.jpg'),
(9, 4, 'assets/images/manali/rohtang-pass/img3.jpg'),
(10, 5, 'assets/images/manali/solang-valley/img2.jpg'),
(11, 5, 'assets/images/manali/solang-valley/img3.jpg'),
(12, 5, 'assets/images/manali/solang-valley/img4.jpg'),
(13, 6, 'assets/images/manali/van-vihar/img2.jpg'),
(14, 6, 'assets/images/manali/van-vihar/img3.jpg'),
(15, 7, 'assets/images/manali/vashishta-hot-springs/img2.jpg'),
(16, 7, 'assets/images/manali/vashishta-hot-springs/img3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `attractions_reviews`
--

CREATE TABLE IF NOT EXISTS `attractions_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attractions_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL,
  `user_comment` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `our_trips`
--

CREATE TABLE IF NOT EXISTS `our_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_name` varchar(200) NOT NULL,
  `trip_place` varchar(200) NOT NULL,
  `trip_tavelling` varchar(500) NOT NULL,
  `trip_stay` varchar(500) NOT NULL,
  `trip_timeSpan` int(11) NOT NULL,
  `trip_cost` int(11) NOT NULL,
  `trip_avg_temp` varchar(50) NOT NULL,
  `trip_sea_level` varchar(50) NOT NULL,
  `trip_overall_rating` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `our_trips_images`
--

CREATE TABLE IF NOT EXISTS `our_trips_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `our_trips_id` int(11) NOT NULL,
  `image_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `our_trips_reviews`
--

CREATE TABLE IF NOT EXISTS `our_trips_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `our_trips_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL,
  `user_comment` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(200) NOT NULL,
  `place_region_id` int(11) NOT NULL,
  `place_region_name` varchar(200) NOT NULL,
  `place_state` varchar(200) NOT NULL,
  `place_avg_temp_winter` varchar(200) NOT NULL,
  `place_avg_temp_summer` varchar(200) NOT NULL,
  `place_sea_level` varchar(200) NOT NULL,
  `place_idealNo_days` varchar(20) NOT NULL,
  `place_ideal_budget` int(11) NOT NULL,
  `place_img` varchar(200) NOT NULL,
  `place_latitude` varchar(200) NOT NULL,
  `place_longitude` varchar(200) NOT NULL,
  `place_about` varchar(500) NOT NULL,
  `place_feeling` varchar(500) NOT NULL,
  `place_overall_rating` float NOT NULL,
  `place_near_by_places` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `place_name`, `place_region_id`, `place_region_name`, `place_state`, `place_avg_temp_winter`, `place_avg_temp_summer`, `place_sea_level`, `place_idealNo_days`, `place_ideal_budget`, `place_img`, `place_latitude`, `place_longitude`, `place_about`, `place_feeling`, `place_overall_rating`, `place_near_by_places`) VALUES
(1, 'Manali', 1, 'Himachal Pardesh', 'Himachal Pardesh', '-5 to 15', '10 to 25', '6726 Feet ', '3 to 5', 6500, 'img1.jpg', '0', '0', 'Manali is a high-altitude Himalayan resort located nearly 250 km from Shimla and a definite delight to tourist from any corner of the world. It has a reputation as a backpacking center and honeymoon destination. Manali acts as the gateway for skiing and trekking in the Solang and the Parvati valley respectively', 'Manali is a high-altitude Himalayan resort located nearly 250 km from Shimla and a definite delight to tourist from any corner of the world. It has a reputation as a backpacking center and honeymoon destination. Manali acts as the gateway for skiing and trekking in the Solang and the Parvati valley respectively', 0, ''),
(2, 'Kasol-manikaran', 1, 'Himachal Pardesh', 'Himachal Pardesh', '4 to 14', '20 to 30', '5380 Feet', '2 to 5', 6000, 'assets/images/places/kasoli/Photos/img1.jpg', '0', '0', 'Kasol, a tender village lying in the Parvati valley is an exquisite off beat tourist\n\nlocation to ward off heat of the summers. Kasol is the only place place you get to find native Israelis in \n\nIndia. Manikaran is famous for its Gurudwaras and hot water springs.', 'India is one of the most densely populated countries in the world, but Kasol is the place where you can \n\nfind calmness at its zenith and the environment adds to pleasures you are bound to receive. You find \n\nyourself hugged by mother nature when you are in Kasol.', 0, ''),
(3, 'Shimla', 1, 'Himachal Pardesh', 'Himachal Pardesh', '-2 to 8', '15 to 30', '8408 Feet', '3 to 5', 6000, 'assets/images/places/shimla/Photos/img1.jpg', '', '', 'Once the summer capital of the British raj, Shimla is currently the capital of Himachal Pradesh and an attractive tourist location especially during the sultry summers faced by a major part of India. Traffic is banned from the central part of town, so walking anywhere is pleasant due to the soothing weather. A beautiful romantic date is also up on the line considering the rainy conditions outside giving an immense moment of happiness for you and your partner.', 'The mesmerizing beauty of the hills, monkeys squealing outside your hotel window enhance the thrill that a tourist is expected to experience at Shimla. Suddenly the shrill blast of a whistle announces the departure of the so called "toy train", a ride on which would definitely take you on cloud nine. It''s always a fun to ride on a horseback into the surrounding hills where British grandees once had their retreats. The steamed momos with the Kufri snowfall in sight is a delight that many long for', 0, ''),
(4, 'Darjeeling', 2, 'North East', 'West Bengal', '2.5 to 10', '11 to 19', '7000 Feet', '3 to 5', 6500, 'assets/images/north-east/Darjeeling/Photos/img1.jpg', '', '', 'Darjeeling is a town in India''s West Bengal state, in the Himalayan foothills. Once a summer resort for the British Raj elite, it remains the terminus of the narrow-gauge Darjeeling Himalayan Railway, or “Toy Train,” completed in 1881. It''s famed for the distinctive black tea grown on plantations that dot its surrounding slopes. Its backdrop is Mt. Kanchenjunga, among the world’s highest peaks.', 'The eerie feeling you get when surrounded by the mystic clouds everywhere is worth a lifetime. The \n\ngolden sunset shimmering the hill tops and the beautiful green tea fields enhanced by the silvery lined \n\nclouds is a moment you can always desire. The toy train rides of Darjeeling are one of the sweetest \n\ntourist hacks in the country.', 0, ''),
(5, 'Gangtok ', 2, 'North East', 'Sikkim', '-5 to 16', '10 to 28', '5200 Feet', '3 to 5', 6500, 'assets/images/north-east/Gangtok/Photos/img1.jpg', '', '', 'The capital of the state of Sikkim, Gangtok is an attractive tourist destination, reflecting a unique ambience which derives from its happy blend of tradition and modernity. Alongside the deeply felt presence of stupas and monasteries, Gangtok also bustles like any other thriving town.', '', 0, ''),
(6, 'Dalhousie-khajjiar', 1, 'Himachal Pardesh', 'Himachal Pardesh', '1 to 10', '14 to 31', '6460 Feet', '2 to 4', 6000, 'assets/images/places/Dalhousie-khajjiar/Photos/img1.jpg', '', '', '', '', 0, ''),
(7, 'Tawang', 2, 'North East', 'Arunachal Pradesh', '10 to 20', '15 to 25', '10000 Feet', '6 to 8', 12000, 'assets/images/north-east/Tawang/Photos/img1.jpg', '', '', 'Tawang district is one of the 16 administrative districts of Arunachal Pradesh in northeastern\n\nIndia. The beautiful Sela Pass along with its snow-capped hills surrounding and the splendid Sela lake are \n\na set-piece example of the beauty of nature. The Tawang monasteries are well renowned all across the \n\ncountry and attract tourist throughout the year.', 'A breath taking travel experience from Guwahati to Tawang via Bhalukpong, Dirang, Bomdila and the \n\nSela pass is an exquisite delight and gives the sensation of heavenly feeling on earth. The wildlife \n\ndiversity present in Tawang will never fail to mesmerize you and add to every bits and pieces to make \n\nthis trip memorable.', 0, ''),
(8, 'Shillong-cherrapunjee', 2, 'North East', 'Meghalaya', '-1 to 5', '15 to 24', '4908 Feet', '3 to 5', 7500, 'assets/images/north-east/Shillong-cherrapunjee/Photos/img1.jpg', '', '', 'Shillong is often termed as ‘The Scotland of the East’ and ‘The Abode of the Clouds’ is one\n\nthe major tourist destinations embarking the north-eastern region of India. Located above 1500m from \n\nmean sea level and the highest point being nearly 2000m make Shillong an ideal place for trekking and \n\ncamping. Shillong is often called as the ‘Rock capital of India’ due to the interest of the locales in Rock \n\nmusic.', 'A talk to the locales, the beautiful waterfalls and the serene lakes extempore out the jubilance of the \n\nplace and can run fresh blood even through coldest parts of your body. The monsoon can so soothing in \n\nShillong that you are also bound to call it the abode of the rain Gods as many have already done so.', 0, ''),
(9, 'Guwahati', 2, 'North East', 'Assam', '10 to 30', '20 to 32', '800 Feet', '3 to 5', 7500, 'assets/images/north-east/Guwahati/Photos/img1.jpg', '', '', '', '', 0, ''),
(10, 'Jaipur', 3, 'Rajasthan', 'Rajasthan', '5 to 15', '25 to 45', '1417 Feet', '3 to 5', 6000, 'assets/images/Rajasthan/Jaipur/Photos/img1.jpg', '', '', 'The older portion of the city is embarked with buildings painted in pink, hence the name ‘The\n\nPink City’. The confluence of color, culture, terrains and art has earned Jaipur the reputation of ‘Paris of \n\nthe East’. The local Rajasthani food when brought in with the combination of the dance culture available \n\nthere is a touch of the finest sensations to the human perception.', 'The architectural quality of the palaces and the forts available there can just smote you with the \n\nrealization as to the level of skill the world would have had 500 years ago. The forts are a clear depiction \n\nto the royal Rajputana culture still worn by the Rajasthanis with pride. The market place and the \n\nhandicrafts of Jaipur are famous all over the country and are fast gaining popularity in the foreign \n\nmarket.', 0, ''),
(11, 'Udaipur', 3, 'Rajasthan', 'Rajasthan', '12 to 28', '28 to 38', '1900 Feet', '3 to 5', 6000, 'assets/images/Rajasthan/Udaipur/Photos/img1.jpg', '', '', 'Udaipur, though a small city in Rajasthan was formerly the capital of the Rajput kingdom of\n\nMewar. The scenic beauty of the place has earned it the reputation of “The Venice of the East.” Udaipur \n\nis also known as the city of Lakes due to the numerous beautiful lakes placed in the location making it an \n\nideal place to relax after a tiresome period of continuous grilling.', 'The blend of the vibrant culture, marvelous architecture, the mesmerizing beauty of the lakes and the \n\nAravalli hills serve as delight to the tourists thus making it voted as the world’s best city in travel poll. \n\nThe places to visit in Udaipur are never ending and each place being more exciting than the other.', 0, ''),
(12, 'Mount_Abu', 3, 'Rajasthan', 'Rajasthan', '5 to 28', '31 to 34', '4003 Feet', '2 to 4 ', 6000, 'assets/images/Rajasthan/Mount_Abu/Photos/img1.jpg', '', '', 'Mount Abu is a popular hill station in the Aravalli Range in Sirohi district of Rajasthan state in\n\nwestern India near the border with Gujarat. The famous Bailey walk is a walk from the Nakki Lake to \n\nsunset point and the overnight hiking at the Gurushikar peak are some of the major delights of Mt. Abu.', 'People who have been to Mt. Abu often describe it as the Kashmir of Rajasthan. Temperature can fall \n\nbelow 0 degrees in the winter months. So Rajasthan depicting the hot climate of the deserts provides a \n\ncontrasting feeling when in Mt. Abu. The sunset at Mt. Abu with the increasing strength of the winds \n\nand diminishing intensity leaves you with very few lines or rather nothing to be able to describe it in \n\nwords.', 0, ''),
(13, 'Jaisalmer', 3, 'Rajasthan', 'Rajasthan', '7 to 24', '25 to 42', '731 Feet', '2 to 4', 5500, 'assets/images/Rajasthan/Jaisalmer/Photos/img1.jpg', '', '', 'Jaisalmer is named after Maharawal Jaisal Singh, a Rajput king who founded the city in 1156\n\nAD. "Jaisalmer" means "the Hill Fort of Jaisal". It is referred to as the Golden city of India. The pink and \n\nthe red forts along with the royal palaces highlight the exuberance of this place. Areas around Jaisalmer \n\nshow you that India lags no behind the Arabs in “dune racing” and “off-roading”.', 'The name of Jaisalmer is enough to tick the charm and vibrance in the eyes of a traveler. The Arabic \n\nnights dance, the sand dunes, the desert safari and the camel rides in the hearts of the famous Thar \n\ndesert are a definite moment of capture for lifelong memories.', 0, ''),
(14, 'Rishikesh', 4, 'Uttrakhand', 'Uttrakhand', '10 to 30', '35 to 45', '1745 Feet', '2 to 4', 5500, 'assets/images/Uttrakhand/Rishikesh/Photos/img1.jpg', '', '', '. Located in the foothills of the Himalayas in northern India, it is known as The Gateway to\n\nthe Garhwal Himalayas and the yoga capital. Rishikesh is also the adventure capital of India. The famous \n\ntemples in Rishikesh has earned it the reputation of a spiritual place. The floods in Uttarakhand in 2103 \n\nhad caused a hindrance to the travelers but Rishikesh was open to the tourists again in 6 months’ time.', 'The adventure capital of India should not need much of an introduction as to the adrenaline rush you \n\nare bound to experience there. The very famous sports include bungee jumping, flying fox, river rafting \n\nand paragliding that would take to a new level of thrill. Despite these adventure activities the serene \n\nenvironment of Rishikesh will soothe your mind and keep you relaxed.', 0, ''),
(15, 'Nainital', 4, 'Uttrakhand', 'Uttrakhand', '-3 to 15', '10 to 25', '6837 Feet', '2 to 4', 5500, 'assets/images/Uttrakhand/Nainital/Photos/img1.jpg', '', '', 'It is a Himalayan resort town set around the pear shaped Nainital Lake. Being a hill station\n\nthis destination is very popular for the tourists residing the Ganges plain belt. The Naini Lake is believed \n\nto one of the Shakti-peeths adding to the religious serenity of the place. There are a number of libraries \n\nin the Nainital area. Among them are the Durga Lal Shah Municipal Public Library.', 'The sunset at the Naini Lake providing a golden touch to the trees around reflects the multi-colored \n\nbeauty of the nature. The Naina peak, being the highest peak of Nainital provides a panoramic view of \n\nthe snow-capped Himalayas. The delight of shopping reaches an entirely new level at the Mall Road in \n\nNainital.', 0, ''),
(16, 'Mussoorie', 4, 'Uttrakhand', 'Uttrakhand', '-1 to 10', '20 to 37', '4475 Feet', '3 to 4', 5500, 'assets/images/Uttrakhand/Mussoorie/Photos/img1.jpg', '', '', 'Referred to as the ‘Queen of Hills’, Mussoorie was  once a part of Nepal under Garhwal\n\nregion and still lying in the Garhwal region claimed to be part of Greater Nepal. It is called the \n\n"Gateway" to Yamunotri and Gangotri Shrines of Northern India. Its name is derived from the berry-\n\ncovered Mansur shrub found in abundance around this trekker-friendly area.', 'The scenic beauty of the hills when viewed from the Doon valley along with the deodar trees make us \n\nreflect about the contrast of the artificial life we have created for ourselves and the life that nature has \n\non the offer. The trekking is the best way to feel the beauty of the place and it is enhanced when done in \n\ndrizzle.', 0, ''),
(17, 'Agra', 5, 'Others', 'Uttar pradesh', '2 to 8', '30 to 50', '554 Feet', '2 to 3', 5000, 'assets/images/Others/Agra/Photos/img1.jpg', '', '', 'Situated on the banks of river Yamuna, Agra stands as the trademark tourist destination, or\n\nbetter described as the ambassador of Indian tourism. It is in fact the 1st place that heads into the mind \n\nwhen a foreigner remembers an Indian tour. The famous Taj Mahal of Agra is currently the 1st wonder of \n\nthe world and is regarded as the most perfect jewel of Muslim art in India.', 'A visit to Taj Mahal with your special one ignites the relationship you share, such is the power of this \n\nbeautiful architecture. Fatehpur Sikri, a small city created by the Mughals lies near Agra and is the jewel \n\nof a creation by the Mughals in India.', 0, ''),
(18, 'Amritsar', 5, 'Others', 'Punjab', '3 to 10', '35 to 50', '718 Feet', '2 to 3', 5000, 'assets/images/Others/Amritsar/Photos/img1.jpg', '', '', 'It is home to the Harmandir Sahib (commonly known as the Golden Temple), the spiritual\n\nand cultural center for the Sikh religion. This important Sikh shrine attracts more visitors than the Taj \n\nMahal with more than 100,000 visitors on week days alone and is the most popular destination for non-\n\nresident Indians (NRI) in the whole of India. Apart from the Golden Temple this place also holds the \n\nJallianwalah Bagh, encompassing the famous shootout by Gen. Dyer.', 'Apart from the spirituality this place has enough to arouse the patriotic you. What could the tensions \n\nbetween India and Pakistan be like? A priceless witness at the Indo-Pak border with both sides \n\nscreaming their bugles and the flag exchange ceremony in the retreating rays of the sun. Could take you \n\nto the historic Indo-Pak matches with last ball finishes.', 0, ''),
(19, 'Chandigarh', 5, 'Others', 'Punjab', '4 to 14', '37 to 44', '1053 Feet', '2 to 3', 5000, 'assets/images/Others/Chandigarh/Photos/img1.jpg', '', '', 'Chandigarh, also known as The City Beautiful, is a city and a union territory in the\n\nnorthern part of India that serves as the capital of the states of Punjab and Haryana. Chandigarh was the \n\nfirst planned city of India post-independence. You can also refer to Chandigarh as the modern beauty of \n\nIndia. A visit to Chandigarh invites for a taste to the Punjabi dishes.', '', 0, ''),
(20, 'Khajuraho', 5, 'Others', 'Madhya Pradesh', '-4 to 10', '35 to 45', '843 Feet', '2 to 3', 5000, 'assets/images/Others/Khajuraho/Photos/img1.jpg', '', '', 'A UNESCO world heritage site in central India, Khajuraho is a famous tourist and\n\narchaeological site known for its sculptured temples dedicated to Shiva, Vishnu, and Jain patriarchs. \n\nKhajuraho contains over 70 temples with erotic cravings on the wall make it one of the perfect places to \n\nvisit with your special one.', '', 0, ''),
(21, 'Pachmarhi', 5, 'Others', 'Madhya Pradesh', '9 to 28', '24 to 37', '3555 Feet', '2 to 4', 6000, 'assets/images/Others/Pachmarhi/Photos/img1.jpg', '', '', 'Pachmarhi is a hill station in Madhya Pradesh state of central India. It has been the\n\nlocation of a cantonment (Pachmarhi Cantonment) since British Raj.[2] It is widely known as Satpura ki \n\nRani ("Queen of Satpura"), situated at a height of 1100 m in a valley of the Satpura Range. Pachmarhi \n\nalso has a lot of cave paintings in the forests, some of which have been estimated to be as much as \n\n10,000 years old.', '', 0, ''),
(22, 'Chamba', 1, 'Himachal Pardesh', 'Himachal Pardesh', '0 to 15', '20 to 40', '3268 Feet', '2 to 4', 6000, 'assets/images/places/Chamba/Photos/img1.jpg', '0', '0', '', '', 0, ''),
(23, 'Dharamshala-McloedGunj', 1, 'Himachal Pardesh', 'Himachal Pardesh', '-3 to 20', '22 to 35', '6561 Feet', '2 to 5', 6000, 'assets/images/places/Dharamshala-McloedGunj/Photos/img1.jpg', '', '', 'Dharamshala is a city in the upper reaches of the Kangra Valley and is\n\nsurrounded by dense coniferous forest consisting mainly of stately Deodar cedar trees. The Dalai Lama \n\nresidence is Mclodegunj adds to the spirituality of the destination. The headquarters of the Central \n\nTibetan administration (the Tibetan Government in exile) along with the highest cricket ground is all \n\nlocated in Dharamsala.', 'The coniferous forests will add to your witness of the lust green Himalayan delight while trekking in \n\nMcLodegunj. You get a lifetime opportunity to sleep under 5 billion stars rather than sleeping under a 5 \n\nstar. A selfie with the monks makes you relish the spirituality of the place, but the food shops and cafes \n\nmake you realize how much more is there to the place than just spirituality.', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `places_best_visiting_time`
--

CREATE TABLE IF NOT EXISTS `places_best_visiting_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_purpose` varchar(200) NOT NULL,
  `visit_timing` varchar(200) NOT NULL,
  `places_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `places_best_visiting_time`
--

INSERT INTO `places_best_visiting_time` (`id`, `visit_purpose`, `visit_timing`, `places_id`) VALUES
(1, 'For sightseeing and adventure sports', 'March to June', 1),
(2, 'For snow fall and honeymoons', 'December to January', 1);

-- --------------------------------------------------------

--
-- Table structure for table `places_images`
--

CREATE TABLE IF NOT EXISTS `places_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `places_id` int(11) NOT NULL,
  `image_name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `places_images`
--

INSERT INTO `places_images` (`id`, `places_id`, `image_name`) VALUES
(1, 1, 'assets/places/manali/img2.jpg'),
(2, 1, 'assets/places/manali/img3.jpg'),
(3, 1, 'assets/places/manali/img4.jpg'),
(4, 1, 'assets/places/manali/img5.jpg'),
(5, 2, 'assets/places/kasoli/img2.jpg'),
(6, 2, 'assets/places/kasoli/img3.jpg'),
(7, 2, 'assets/places/kasoli/img4.jpg'),
(8, 3, 'assets/places/shimla/img2.jpg'),
(9, 3, 'assets/places/shimla/img3.jpg'),
(10, 3, 'assets/places/shimla/img4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `places_reviews`
--

CREATE TABLE IF NOT EXISTS `places_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `places_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL,
  `user_comment` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `places_reviews`
--

INSERT INTO `places_reviews` (`id`, `places_id`, `users_id`, `user_rating`, `user_comment`) VALUES
(1, 4, 1, 4, 'Feeling overwhelming is genuine when we go, even visit once the vastness and greatness of mountains. ');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_address` varchar(500) NOT NULL,
  `user_contact_no1` varchar(20) NOT NULL,
  `user_contact_no2` varchar(20) NOT NULL,
  `budget_per_person` int(11) NOT NULL,
  `trip_starting_date` varchar(20) NOT NULL,
  `no_of_days` int(11) NOT NULL,
  `origin_city` varchar(200) NOT NULL,
  `end_city` varchar(200) NOT NULL,
  `returning_city` varchar(200) NOT NULL,
  `no_of_persons` int(11) NOT NULL,
  `isOrderOk` int(11) NOT NULL,
  `isOrderDone` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trip_accomodations`
--

CREATE TABLE IF NOT EXISTS `trip_accomodations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trips_id` int(11) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `budget_per_person` int(11) NOT NULL,
  `total_rooms` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trip_amenities`
--

CREATE TABLE IF NOT EXISTS `trip_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_accomodations_id` int(11) NOT NULL,
  `amenity_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trip_attractions`
--

CREATE TABLE IF NOT EXISTS `trip_attractions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trips_id` int(11) NOT NULL,
  `attractions_id` int(11) NOT NULL,
  `attraction_preference` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_contact_no1` varchar(20) NOT NULL,
  `user_contact_no2` varchar(20) NOT NULL,
  `user_first_login` varchar(100) NOT NULL,
  `user_last_login` varchar(100) NOT NULL,
  `user_isSubscribed` int(11) NOT NULL DEFAULT '0',
  `user_current_city` varchar(100) NOT NULL,
  `user_city_code` int(11) NOT NULL,
  `user_img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

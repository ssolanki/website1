-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2015 at 02:05 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `attractions`
--

INSERT INTO `attractions` (`id`, `attraction_name`, `places_id`, `attraction_about`, `attraction_timeSpan`, `attraction_cost`, `attraction_image`, `attraction_postalCode`, `attraction_overall_rating`) VALUES
(1, 'Beas Kund', 1, 'Considered to be the birthplace of River Beas, Beas Kund is as breathtaking as it is astonishing. It is said sage Rishi Vyas took his daily bath here. The igloo like stone formation at the kund is the starting point for a number of treks, including Friendship and Hanuman Tibba peaks.', '06:00 AM - 06:00 PM', '', 'assets/images/places/manali/beas-kund/img1.jpg', '', 0),
(2, 'Hadimba Temple', 1, 'It is assumed that The Hidimba Devi temple is built around a cave where Hidimba performed meditation. The tower consists of three square roofs covered with timber tiles and a fourth brass cone-shaped roof at the top. The earth goddess Durga forms the theme of the main door carvings.The temple base is made out of whitewashed, mud-covered stonework.\nNOTE: This is a religious site. Please respect that fact and do not dress inappropriately.\n', '08:00 AM - 06:00 AM', '', 'assets/images/places/manali/hadimba-temple/img1.jpg', '', 0),
(3, 'Kullu', 1, 'Kullu is a broad open valley formed by the Beas river between Manali and Largi. This valley is famous for its temples, beauty and its majestic hills covered with Pine and Deodar Forest and sprawling Apple Orchards. Kullu valley is sandwiched between the Pir Panjal, Lower Himalayan and Great Himalayan range.', '24x7 Hrs', '', 'assets/images/places/manali/kullu/img1.jpg', '', 0),
(4, 'Rohtang Pass', 1, 'Rohtang pass is an adventure tourist site where it can be cold even on a summer day. It is the highest point on the Manali-Keylong road and provides a wide panoramic view of mountains rising far above clouds, which is truly breath taking. Close by is a small lake called Dassaur Lake. Beas Kund, the source of river Beas, is also nearby. In winter, the road of Rothang Pass is closed. If you are an adventure freak, you are in for a pleasant surprise as Rohtang Pass makes for some smashing adrenalin', '24x7 Hrs except Tuesday.', '', 'assets/images/places/manali/rohtang-pass/img1.jpg', '', 0),
(5, 'Solang Valley', 1, 'Solang Valley gives you stunning views of the snow capped peaks and beautiful glaciers. If you are in an adventurous mood, indulge in some skiing, paragliding or exciting ATB rides. There are a bundle of surprises in store for kids as well.\nIt is also an awesome picnic spot. There are innumerable shops selling delicious snacks.\n', '10:00 AM - 06:00 PM', 'Entry Fees: Rs 500 per person for zorbing \n RS 1,200 per person for paragliding \n Rs 500 per person for ropeway (both side\n', 'assets/images/places/manali/solang-valley/img1.jpg', '', 0),
(6, 'Van Vihar', 1, 'Away from the hustle bustle of the busy market, this protected piece of land is maintained by government authorities. The vast forest area has a children''s park complete with swings and slides and a small man made pond for boating. the Van Vihar is a perfect place to relax and rejuvenate.\n', '08:00 AM - 07:00 PM\n', 'Entry Fees: 10 Rs Per Person', 'assets/images/places/manali/van-vihar/img1.jpg', '', 0),
(7, 'Vashishta Hot Springs', 1, 'Soak yourself in Vashist Hot Water Sulphur Springs (across the famous Beas river) and feel the magic. The place has several modern bathrooms with Turkish style showers(connected to the spring through pipes). It is flocked by visitors who want to benefit from the medicinal properties of the sulphur spring as it is said to cure a number of skin allergies and other ailments.', '7:00 AM - 1:00 PM , \n2:00 PM - 10:00 PM\n', '', 'assets/images/places/manali/vashishta-hot-springs/img1.jpg', '', 0);

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
(1, 1, 'assets/images/places/manali/beas-kund/img2.jpg'),
(2, 1, 'assets/images/places/manali/beas-kund/img3.jpg'),
(3, 1, 'assets/images/places/manali/beas-kund/img4.jpg'),
(4, 2, 'assets/images/places/manali/hadimba-temple/img2.jpg'),
(5, 2, 'assets/images/places/manali/hadimba-temple/img3.jpg'),
(6, 3, 'assets/images/places/manali/kullu/img2.jpg'),
(7, 3, 'assets/images/places/manali/kullu/img3.jpg'),
(8, 4, 'assets/images/places/manali/rohtang-pass/img2.jpg'),
(9, 4, 'assets/images/places/manali/rohtang-pass/img3.jpg'),
(10, 5, 'assets/images/places/manali/solang-valley/img2.jpg'),
(11, 5, 'assets/images/places/manali/solang-valley/img3.jpg'),
(12, 5, 'assets/images/places/manali/solang-valley/img4.jpg'),
(13, 6, 'assets/images/places/manali/van-vihar/img2.jpg'),
(14, 6, 'assets/images/places/manali/van-vihar/img3.jpg'),
(15, 7, 'assets/images/places/manali/vashishta-hot-springs/img2.jpg'),
(16, 7, 'assets/images/places/manali/vashishta-hot-springs/img3.jpg');

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
  `places_id` int(11) NOT NULL,
  `trip_tavelling` varchar(500) NOT NULL,
  `trip_stay` varchar(500) NOT NULL,
  `trip_timeSpan` int(11) NOT NULL,
  `trip_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(200) NOT NULL,
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
  `place_about` varchar(1000) NOT NULL,
  `place_feeling` varchar(500) NOT NULL,
  `place_overall_rating` float NOT NULL,
  `place_near_by_places` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `place_name`, `place_region_name`, `place_state`, `place_avg_temp_winter`, `place_avg_temp_summer`, `place_sea_level`, `place_idealNo_days`, `place_ideal_budget`, `place_img`, `place_latitude`, `place_longitude`, `place_about`, `place_feeling`, `place_overall_rating`, `place_near_by_places`) VALUES
(1, 'Manali', 'Himachal Pardesh', 'Himachal Pardesh', '-5 to 15', '10 to 25', '6726 Feet ', '3-5', 6500, 'assets/images/places/manali/Photos/img1.jpg', '0', '0', 'Manali is a high-altitude Himalayan resort located nearly 250 km from Shimla and a definite delight to tourist from any corner of the world. It has a reputation as a backpacking center and honeymoon destination. Manali acts as the gateway for skiing and trekking in the Solang and the Parvati valley respectively', 'Manali is a high-altitude Himalayan resort located nearly 250 km from Shimla and a definite delight to tourist from any corner of the world. It has a reputation as a backpacking center and honeymoon destination. Manali acts as the gateway for skiing and trekking in the Solang and the Parvati valley respectively', 0, ''),
(2, 'Kasol', 'Himachal Pardesh', 'Himachal Pardesh', '', '', '5380 Feet', '2-5', 6000, 'assets/images/places/kasoli/Photos/img1.jpg', '0', '0', '', '', 0, ''),
(3, 'Shimla', 'Himachal Pardesh', 'Himachal Pardesh', '8 to -2', '15 to 30', '8408 Feet', '3-5', 6000, 'assets/images/places/shimla/Photos/img1.jpg', '', '', 'Once the summer capital of the British raj, Shimla is currently the capital of Himachal Pradesh and an attractive tourist location especially during the sultry summers faced by a major part of India. Traffic is banned from the central part of town, so walking anywhere is pleasant due to the soothing weather. A beautiful romantic date is also up on the line considering the rainy conditions outside giving an immense moment of happiness for you and your partner.', 'The mesmerizing beauty of the hills, monkeys squealing outside your hotel window enhance the thrill that a tourist is expected to experience at Shimla. Suddenly the shrill blast of a whistle announces the departure of the so called "toy train", a ride on which would definitely take you on cloud nine. It''s always a fun to ride on a horseback into the surrounding hills where British grandees once had their retreats. The steamed momos with the Kufri snowfall in sight is a delight that many long for', 0, ''),
(4, 'Darjiling', 'North East', 'West Bengal', '', '25 Degree', '7000 Feet', '3 to 6 ', 6500, 'assets/images/places/darjiling/Photos/img1.jpg', '', '', 'Darjeeling is a town in India in''s  West Bengal state, in the Himalayan foothills.', '', 0, '');

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
(1, 1, 'assets/images/places/manali/Photos/img2.jpg'),
(2, 1, 'assets/images/places/manali/Photos/img3.jpg'),
(3, 1, 'assets/images/places/manali/Photos/img4.jpg'),
(4, 1, 'assets/images/places/manali/Photos/img5.jpg'),
(5, 2, 'assets/images/places/kasoli/Photos/img2.jpg'),
(6, 2, 'assets/images/places/kasoli/Photos/img3.jpg'),
(7, 2, 'assets/images/places/kasoli/Photos/img4.jpg'),
(8, 3, 'assets/images/places/shimla/Photos/img2.jpg'),
(9, 3, 'assets/images/places/shimla/Photos/img3.jpg'),
(10, 3, 'assets/images/places/shimla/Photos/img4.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_password`, `user_contact_no1`, `user_contact_no2`, `user_first_login`, `user_last_login`, `user_isSubscribed`, `user_current_city`, `user_city_code`, `user_img`) VALUES
(1, 'Anand Singh Sekhawat', '', '', '', '', '', '', 0, '', 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

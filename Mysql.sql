-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: cqr.softether.net    Database: BaLi
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('bali','bali');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_games`
--

DROP TABLE IF EXISTS `all_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_games` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_title` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` varchar(2000) NOT NULL,
  `price` double DEFAULT NULL,
  `image_loc` varchar(255) NOT NULL,
  `preowned` tinyint(1) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`game_id`,`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_games`
--

LOCK TABLES `all_games` WRITE;
/*!40000 ALTER TABLE `all_games` DISABLE KEYS */;
INSERT INTO `all_games` VALUES (1,'Fallout 3: GOTY','Bethesda Softworks','2013-04-08','Highly anticipated sequel to the punishing 2011 breakout hit Dark Souls.  brings the franchise\'s renowned difficulty & gripping gameplay innovations to both single and multiplayer experiences',1.5,'assets/img/Fallout3',1,4,'RPG'),(2,'Dead Island Riptide','Deep Silver','2013-04-26','They thought they had escaped the terrors of Banoi and survived the apocalypse on a corrupted paradise. Then their fate took a turn for the worse…The Dead Island heroes escaped in a helicopter to the safety of a military ship, but when a furious storm hits and the virus suddenly spreads throughout the crew, the nightmare starts all over again, leaving hope drowning in the rising tides.',8,'assets/img/DeadIslandRiptide',1,1,'Action, Shooter'),(3,'The Walking Dead','Telltale Games ','2013-05-10','The Walking Dead is a five-part game series set in the same. Play as Lee Everett, a convicted criminal, who has been given a second chance at life in a world devastated by the undead. With corpses returning to life and survivors stopping at nothing to maintain their own safety, protecting an orphaned girl named Clementine may offer him redemption in a world gone to hell.',12.3,'assets/img/TheWalkingDead',0,3,'Horror, RPG'),(4,'South Park: The Stick of Truth','Obsidian Entertainment ','2014-03-07','From the perilous battlefields of the fourth-grade playground, a young hero will rise, destined to be South Park\'s savior. From the creators of South Park, Trey Parker and Matt Stone, comes an epic quest to become… cool. Introducing South Park™: The Stick of Truth .You begin as the new kid in town facing a harrowing challenge: making friends. As you start your quest the children of South Park are embroiled in a city-wide, live-action-role-playing game, casting imaginary spells and swinging fake swords. Over time the simple children\'s game escalates into a battle of good and evil that threatens to consume the world. Arm yourself with weapons of legend to defeat crabpeople, underpants gnomes, hippies and other forces of evil. Discover the lost Stick of Truth and earn your place at the side of Stan, Kyle, Cartman and Kenny as their new friend. Succeed, and you shall be South Park\'s savior, cementing your social status in South Park Elementary. Fail, and you will forever be known… as a loser.',13.1,'assets/img/SPTheStickofTruth',0,2,'Adventure, RPG'),(5,'Thief','Looking Glass Studios ','2014-06-04','Garrett, the Master Thief, steps out of the shadows into the City. In this treacherous place, where the Baron\'s Watch spreads a rising tide of fear and oppression, his skills are the only things he can trust. Even the most cautious citizens and their best-guarded possessions are not safe from his reach. As an uprising emerges, Garrett finds himself entangled in growing layers of conflict. Lead by Orion, the voice of the people, the tyrannized citizens will do everything they can to claim back the City from the Baron\'s grasp. The revolution is inevitable. If Garrett doesn\'t get involved, the streets will run red with blood and the City will tear itself apart.',7,'assets/img/Thief',1,2,'Adventure'),(6,'Enemy Front','CITY Interactive','2014-06-13','ENEMY FRONT is the first truly modern WW2 FPS, featuring stunning visuals, open-ended levels and a richly interactive combat experience that breaks out of the standard model of highly linear scripted FPS experiences, giving the player full freedom to own their playing style. Intense Combat, Sniping, Stealth and Sabotage - all are viable approaches for the player, maximizing player engagement and replayability. Against the visceral backdrop of breathtaking European locales, the player takes on the role of American Robert Hawkins, as he fights hand in hand with Resistance Fighters opposing the Nazi juggernaut in France, Germany, Norway, and during the Warsaw Uprising.',15.4,'assets/img/EnemyFront',0,5,'Shooter'),(7,'Metro: Redux','4A GAMES, 4A Games','2014-08-20','In 2013 the world was devastated by an apocalyptic event, annihilating almost all mankind and turning the earth\'s surface into a poisonous wasteland. A handful of survivors took refuge in the depths of the Moscow underground, and human civilization entered a new Dark Age.The year is 2033. An entire generation has been born and raised underground, and their besieged Metro Station-Cities struggle for survival, with each other, and the mutant horrors that await outside.',15.4,'assets/img/MetroRedux',0,5,'Shooter'),(8,'The Evil Within','Tango Gameworks ','2014-10-15','The Evil Within embodies the meaning of pure survival horror. Highly-crafted environments, horrifying anxiety, and an intricate story are combined to create an immersive world that will bring you to the height of tension. With limited resources at your disposal, you\'ll fight for survival and experience profound fear in this perfect blend of horror and action.',37.5,'assets/img/TheEvilWithin',0,1,'Action, Adventure, Horror'),(9,'Ryse: Son of Rome','Crytek ','2014-10-24','\"Ryse: Son of Rome\" tells the story of Marius Titus, a young Roman soldier who witnesses the murder of his family at the hands of barbarian bandits, then travels with the Roman army to Britannia to seek revenge. Quickly rising through the ranks, Marius must become a leader of men and defender of the Empire on his quest to exact vengeance - a destiny he soon discovers can only be fulfilled much closer to home.',10.1,'assets/img/RyseSonofRome',1,1,'Action'),(10,'Dying Light','Techland','2015-02-27','Dying Light is a first-person, action survival horror game set in a vast and dangerous open world. During the day, players traverse an expansive urban environment overrun by a vicious outbreak, scavenging the world for supplies and crafting weapons to defend against the growing infected population. At night, the hunter becomes the hunted, as the infected become aggressive and more dangerous. Most frightening are the predators which only appear after sundown. Players must use everything in their power to survive until the morning\'s first light',23.3,'assets/img/DyingLight',0,1,'Action, Horror'),(11,'Battleborn','Gearbox Software ','2015-05-03','A tremendous band of badass heroes fight to protect the universe\'s very last star from a mysterious evil in this next-gen shooter by the creators of Borderlands. To defend it, you\'ll need to utilize every type of character and weapon you\'ve ever imagined -- from cyborg hawkmen to samurai vampires to mini-gun wielding man-mountains. Slash and parry, run and gun, cast and dash, or simply obliterate foes all while building and growing your personal team of heroes.  Choose your hero and fight alone or co-operatively alongside friends in story missions, or battle against them in fast-paced competitive multiplayer matches.',31.1,'assets/img/Battleborn',0,1,'Action'),(12,'Fallout 4','Bethesda Softworks','2015-11-10','Bethesda Game Studios, the award-winning creators of Fallout 3, welcome you to the world of Fallout 4 - their most ambitious game ever, and the next generation of open-world gaming. As the sole survivor of Vault 111, you enter a world destroyed by nuclear war. Every second is a fight for survival, and every choice is yours. Only you can rebuild and determine the fate of the Wasteland. Welcome home',29.4,'assets/img/Fallout4',0,4,'RPG, Shooter'),(13,'Star Wars Battlefront','Pandemic Studios ','2015-11-19','Immerse yourself in the epic Star Wars battles you\'ve always dreamed of and create new heroic moments of your own in Star Wars Battlefront. Fight for the Rebellion or Empire in a wide variety of multiplayer matches for up to 40 players, or in exciting challenges inspired by the films available solo, split-screen or through online co-op. Star Wars Battlefront combines this epic action on a galactic scale with stunning visual recreations of some of the most iconic planets, weapons, characters, and vehicles in the Star Wars universe and the original sound effects from the films.',13.9,'assets/img/StarWarsBattlefront',0,1,'Action'),(14,'Life is Strange: Limited Edition',' Square Enix PC','2016-01-22','Life Is Strange is a five part episodic game that sets out to revolutionise story based choice and consequence games by allowing the player to rewind time and affect the past, present and future. You are Max, a photography senior who saves her old friend Chloe by discovering she can rewind time. The pair soon find themselves exposed to the darker side of Arcadia Bay as they uncover the disturbing truth behind the sudden disappearance of a fellow student. Meanwhile, Max begins to have premonitions as she struggles to understand the implications of her power. She must quickly learn that changing the past can sometimes lead to a devastating future',13.9,'assets/img/LISLimitedEdition',0,2,'Adventure, RPG'),(15,'Rise of The Tomb Raider','Crystal Dynamics ','2016-01-29','In the critically acclaimed Tomb Raider, Lara Croft was forged into a true survivor, but she glimpsed a deeper, secret world. Now, after uncovering an ancient mystery, Lara must explore the most treacherous and remote regions of Siberia to find the secret of immortality before a ruthless organization known as Trinity. Lara must use her wits and survival skills, form new alliances, and ultimately embrace her destiny as the Tomb Raider. Experience high-octane action moments, conquer beautifully hostile environments, engage in brutal guerilla combat, and explore awe-inspiring deadly tombs in the evolution of survival action. In Rise of the Tomb Raider, Lara becomes more than a survivor as she embarks on her first great Tomb Raiding expedition.',27,'assets/img/RiseOfTheTombRaider',0,2,'Adventure'),(16,'Mirror\'s Edge: Catalyst','EA Electronic Arts','2016-02-08','In a city where information is heavily monitored, agile couriers called Runners transport sensitive data away from prying eyes.In this seemingly utopian paradise, a crime has been committed, your sister has been framed and now you are being hunted. You are a Runner called Faith - and this innovative first-person action-adventure is your story. Mirror\'s Edge delivers you straight into the shoes of this unique heroine as she traverses the vertigo-inducing cityscape, engaging in intense combat and fast paced chases. With a never before seen sense of movement and perspective, you will be drawn into Faith\'s world. A world that is visceral, immediate, and very dangerous. Live or die? Soar or plummet? One thing is certain, in this city you will learn how to run.',31.1,'assets/img/MirrorEdgeCatalyst',0,1,'Action, Adventure'),(17,'Far Cry Primal Collectors Edition','Ubisoft PC','2016-03-01','The original fight for humanity\'s survival with its innovative open-world sandbox gameplay, bringing together massive beasts, breathtaking environments, and unpredictable savage encounters. Welcome to the Stone Age, a time of extreme danger and limitless adventure, when giant mammoths and sabretooth tigers ruled the Earth, and humanity is at the bottom of the food chain. As the last survivor of your hunting group, you will learn to craft a deadly arsenal, fend off fierce predators, and outsmart enemy tribes to conquer the land of Oros and become the Apex Predator.',23.2,'assets/img/FCPCollectorsEdition',0,2,'Adventure, Shooter'),(18,'Better Late Than Dead','Odin Game Studio ','2016-03-04','Explore an open sandbox environment which, depending on your intention, could have or could not have a foreseeable end. But as you investigate further, you may notice some suspicious activity including animals that would not normally be found in an area like this and some inconsistencies that lead to more questions. It is up to you to discover the answers. Craft items, quench your thirst, satisfy your hunger, fend off animals',9.3,'assets/img/BetterLateThanDead',0,2,'Adventure'),(19,'Night Cry','Nude Maker ','2016-03-29','NightCry is set on a cruise ship, and you have been invited along for the cruise of a (possibly short) lifetime. While your surroundings are luxurious and the guests are friendly, not everything is as it should be. The guests and the crew start to turn up dead, the victims of some foul murderer.',10.25,'assets/img/NightCry',0,3,'Horror'),(20,'Corpse Party','GrisGris ','2016-04-26','A group of friends unknowingly perform an occult ritual that traps them in an otherworldly elementary school. Here, the vengeful spirits of young children threaten their lives and their sanity, and the only hope of survival is to uncover the chilling details behind the murders of those trapped before them.',13.9,'assets/img/CorpseParty',0,3,'Horror'),(21,'Left Alone','Volumetric Games ','2016-04-28','Left alone is a psychological horror game set in multiple believable interior and exterior environments. This game has a unique old school, high octane atmosphere which means you\'ll feel like you\'re truly beginning an adventure you\'ll never quite forget.',7,'assets/img/LeftAlone',0,2,'Adventure, Horror'),(22,'The Grandfather','MPR ART Hallucinations ,	David Szymanski ','2016-05-03','One night The Grandfather went to give his wife a good night kiss, she ignored him as usual, this broke his heart. He went to sleep in his own bed, full of misery as usual, but this night turn out to be different than the others',3,'assets/img/TheGrandfather',0,3,'Horror'),(23,'Share','HFM Games ','2016-05-03','In the backyard of the civilization, left by destiny without any hope, you\'ll find this house on the hill. It will become your shelter and give you everything you need. But then, the owners of the hill will come and you will have pay for this shelter.',5,'assets/img/Share',0,1,'Action, Horror'),(24,'Goliath','Whalebox Studio ','2016-05-12','Welcome to a mysterious world filled with strange creatures, giant monsters and warring factions. You won\'t last long here on your own. Fortunately, you know how to build giant robots! Find the plans, gather the resources, climb inside your giant robotic creations and start punching monsters in face!.',11.6,'assets/img/Goliath',0,1,'Action, Adventure, RPG'),(25,'Doom',' id Software ','2016-05-13','DOOM returns as a brutally fun and challenging modern-day shooter experience. Relentless demons, impossibly destructive guns, and fast, fluid movement provide the foundation for intense, first-person combat - whether you\'re obliterating demon hordes through the depths of Hell in the single-player campaign, or competing against your friends in numerous multiplayer modes.',39.9,'assets/img/Doom',0,3,'Horror, Shooter'),(26,'The Brookhaven Experiment ','EA Electronic Arts','2016-06-21','The Brookhaven Experiment is a Virtual Reality survival shooter. Players will have to use the weapons and tools provided to survive ever more terrifying waves of horrific monsters in an attempt to figure out what caused the beginning of the end of the world, and, if they\'re strong enough, stop it from happening. Keep your head on a swivel, upgrade your equipment, shoot, and if all else fails pistol whip your way through the monster hoards to survive one more day.',NULL,'assets/img/BrookhavenExperiment',0,5,'Shooter'),(27,'No Man\'s Sky ','Hello Games','2016-06-21','No Man\'s Sky is a game about exploration and survival, set in an infinite procedurally generated universe. Whether a distant mountain or a planet hanging low on the horizon, you can go there. You can fly seamlessly from the surface of a planet to another, and every star in the sky is a sun that you can visit. Where you\'ll go and how fast you\'ll make your way through this universe is up to you.',NULL,'assets/img/NoMansSky',0,2,'Adventure'),(28,'Umbrella Corps','Capcom','2016-06-21','Umbrella Corps is a fast-paced third-person shooter set in the Resident Evil universe. The competitive online game will feature quick, intense matches in compact battle zones themed from historic Resident Evil environments such as an Umbrella Facility map.',NULL,'assets/img/UmbrellaCorps',0,5,'Shooter'),(29,'LEGO Star Wars: The Force Awakens','TT Games','2016-06-28','The Force is strong with this one ... The LEGO video game franchise triumphantly returns with a fun-filled, humorous journey based on the blockbuster Star Wars film. Play as Rey, Finn, Poe, BB-8, Kylo Ren, Han Solo, and the rest of your favorite characters from the movie! In LEGO Star Wars: The Force Awakens, players relive the epic action from the blockbuster film Star Wars: The Force Awakens, retold through the clever and witty LEGO lens. The game will also feature exclusive playable content that bridges the story gap between Star Wars Episode VI: Return of the Jedi and Star Wars: The Force Awakens.',NULL,'assets/img/LegoStarWars',0,1,'Action, Adventure'),(30,'Call of Duty: Infinite Warfare Legacy Edition','Activision','2016-11-04','The acclaimed studio team at Infinity Ward reaches new heights with Call of Duty: Infinite Warfare, which returns to the roots of the series for a classic battle of two armies.Call of Duty: Infinite Warfare immerses players in a war story that, for the first time in franchise history, extends beyond the reaches of Earth into the vast expanse of our solar system.Call of Duty: Infinite Warfare delivers something for every Call of Duty® fan with three unique game modes: Campaign, Multiplayer, and Zombies.',43.5,'assets/img/CallofDuty',0,3,'Horror');
/*!40000 ALTER TABLE `all_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_box`
--

DROP TABLE IF EXISTS `comment_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_box` (
  `name` varchar(45) NOT NULL,
  `rating` int(11) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(2000) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_box`
--

LOCK TABLES `comment_box` WRITE;
/*!40000 ALTER TABLE `comment_box` DISABLE KEYS */;
INSERT INTO `comment_box` VALUES ('xinli',0,'0000-00-00','');
/*!40000 ALTER TABLE `comment_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_data`
--

DROP TABLE IF EXISTS `game_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_data` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_title` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `image_loc` varchar(255) NOT NULL,
  `preowned` tinyint(1) NOT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_data`
--

LOCK TABLES `game_data` WRITE;
/*!40000 ALTER TABLE `game_data` DISABLE KEYS */;
INSERT INTO `game_data` VALUES (1,'Dead Island Riptide','Deep Silver','2013-04-26','They thought they had escaped the terrors of Banoi and survived the apocalypse on a corrupted paradise. Then their fate took a turn for the worse…The Dead Island heroes escaped in a helicopter to the safety of a military ship, but when a furious storm hits and the virus suddenly spreads throughout the crew, the nightmare starts all over again, leaving hope drowning in the rising tides.',8,7.99,'assets/img/DeadIslandRiptide',1),(2,'The Walking Dead','Telltale Games ','2013-05-10','The Walking Dead is a five-part game series set in the same. Play as Lee Everett, a convicted criminal, who has been given a second chance at life in a world devastated by the undead. With corpses returning to life and survivors stopping at nothing to maintain their own safety, protecting an orphaned girl named Clementine may offer him redemption in a world gone to hell.',12.3,12,'assets/img/TheWalkingDead',0),(3,'Thief','Looking Glass Studios ','2014-06-04','Garrett, the Master Thief, steps out of the shadows into the City. In this treacherous place, where the Baron\'s Watch spreads a rising tide of fear and oppression, his skills are the only things he can trust. Even the most cautious citizens and their best-guarded possessions are not safe from his reach. As an uprising emerges, Garrett finds himself entangled in growing layers of conflict. Lead by Orion, the voice of the people, the tyrannized citizens will do everything they can to claim back the City from the Baron\'s grasp. The revolution is inevitable. If Garrett doesn\'t get involved, the streets will run red with blood and the City will tear itself apart.',7,6.99,'assets/img/Thief',1),(4,'Enemy Front','CITY Interactive','2014-06-13','ENEMY FRONT is the first truly modern WW2 FPS, featuring stunning visuals, open-ended levels and a richly interactive combat experience that breaks out of the standard model of highly linear scripted FPS experiences, giving the player full freedom to own their playing style. Intense Combat, Sniping, Stealth and Sabotage - all are viable approaches for the player, maximizing player engagement and replayability. Against the visceral backdrop of breathtaking European locales, the player takes on the role of American Robert Hawkins, as he fights hand in hand with Resistance Fighters opposing the Nazi juggernaut in France, Germany, Norway, and during the Warsaw Uprising.',15.4,0,'assets/img/EnemyFront',0),(5,'The Evil Within','Tango Gameworks ','2014-10-15','The Evil Within embodies the meaning of pure survival horror. Highly-crafted environments, horrifying anxiety, and an intricate story are combined to create an immersive world that will bring you to the height of tension. With limited resources at your disposal, you\'ll fight for survival and experience profound fear in this perfect blend of horror and action.',37.5,0,'assets/img/TheEvilWithin',0),(6,'Dying Light','Techland','2015-02-27','Dying Light is a first-person, action survival horror game set in a vast and dangerous open world. During the day, players traverse an expansive urban environment overrun by a vicious outbreak, scavenging the world for supplies and crafting weapons to defend against the growing infected population. At night, the hunter becomes the hunted, as the infected become aggressive and more dangerous. Most frightening are the predators which only appear after sundown. Players must use everything in their power to survive until the morning\'s first light',23.3,0,'assets/img/DyingLight',0),(7,'Battleborn','Gearbox Software ','2015-05-03','A tremendous band of badass heroes fight to protect the universe\'s very last star from a mysterious evil in this next-gen shooter by the creators of Borderlands. To defend it, you\'ll need to utilize every type of character and weapon you\'ve ever imagined -- from cyborg hawkmen to samurai vampires to mini-gun wielding man-mountains. Slash and parry, run and gun, cast and dash, or simply obliterate foes all while building and growing your personal team of heroes.  Choose your hero and fight alone or co-operatively alongside friends in story missions, or battle against them in fast-paced competitive multiplayer matches.',31.1,0,'assets/img/Battleborn',0),(8,'Star Wars Battlefront','Pandemic Studios ','2015-11-19','Immerse yourself in the epic Star Wars battles you\'ve always dreamed of and create new heroic moments of your own in Star Wars Battlefront. Fight for the Rebellion or Empire in a wide variety of multiplayer matches for up to 40 players, or in exciting challenges inspired by the films available solo, split-screen or through online co-op. Star Wars Battlefront combines this epic action on a galactic scale with stunning visual recreations of some of the most iconic planets, weapons, characters, and vehicles in the Star Wars universe and the original sound effects from the films.',13.9,0,'assets/img/StarWarsBattlefront',0),(9,'Rise of The Tomb Raider','Crystal Dynamics ','2016-01-29','In the critically acclaimed Tomb Raider, Lara Croft was forged into a true survivor, but she glimpsed a deeper, secret world. Now, after uncovering an ancient mystery, Lara must explore the most treacherous and remote regions of Siberia to find the secret of immortality before a ruthless organization known as Trinity. Lara must use her wits and survival skills, form new alliances, and ultimately embrace her destiny as the Tomb Raider. Experience high-octane action moments, conquer beautifully hostile environments, engage in brutal guerilla combat, and explore awe-inspiring deadly tombs in the evolution of survival action. In Rise of the Tomb Raider, Lara becomes more than a survivor as she embarks on her first great Tomb Raiding expedition.',27,0,'assets/img/RiseOfTheTombRaider',0),(10,'Mirror\'s Edge: Catalyst','EA Electronic Arts','2016-02-08','In a city where information is heavily monitored, agile couriers called Runners transport sensitive data away from prying eyes.In this seemingly utopian paradise, a crime has been committed, your sister has been framed and now you are being hunted. You are a Runner called Faith - and this innovative first-person action-adventure is your story. Mirror\'s Edge delivers you straight into the shoes of this unique heroine as she traverses the vertigo-inducing cityscape, engaging in intense combat and fast paced chases. With a never before seen sense of movement and perspective, you will be drawn into Faith\'s world. A world that is visceral, immediate, and very dangerous. Live or die? Soar or plummet? One thing is certain, in this city you will learn how to run.',31.1,0,'assets/img/MirrorEdgeCatalyst',0),(11,'Better Late Than Dead','Odin Game Studio ','2016-03-04','Explore an open sandbox environment which, depending on your intention, could have or could not have a foreseeable end. But as you investigate further, you may notice some suspicious activity including animals that would not normally be found in an area like this and some inconsistencies that lead to more questions. It is up to you to discover the answers. Craft items, quench your thirst, satisfy your hunger, fend off animals',9.3,0,'assets/img/BetterLateThanDead',0),(12,'Night Cry','Nude Maker ','2016-03-29','NightCry is set on a cruise ship, and you have been invited along for the cruise of a (possibly short) lifetime. While your surroundings are luxurious and the guests are friendly, not everything is as it should be. The guests and the crew start to turn up dead, the victims of some foul murderer.',10.25,0,'assets/img/NightCry',0),(13,'Corpse Party','GrisGris ','2016-04-26','A group of friends unknowingly perform an occult ritual that traps them in an otherworldly elementary school. Here, the vengeful spirits of young children threaten their lives and their sanity, and the only hope of survival is to uncover the chilling details behind the murders of those trapped before them.',13.9,0,'assets/img/CorpseParty',0),(14,'Left Alone','Volumetric Games ','2016-04-28','Left alone is a psychological horror game set in multiple believable interior and exterior environments. This game has a unique old school, high octane atmosphere which means you\'ll feel like you\'re truly beginning an adventure you\'ll never quite forget.',7,0,'assets/img/LeftAlone',0),(15,'The Grandfather','MPR ART Hallucinations ,	David Szymanski ','2016-05-03','One night The Grandfather went to give his wife a good night kiss, she ignored him as usual, this broke his heart. He went to sleep in his own bed, full of misery as usual, but this night turn out to be different than the others',3,0,'assets/img/TheGrandfather',0),(16,'Share','HFM Games ','2016-05-03','In the backyard of the civilization, left by destiny without any hope, you\'ll find this house on the hill. It will become your shelter and give you everything you need. But then, the owners of the hill will come and you will have pay for this shelter.',5,0,'assets/img/Share',0),(17,'Goliath','Whalebox Studio ','2016-05-12','Welcome to a mysterious world filled with strange creatures, giant monsters and warring factions. You won\'t last long here on your own. Fortunately, you know how to build giant robots! Find the plans, gather the resources, climb inside your giant robotic creations and start punching monsters in face!.',11.6,0,'assets/img/Goliath',0),(18,'Doom',' id Software ','2016-05-13','DOOM returns as a brutally fun and challenging modern-day shooter experience. Relentless demons, impossibly destructive guns, and fast, fluid movement provide the foundation for intense, first-person combat - whether you\'re obliterating demon hordes through the depths of Hell in the single-player campaign, or competing against your friends in numerous multiplayer modes.',39.9,0,'assets/img/Doom',0),(19,'The Brookhaven Experiment ','EA Electronic Arts','2016-06-21','The Brookhaven Experiment is a Virtual Reality survival shooter. Players will have to use the weapons and tools provided to survive ever more terrifying waves of horrific monsters in an attempt to figure out what caused the beginning of the end of the world, and, if they\'re strong enough, stop it from happening. Keep your head on a swivel, upgrade your equipment, shoot, and if all else fails pistol whip your way through the monster hoards to survive one more day.',0,0,'assets/img/BrookhavenExperiment',0),(20,'No Man\'s Sky ','Hello Games','2016-06-21','No Man\'s Sky is a game about exploration and survival, set in an infinite procedurally generated universe. Whether a distant mountain or a planet hanging low on the horizon, you can go there. You can fly seamlessly from the surface of a planet to another, and every star in the sky is a sun that you can visit. Where you\'ll go and how fast you\'ll make your way through this universe is up to you.',0,0,'assets/img/NoMansSky',0);
/*!40000 ALTER TABLE `game_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_genre`
--

DROP TABLE IF EXISTS `game_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_genre` (
  `game_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`game_id`,`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_genre`
--

LOCK TABLES `game_genre` WRITE;
/*!40000 ALTER TABLE `game_genre` DISABLE KEYS */;
INSERT INTO `game_genre` VALUES (1,4),(2,1),(2,5),(3,3),(3,4),(4,2),(4,4),(5,2),(6,5),(7,5),(8,1),(8,2),(8,3),(9,1),(10,1),(10,3),(11,1),(12,4),(12,5),(13,1),(14,2),(14,4),(15,2),(16,1),(16,2),(17,2),(17,5),(18,2),(19,3),(20,3),(21,2),(21,3),(22,3),(23,1),(23,3),(24,1),(24,2),(24,4),(25,3),(25,5),(26,5),(27,2),(28,5),(29,1),(29,2),(30,3);
/*!40000 ALTER TABLE `game_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Horror'),(4,'RPG'),(5,'Shooter');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `Name` varchar(45) NOT NULL,
  `MailingAddress` varchar(100) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contacts` int(8) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('qqw','eff','weew',123,'ascdscs');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `gameid` int(11) NOT NULL AUTO_INCREMENT,
  `gametitle` varchar(45) DEFAULT NULL,
  `releasedate` varchar(45) NOT NULL,
  `saleprice` double NOT NULL,
  PRIMARY KEY (`gameid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BaLi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-24 22:55:19

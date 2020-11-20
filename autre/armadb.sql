-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 15 Septembre 2020 à 20:31
-- Version du serveur :  10.1.45-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `armadb`
--

-- --------------------------------------------------------

--
-- Structure de la table `player`
--

CREATE TABLE `player` (
  `p_id` int(11) NOT NULL,
  `p_uid` varchar(100) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_money` int(100) NOT NULL,
  `p_tenues` text NOT NULL,
  `p_kills` int(100) NOT NULL,
  `p_morts` int(100) NOT NULL,
  `p_win_games` int(100) NOT NULL,
  `p_games_played` int(100) NOT NULL,
  `p_niv_vip` int(10) NOT NULL,
  `p_niv_droits` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `player`
--

INSERT INTO `player` (`p_id`, `p_uid`, `p_name`, `p_money`, `p_tenues`, `p_kills`, `p_morts`, `p_win_games`, `p_games_played`, `p_niv_vip`, `p_niv_droits`) VALUES
(1, '76561198291437537', 'AureProd', 42320, '\"[[0,6,5,2],[0]]\"', 0, 0, 0, 0, 3, 2),
(2, '76561198208475892', '*M.O.T.A*fox alpha', 1175, '\"[[0],[0]]\"', 0, 0, 0, 0, 0, 0),
(3, '76561198006133017', 'FondaTA : Mysterfreez', 46410, '\"[[0],[0,2]]\"', 0, 0, 0, 0, 3, 2),
(4, '76561198992818947', 'haza', 5000, '\"[[0],[0]]\"', 0, 0, 0, 0, 0, 0),
(5, '76561198144583758', 'Sigrid Haw', 2050, '\"[[0],[0]]\"', 0, 0, 0, 0, 0, 0),
(6, '76561198144105979', '[F.R.A.G] Greg ®', 2125, '\"[[0],[0]]\"', 0, 0, 0, 0, 0, 0),
(7, '76561198217742125', 'Yohann LARGO', 825, '\"[[0],[0]]\"', 0, 0, 0, 0, 0, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `player`
--
ALTER TABLE `player`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

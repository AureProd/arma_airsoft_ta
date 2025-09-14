
DROP TABLE IF EXISTS player;

CREATE TABLE player
(
   p_id INTEGER AUTO_INCREMENT NOT NULL,
   p_uid VARCHAR(100) NOT NULL,
   p_name VARCHAR(100) NOT NULL,
   p_money INTEGER(100) NOT NULL,
   p_tenues TEXT NOT NULL,
   p_kills INTEGER(100) NOT NULL,
   p_morts INTEGER(100) NOT NULL,
   p_win_games INTEGER(100) NOT NULL,
   p_games_played INTEGER(100) NOT NULL,
   p_niv_vip INTEGER(10) NOT NULL,
   p_niv_droits INTEGER(10) NOT NULL,
   PRIMARY KEY (p_id)
) ENGINE=InnoDB CHARSET=utf8;

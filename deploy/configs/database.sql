
DROP TABLE IF EXISTS player;

CREATE TABLE player
(
   id INTEGER AUTO_INCREMENT NOT NULL,
   uid VARCHAR(100) NOT NULL,
   name VARCHAR(100) NOT NULL,
   money INTEGER(100) NOT NULL,
   blue_outfits TEXT NOT NULL,
   red_outfits TEXT NOT NULL,
   kills INTEGER(100) NOT NULL,
   deads INTEGER(100) NOT NULL,
   won_games INTEGER(100) NOT NULL,
   lost_games INTEGER(100) NOT NULL,
   vip_level INTEGER(10) NOT NULL,
   rights INTEGER(10) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE KEY uniq_uid (uid)
) ENGINE=InnoDB CHARSET=utf8;

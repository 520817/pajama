CREATE DATABASE board_db00;

USE board_db00;

CREATE TABLE login (
  id VARCHAR(45) NOT NULL,
  pw VARCHAR(45) NOT NULL,
  sn INT NOT NULL,
  nn VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE (id ASC),
  UNIQUE INDEX sn_UNIQUE (sn ASC),
  UNIQUE INDEX nn_UNIQUE (nn ASC)
) engine=InnoDB;

insert into board_db00.login(id,pw,sn,nn) values ('love@sookmyung.ac.kr','love486',2110856,'파자마아자자2'); 

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(45) NOT NULL,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    l_category VARCHAR(50) NOT NULL,
    deadline DATETIME NOT NULL,
    people INT NOT NULL,
    location VARCHAR(255),
    filename VARCHAR(255),
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES login(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


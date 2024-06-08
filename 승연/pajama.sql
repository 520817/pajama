CREATE TABLE login (
  id VARCHAR(45) NOT NULL,
  pw VARCHAR(45) NOT NULL,
  sn INT NOT NULL,
  nn VARCHAR(45) NOT NULL,
  PRIMARY KEY (nn)
) engine=InnoDB;

insert into pajama.login(id,pw,sn,nn) values ('love@sookmyung.ac.kr','love486',2110856,'파자마아자자2');

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
    FOREIGN KEY (user_id) REFERENCES login(nn) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

ALTER TABLE posts MODIFY COLUMN deadline DATETIME;
SELECT * FROM posts ORDER BY id DESC;
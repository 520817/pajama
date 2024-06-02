CREATE DATABASE board_db00;

USE board_db00;

CREATE TABLE login (
    id VARCHAR(45) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(45) NOT NULL,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    l_category VARCHAR(50) NOT NULL,
	deadline DATE NOT NULL,
    people INT NOT NULL,
    location VARCHAR(255),
    filename VARCHAR(255),
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES login(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


CREATE DATABASE WebDB;
USE WebDB;
CREATE TABLE Posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    people INT NOT NULL,
    location VARCHAR(255),
    file VARCHAR(255),
    content TEXT NOT NULL
);

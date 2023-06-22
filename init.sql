CREATE DATABASE base;

USE base;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(255) NOT NULL,
    pwd VARCHAR(255) NOT NULL
);

CREATE TABLE meetings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME NOT NULL,
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE dates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT NOT NULL,
    meeting_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (meeting_id) REFERENCES meetings(id)
);

CREATE TABLE answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    date_id INT NOT NULL,
    meeting_id INT NOT NULL,
    response TINYINT(1) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dates(id),
    FOREIGN KEY (meeting_id) REFERENCES meetings(id)
);

INSERT INTO users (login, pwd) VALUES ('evan', 'test');
INSERT INTO users (login, pwd) VALUES ('alerig', 'test');

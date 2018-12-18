-- db : app
-- author : Raju

CREATE TABLE IF NOT EXISTS pasha (
    actor_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    movie_name TEXT,
    PRIMARY KEY (actor_id)
)  ENGINE=INNODB;
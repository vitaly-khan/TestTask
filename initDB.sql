USE test;
DROP TABLE IF EXISTS part;
CREATE TABLE part
(
  id     INT                  NOT NULL AUTO_INCREMENT,
  name   VARCHAR(100)         NOT NULL,
  needed TINYINT(1) DEFAULT 0 NOT NULL,
  quantity INT(4)               NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO part (name, needed, quantity)
VALUES ('SystemUnitCase', 1, 5),
       ('MotherBoard', 1, 20),
       ('CPU', 1, 14),
       ('Cooler', 1, 14),
       ('Power unit', 1, 25),
       ('Video card', 1, 14),
       ('Monitor', 0, 6),
       ('Keyboard', 0, 30),
       ('RAM', 1, 8),
       ('HDD drive', 1, 14),
       ('Sound card', 0, 4),
       ('Speakers', 0, 6),
       ('Mouse', 0, 30),
       ('CD Drive', 0, 3),
       ('DVD Drive', 0, 20),
       ('SSD Drive', 0, 3);
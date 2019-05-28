CREATE DATABASE test;

USE test;

DROP TABLE IF EXISTS parts;
CREATE TABLE parts
(
  id int(10) PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  required BIT DEFAULT false NOT NULL,
  quantity int(7) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
CREATE UNIQUE INDEX parts_title_uindex ON parts (title);

INSERT INTO `parts` (`title`,`required`,`quantity`)
    VALUES
    ("Motherboard", 1, 20),
    ("CPU", 1, 7),
    ("HDD", 1, 9),
    ("RAM", 1, 14),
    ("CPU Cooler", 1, 20),
    ("BD-RW", 0, 3),
    ("DVD-RW", 0, 7),
    ("Power supply", 1, 14),
    ("Video card", 0, 12),
    ("Card reader", 0, 5),
    ("SSD", 0, 5),
    ("Network card", 0, 4),
    ("Case", 0, 9),
    ("USB card", 0, 3),
    ("Sound card", 0, 7),
    ("BD-R", 0, 4),
    ("DVD-R", 0, 2),
    ("DVD-ROM", 0, 1),
    ("Sata card", 0, 3),
    ("FireWire card", 0, 2),
    ("FDD", 0, 1),
    ("Case Cooler", 1, 20),
    ("TV tuner", 0, 0);

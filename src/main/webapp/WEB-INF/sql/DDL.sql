CREATE TABLE member (
    id VARCHAR(12) PRIMARY KEY,
    pwd VARCHAR(12) NOT NULL,
    mail VARCHAR(20),
    name VARCHAR(7),
    mem_qualify int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE product (
    serial VARCHAR(20) PRIMARY KEY,
	license VARCHAR(20),
	nation VARCHAR(3),
    mac VARCHAR(20),
    os VARCHAR(20),
    model_line VARCHAR(20),
    model VARCHAR(20),
    sale VARCHAR(1),
	regDate DATETIME,
	register VARCHAR(12),
    FOREIGN KEY(register) REFERENCES member (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP table product;
DROP table member;
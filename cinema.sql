
CREATE TABLE cinema (
    ID int IDENTITY(1,1) NOT NULL,
    funcion varchar(100) NOT NULL,
    horario varchar(10)NOT NULL,
    sala varchar(10) not null,
	precio numeric not null,
    PRIMARY KEY (ID)
);
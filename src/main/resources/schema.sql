drop table if exists student;

create table student
(id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(256),
email VARCHAR(256),
PRIMARY KEY(id)
);
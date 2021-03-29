CREATE TABLE mathematician (
knownas varchar(20) PRIMARY KEY,
firstname varchar(20),
lastname varchar(20),
birthyear numeric(4,0),
deathyear numeric(4,0),
nationality varchar(20)
);

CREATE TABLE student (
teacher varchar(20) REFERENCES mathematician (knownas) on delete cascade,
student varchar(20) REFERENCES mathematician (knownas) on delete cascade,
PRIMARY KEY (teacher, student)
);

CREATE TABLE influence (
influencer varchar(20) REFERENCES mathematician (knownas) on delete cascade,
influenced varchar(20) REFERENCES mathematician (knownas) on delete cascade,
PRIMARY KEY (influencer, influenced)
);

CREATE TABLE publication (
title varchar(100) PRIMARY KEY,
year numeric(4,0),
language varchar(20),
author varchar(20) REFERENCES mathematician (knownas) on delete cascade
);

CREATE TABLE theorem (
name varchar(80) PRIMARY KEY,
othername varchar(50),
field varchar(20),
year numeric(4,0),
attributedto varchar(20) REFERENCES mathematician (knownas) on delete cascade
);

CREATE TABLE controversy_collaboration (
credit varchar(20) REFERENCES mathematician (knownas) on delete cascade,
theorem varchar(80) REFERENCES theorem (name) on delete cascade,
PRIMARY KEY (credit, theorem)
);

CREATE TABLE institution (
name varchar(50) PRIMARY KEY,
country varchar(20),
yearfounded numeric(4,0)
);

CREATE TABLE affiliation (
mathematician varchar(20) REFERENCES mathematician (knownas) on delete cascade,
institution varchar(50) REFERENCES institution (name) on delete cascade,  
PRIMARY KEY (mathematician, institution)
);

CREATE TABLE featured (
theorem varchar(80) REFERENCES theorem (name) on delete cascade,
publication varchar(100) REFERENCES publication (title) on delete cascade,
PRIMARY KEY (theorem, publication)
);

CREATE TABLE buildon (
theorem1 varchar(80) REFERENCES theorem (name) on delete cascade,
theorem2 varchar(80) REFERENCES theorem (name) on delete cascade,
ID1 varchar(80),
ID2 varchar(80),
PRIMARY KEY (theorem1, theorem2)
);


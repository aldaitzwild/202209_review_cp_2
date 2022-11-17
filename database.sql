CREATE DATABASE cp2_revision;

USE cp2_revision;

CREATE TABLE project (
	id int primary key auto_increment,
    name varchar(100) not null,
    description text, 
    github_url varchar(200) not null,
    number_of_pr int not null
);

INSERT project (name, description, github_url, number_of_pr)
VALUES 
('Vin sur Vin', 'Site de presentation de vin de producteurs indépendants',  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_Vin_sur_Vin/', 29),
('Le plateau', 'Site de partage de jeu de plateau sur le plateau',  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_Le_plateau', 86),
('Aeterna Fabula', 'Site internet dont on est le héros',  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_aeterna_fabula', 38),
('GoldFish', 'Site d\'agenda de concert avec gesttion des favoris',  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_Goldfish', 46)
;

CREATE TABLE comment (
	id int primary key auto_increment,
    creation_date date not null,
    comment text,
    project_id int
);

ALTER TABLE comment
ADD CONSTRAINT FK_Comment_Project
FOREIGN KEY (project_id)
REFERENCES Project(id);

CREATE TABLE developper (
	id int primary key auto_increment,
    fname VARCHAR(55),
    lname VARCHAR(55),
    project_id int,
);

ALTER TABLE developper
ADD CONSTRAINT FK_developper_project
FOREIGN KEY (project_id)
REFERENCES Project(id);
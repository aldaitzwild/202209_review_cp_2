DROP DATABASE IF EXISTS cp2_revision;

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
('GoldFish', "Site d\'agenda de concert avec gesttion des favoris",  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_Goldfish', 46)
;

CREATE TABLE comment (
	id int primary key auto_increment,
    creation_date date not null,
    comment text,
    project_id int
);

INSERT INTO cp2_revision.comment (id,creation_date,comment,project_id)
	VALUES
    (1,'2022-11-17','top',1);
    (2,'2022-11-17','bof',1);
    (3,'2022-11-17','nul',1);
    (4,'2022-11-17','génial',1);
    (5,'2022-11-17','bravo !',1);


ALTER TABLE comment
ADD CONSTRAINT FK_Comment_Project
FOREIGN KEY (project_id)
REFERENCES Project(id);
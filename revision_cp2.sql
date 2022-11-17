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
('GoldFish', 'Site d\'agenda de concert avec gesttion des favoris',  'https://github.com/WildCodeSchool/2022_09_PHP_Lyon_Goldfish', 46)
;

CREATE TABLE comment (
	id int primary key auto_increment,
    creation_date date not null,
    comment text,
    project_id int
);

INSERT comment (creation_date, comment, project_id)
VALUES 
('2022-05-12', 'Très beau projet', 4),
('2022-04-23', 'Très joli projet, très bonne idée, bravo à vous, vous êtes géniaux ! Bisous', 3),
('2022-12-03', 'Trop drôle le nom du site ! Aha le plateau', 2),
('2022-10-03', 'Un peu pochtron comme idée, mais très chouette réalisation ! Vive le Beaujolais !', 1),
('2022-09-12', 'Bof pas fou', 4),
('2022-05-23', 'J\'aime pas être le héros', 3),
('2028-03-12', 'Même dans le futur, le site est nul', 2),
('2022-12-25', 'Joyeux Noël !', 1),
('2022-04-23', 'Coucou c\'est tata, très joli projet mon neveu préféré, gros bisous de tonton aussi', 4),
('2022-03-05', 'Un projet PAR-FAIT en tout point !', 3),
('2022-08-23', 'Wow franchement c\'est vraiment super génial', 2),
('2022-04-12', 'Les images sont magnifiques', 1),
('2022-11-09', 'J\'adore les concerts, merci pour ce site et ma petite mémoire !', 4),
('2022-11-23', 'Glou Glou Glou', 3),
('2022-08-11', 'Grâce à vous, j\’ai pu emprunter des super jeux de société', 2),
('2022-09-12', 'Grâce à vous j\’ai pu acheter du bon vin', 1);

ALTER TABLE comment
ADD CONSTRAINT FK_Comment_Project
FOREIGN KEY (project_id)
REFERENCES project(id);

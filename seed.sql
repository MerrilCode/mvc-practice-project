DROP TABLE IF EXISTS genes;

CREATE TABLE gene (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  protein VARCHAR(255),
  chromosome INT,
 location VARCHAR(255),
 species VARCHAR(255)

);

INSERT INTO gene (name , protein, chromosome, location, species) VALUES ('AADACL3' , 'Arylacetamide deacetylase-like 3', 1, '1p36.21', 'Human');
INSERT INTO gene (name , protein, chromosome, location, species) VALUES ('ACTR2' , 'Actin-related protein 2', 2, '2p14', 'Human');
INSERT INTO gene (name , protein, chromosome, location, species) VALUES ('ADIPOQ' , 'Adiponectin', 3, '3q27.3','Human');
INSERT INTO gene (name , protein, chromosome, location, species) VALUES ('AASDH' , 'Aminoadipate-semialdehyde dehydrogenase', 4, '4q12', 'Human');
Create Table If NOT Exists Boek (
isbn INTEGER NOT NULL,
titel VARCHAR(255),
auteur VARCHAR(255),
PRIMARY KEY (isbn)
);

Create Table If NOT Exists Exemplaar (
volgnummer INTEGER NOT NULL,
isbn INTEGER NOT NULL,
PRIMARY KEY (volgnummer),
FOREIGN KEY (isbn)
REFERENCES Boek (isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE
);

INSERT INTO Exemplaar (volgnummer, isbn) 
VALUES (1, 1); 

INSERT INTO Exemplaar (volgnummer, isbn) 
VALUES (2, 2); 


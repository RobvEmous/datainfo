Create Table If Not Exists Boek (
isbn Integer Not Null,
titel Varchar(255),
auteur Varchar(255),
Primary Key (isbn)
);

Create Table If Not Exists Exemplaar (
volgnummer Integer not null,
isbn Integer not null,
Primary Key (volgnummer),
FOREIGN KEY (isbn)
REFERENCES Boek.isbn (isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE
);

INSERT INTO Boek (isbn, titel, auteur)
VALUES (1, 'De grote beer', 'Rob');

INSERT INTO Boek (isbn, titel, auteur)
VALUES (1, 'De kleine beer', 'Rob');
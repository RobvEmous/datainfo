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
ON UPDATE CASCADE
NOT DEFERRABLE
);

CREATE TRIGGER exemplaar_cleanup 
AFTER DELETE ON Boek
FOR EACH ROW
BEGIN
DELETE FROM Exemplaar e
WHERE e.isbn = old.isbn;
END;

CREATE TABLE If NOT Exists Bestelling (
isbn INTEGER NOT NULL,
aantal INTEGER NOT NULL,
Foreign Key (isbn)
REFERENCES Boek (isbn)
ON DELETE CASCADE
);

CREATE TRIGGER bestelling_update
BEFORE UPDATE ON Boek
FOR EACH ROW
WHEN NOT EXISTS SELECT * FROM Boek b 
	WHERE b.auteur = new.auteur;
BEGIN
INSERT INTO Bestelling(isbn, aantal) VALUES (new.isbn, 1)
WHERE b.isbn = new.isbn;
END;









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

DROP TRIGGER exemplaar_cleanup  ON "Boek";
 
CREATE OR REPLACE FUNCTION update_boek() RETURNS TRIGGER AS $$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            DELETE FROM "Exemplaar" e WHERE OLD.isbn = e.isbn;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "Boek" VALUES
                ('test', 'test', 1235);
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER exemplaar_cleanup BEFORE DELETE OR UPDATE ON "Boek"
    FOR EACH ROW
    EXECUTE PROCEDURE update_boek();
 
DELETE FROM "Boek"
  WHERE isbn = 1234;










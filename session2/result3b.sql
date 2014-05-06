SELECT p.pid FROM Person p 
WHERE 'p is an actor that played in "Back to the Future"'; 

SELECT p.pid FROM Person p 
WHERE EXISTS( 
SELECT * FROM Acts a –­ there exists an actor that is p
WHERE a.pid = p.pid 
AND 'a played in "Back to the Future"' 
); 

SELECT p.pid FROM Person p 
WHERE EXISTS( 
SELECT * FROM Acts a 
WHERE a.pid = p.pid 
AND EXISTS ( 
SELECT * FROM Movie m  –­ the movies exists and a plays in it
WHERE m.mid = a.mid 
AND m.name = 'Back to the Future' 
) --
); 
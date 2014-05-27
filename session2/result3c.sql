SELECT p.name 
FROM Person p
WHERE EXISTS (
	
	'p is a writer of a movie'
);

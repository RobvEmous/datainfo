SELECT a.pid FROM Movie m, Acts a 
WHERE m.mid = a.mid 
AND m.name = 'Back to the Future'
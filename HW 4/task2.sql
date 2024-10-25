Insert INTO petPet VALUES 
    ("Hammy","Diane","hamster","M","2010-10-30",NULL);
    
Insert INTO petEvent VALUES 
    ("Fluffy", "2020-10-15", "vet", "antibiotics"),
    ("Hammy", "2020-10-15", "vet", "antibiotics"),
    ("Fluffy", "2024-10-24", "litter", "5 kittens, 2 male, 3 female"); 
UPDATE petEvent 
 SET remark = "broken rib caused by Claws" 
WHERE Petname = "Slim" AND eventdate = "1997-08-03"; 
UPDATE petPet 
SET death = "2020-09-01" 
WHERE Petname = "Puffball";
DELETE FROM  petEvent WHERE petname = "Buffy"; 
DELETE FROM petPet  WHERE petname = "Buffy";

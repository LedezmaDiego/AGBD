
SELECT * FROM crime_scene_report
WHERE type = "murder" AND city LIKE "sql city" AND date = 20180115

SELECT * FROM person WHERE address_street_name LIKE "Northwestern Dr" ORDER BY address_number DESC
-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr".
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT interview.transcript, person.name FROM person INNER JOIN interview 
ON interview.person_id = person.id WHERE person.id = "14887"
-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag.
-- The membership number on the bag started with "48Z".
-- Only gold members have those bags. The man got into a car with a plate that included "H42W".

SELECT * FROM person
WHERE name LIKE "%nnabel%" AND address_street_name = "Franklin Ave"

SELECT interview.transcript, person.name FROM person INNER JOIN interview 
ON interview.person_id = person.id WHERE person.id = "16371"
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_member gm INNER JOIN get_fit_now_check_in gc
ON gm.id = gc.membership_id WHERE gc.membership_id LIKE "48Z%" AND gc.check_in_date = 20180109
-- Sopechoso 1: Joe Germuska
-- Sospechosos 2: Jeremy Bowers
              
SELECT * FROM person p INNER JOIN drivers_license dl
ON p.license_id = dl.id WHERE plate_number LIKE "%H42W%"
-- Acá queda claro que el sospechoso mas acertado es Jeremy Bowers
-- Por ende el asesino

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;

-- Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge,
-- try querying the interview transcript of the murderer to find the real villain behind this crime.
-- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries.
-- Use this same INSERT statement with your new suspect to check your answer.


              






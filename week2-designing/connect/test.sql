-- USERS

INSERT INTO "Users" ("id", "first_name", "last_name", "username", "password")
VALUES (1, 'Alan', 'Garber', 'alan', 'password');

INSERT INTO "Users" ("id", "first_name", "last_name", "username", "password")
VALUES (2, 'Reid', 'Hoffman', 'reid', 'password');

-- SCHOOLS

INSERT INTO "Schools" ("id", "name", "type", "location", "foundation_year")
VALUES (1, 'Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

-- COMPANIES

INSERT INTO "Companies" ("id", "name", "industry", "location")
VALUES (1, 'LinkedIn', 'Technology', 'Sunnyvale, California');

-- CONNECTIONS SCHOOLS

INSERT INTO "Connections_schools"
("user_id", "school_id", "degree", "start_date_affiliation", "end_date_affiliation")
VALUES
(1, 1, 'BA', '1973-09-01', '1976-06-01');

-- CONNECTIONS COMPANIES

INSERT INTO "Connections_companies"
("user_id", "company_id", "title", "start_date_affiliation", "end_date_affiliation")
VALUES
(2, 1, 'CEO and Chairman', '2003-01-01', '2007-02-01');

-- QUERYS FOR CHECKING
SELECT * FROM Users;
SELECT * FROM Schools;
SELECT * FROM Companies;

-- Alan's education
SELECT Users.first_name, Users.last_name, Schools.name, Connections_schools.degree
FROM Connections_schools
JOIN Users ON Users.id = Connections_schools.user_id
JOIN Schools ON Schools.id = Connections_schools.school_id
WHERE Users.id = 1;

-- Reid's work
SELECT Users.first_name, Users.last_name, Companies.name, Connections_companies.title
FROM Connections_companies
JOIN Users ON Users.id = Connections_companies.user_id
JOIN Companies ON Companies.id = Connections_companies.company_id
WHERE Users.id = 2;

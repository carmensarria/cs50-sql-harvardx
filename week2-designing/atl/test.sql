INSERT INTO "Passengers"
("first_name", "last_name", "age")
VALUES
('Amelia', 'Earhart', 39);

INSERT INTO "Airlines"
("name", "concourse")
VALUES
('Delta', 'A, B, C, D, T');

INSERT INTO "Flights"
(
    "flight_number",
    "airline_id",
    "depart_airport",
    "landing_airport",
    "departure_datetime",
    "arrival_datetime"
)
VALUES
(
    300,
    1,
    'ATL',
    'BOS',
    '2023-08-03 18:46:00',
    '2023-08-03 21:09:00'
);

INSERT INTO "Check_ins"
(
    "passenger_id",
    "flight_id",
    "datetime"
)
VALUES
(
    1,
    1,
    '2023-08-03 15:03:00'
);

SELECT * FROM "Passengers";
SELECT * FROM "Airlines";
SELECT * FROM "Flights";
SELECT * FROM "Check_ins";

CREATE TABLE "Passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK ("age" > 0),
    PRIMARY KEY ("id")
);

CREATE TABLE "Airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "depart_airport" TEXT NOT NULL,
    "landing_airport" TEXT NOT NULL,
    "departure_datetime" NUMERIC NOT NULL,
    "arrival_datetime" NUMERIC NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "Airlines" ("id")
);

CREATE TABLE "Check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "Flights"("id")
);

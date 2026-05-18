CREATE TABLE "Users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "foundation_year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Connections_people" (
    "user_id_1" INTEGER NOT NULL,
    "user_id_2" INTEGER NOT NULL,
    PRIMARY KEY ("user_id_1", "user_id_2"),
    FOREIGN KEY ("user_id_1") REFERENCES "Users"("id"),
    FOREIGN KEY ("user_id_2") REFERENCES "Users"("id")
);

CREATE TABLE "Connections_schools" (
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "degree" TEXT NOT NULL,
    "start_date_affiliation" NUMERIC NOT NULL,
    "end_date_affiliation" NUMERIC,
    PRIMARY KEY ("user_id", "school_id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "Schools"("id")
);

CREATE TABLE "Connections_companies" (
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "start_date_affiliation" NUMERIC NOT NULL,
    "end_date_affiliation" NUMERIC,
    PRIMARY KEY ("user_id", "company_id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id")
);

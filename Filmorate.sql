CREATE TABLE "user" (
  "user_id" int PRIMARY KEY,
  "email" varchar,
  "name" varchar,
  "login" varchar,
  "birthday" date
);

CREATE TABLE "friendship" (
  "user_id" int PRIMARY KEY,
  "friend_user_id" int,
  "status" bool
);

CREATE TABLE "film" (
  "film_id" int PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "release_date" date,
  "duration" int,
  "mpa_id" int
);

CREATE TABLE "like" (
  "user_id" int,
  "film_id" int PRIMARY KEY
);

CREATE TABLE "genre" (
  "genre_id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "mpa" (
  "mpa_id" int PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

ALTER TABLE "like" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "like" ADD FOREIGN KEY ("film_id") REFERENCES "film" ("film_id");

ALTER TABLE "friendship" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "friendship" ADD FOREIGN KEY ("friend_user_id") REFERENCES "user" ("user_id");

ALTER TABLE "genre" ADD FOREIGN KEY ("genre_id") REFERENCES "film" ("film_id");

ALTER TABLE "film" ADD FOREIGN KEY ("mpa_id") REFERENCES "mpa" ("mpa_id");

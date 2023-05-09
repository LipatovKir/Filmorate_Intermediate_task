CREATE TABLE "users" (
  "user_id" int PRIMARY KEY,
  "email" varchar,
  "name" varchar,
  "login" varchar,
  "birthday" date
);

CREATE TABLE "friendship" (
  "user_id" int PRIMARY KEY,
  "friend_id" int,
  "status" bool
);

CREATE TABLE "films" (
  "film_id" int PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "releaseDate" date,
  "duration" int,
  "mpa_id" int
);

CREATE TABLE "likes" (
  "user_id" int,
  "film_id" int PRIMARY KEY
);

CREATE TABLE "genre" (
  "genre_id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "MPA" (
  "mpa_id" int PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "likes" ADD FOREIGN KEY ("film_id") REFERENCES "films" ("film_id");

ALTER TABLE "friendship" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "friendship" ADD FOREIGN KEY ("friend_id") REFERENCES "users" ("user_id");

ALTER TABLE "genre" ADD FOREIGN KEY ("genre_id") REFERENCES "films" ("film_id");

ALTER TABLE "films" ADD FOREIGN KEY ("mpa_id") REFERENCES "MPA" ("mpa_id");

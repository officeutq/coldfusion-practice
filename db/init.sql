CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  body TEXT NOT NULL
);

INSERT INTO messages (body) VALUES ('Hello World');

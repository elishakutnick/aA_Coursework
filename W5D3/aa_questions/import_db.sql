
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;


CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL, 
  question_id INTEGER NOT NULL,
   
  FOREIGN KEY (user_id) REFERENCES users(id), 
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

/* ---------- */

INSERT INTO 
    users(fname, lname)
VALUES
    ('Spongebob', 'Squarepants'),
    ('Patrick', 'Star');


/* ---------- */


INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('First Question', 'Who lives in a pineapple under the sea?', 
    (SELECT id FROM users WHERE fname = 'Spongebob')),

    ('Second Question', 'Who lives under a rock under the sea?', 
    (SELECT id FROM users WHERE fname = 'Patrick'));


/* ---------- */


INSERT INTO
    question_follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Spongebob'), 
    (SELECT id FROM questions WHERE questions.title = 'First Question')   /* better to look WHERE text is bc no guarantee of id being consistent */
    ),

    ((SELECT id FROM users WHERE fname = 'Patrick'), 
    (SELECT id FROM questions WHERE questions.title = 'Second Question')   
    );


/* ---------- */


INSERT INTO
  replies(question_id, author_id, parent_reply_id, body) 
VALUES
  ((SELECT id FROM questions WHERE questions.title = 'First Question'),
  (SELECT id FROM users WHERE fname = 'Spongebob'),
  (SELECT replies.id FROM replies WHERE replies.body = 'I think it''s Spongebob'),
  'I think it''s Spongebob'
  ),
  

  ((SELECT id FROM questions WHERE questions.title = 'Second Question'),
  (SELECT id FROM users WHERE fname = 'Patrick'),
  (SELECT replies.id FROM replies WHERE replies.body = 'I think it''s Patrick'),
  'I think it''s Patrick'
  );

  /* ---------- */

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Spongebob'), 
  (SELECT id FROM questions WHERE questions.title = 'First Question')   
  ),

  ((SELECT id FROM users WHERE fname = 'Patrick'), 
  (SELECT id FROM questions WHERE questions.title = 'Second Question')   
  );
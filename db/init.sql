DROP TABLE IF EXISTS meigens;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS users;

create table meigens (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 main TEXT NOT NULL,
 cartoon_title TEXT NOT NULL,
 user_id INTEGER  NOT NULL
);
create table likes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  meigen_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL
);
create table users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
insert into users(name,email,password) values ("test-1","aaa","aaa");
insert into meigens(main,cartoon_title,user_id) values ("俺のドリルは天を突くドリルだ！！！","天元突破グレンラガン",1);
insert into meigens(main,cartoon_title,user_id) values ("無茶を通して通りを蹴っ飛ばすんだよ！！！","天元突破グレンラガン",1);
insert into likes values (1,1,1);


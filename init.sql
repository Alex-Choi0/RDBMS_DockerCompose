-- Create Users table
CREATE TABLE Users (
  id serial PRIMARY KEY, -- 유저 고유 ID
  nickname VARCHAR(255) UNIQUE NOT NULL, -- 유저 닉네임 고유값
  password VARCHAR(255), -- 유저의 비밀번호
  socialUser BOOLEAN, -- 소셜로그인 유저이면 true 입력
  socialUserType VARCHAR(255), -- 소셜로그인 타입 ex) google
  email VARCHAR(255) UNIQUE NOT NULL, -- 유저의 Email
  refrashToken VARCHAR(255) UNIQUE, -- Access 토큰을 갱신한다.
  created_at DATE,
  updated_at DATE
);

-- Create Post table
CREATE TABLE Post (
  id serial PRIMARY KEY,
  type VARCHAR(255), -- 글의 타입. (공지글, 일반글). 공지글을 관리자만 작성이 가능하다.
  title VARCHAR(255), -- 글의 title
  body TEXT, -- 글의 내용
  userId INT, -- 글 작성자
  count INT DEFAULT 0, -- 조회수 (초기값은 0이다)
  `like` INT DEFAULT 0, -- 좋아요
  `hate` INT DEFAULT 0, -- 싫어요
  created_at DATE,
  updated_at DATE
);

-- Create JoinLikeHate table
CREATE TABLE JoinLikeHate (
  userId BIGINT UNSIGNED,
  postId BIGINT UNSIGNED,
  status VARCHAR(255), -- like(좋아요), hate(싫어요)를 입력한다.
  created_at DATE,
  updated_at DATE,
  PRIMARY KEY (userId, postId),
  FOREIGN KEY (userId) REFERENCES Users(id),
  FOREIGN KEY (postId) REFERENCES Post(id)
);

-- Create Tag table
CREATE TABLE Tag (
  name VARCHAR(255) UNIQUE NOT NULL, -- 태그는 고유값이다.
  created_at DATE -- 태그 생성날짜
);

-- Create JoinPostTag table
CREATE TABLE JoinPostTag (
  postId BIGINT UNSIGNED,
  tag VARCHAR(255),
  CONSTRAINT PK_JoinPostTag PRIMARY KEY (postId, tag),
  FOREIGN KEY (postId) REFERENCES Post(id),
  FOREIGN KEY (tag) REFERENCES Tag(name)
);

-- Create Comment table
CREATE TABLE Comment (
  commentId serial PRIMARY KEY,
  postId BIGINT UNSIGNED, -- 게시글 ID
  linkId BIGINT UNSIGNED, -- 대댓글 ID
  userId BIGINT UNSIGNED, -- 유저ID
  body TEXT, -- 댓글 내용
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY (postId) REFERENCES Post(id),
  FOREIGN KEY (linkId) REFERENCES Comment(commentId),
  FOREIGN KEY (userId) REFERENCES Users(id)
);


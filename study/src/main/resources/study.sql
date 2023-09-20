-- members
CREATE TABLE members 
(
  member_id VARCHAR2(100) NOT NULL
, member_password VARCHAR2(512) NOT NULL
, member_name VARCHAR2(50) NOT NULL
, member_tel VARCHAR2(20)
, member_address VARCHAR2(100) NOT NULL
, member_email VARCHAR2(100)
, member_enter_date DATE DEFAULT SYSDATE NOT NULL
, member_stop_date DATE
, member_author VARCHAR2(20) DEFAULT 'client' NOT NULL
, CONSTRAINT members_member_id_pk PRIMARY KEY
  (
    member_id 
  )
  ENABLE
);

COMMENT ON COLUMN members.member_id IS '회원 ID';
COMMENT ON COLUMN members.member_password IS '회원 비밀번호';
COMMENT ON COLUMN members.member_name IS '회원 이름';
COMMENT ON COLUMN members.member_tel IS '회원 연락처';
COMMENT ON COLUMN members.member_address IS '회원 주소';
COMMENT ON COLUMN members.member_email IS '회원 이메일';
COMMENT ON COLUMN members.member_enter_date IS '회원 가입날짜';
COMMENT ON COLUMN members.member_stop_date IS '회원 정지날짜';
COMMENT ON COLUMN members.member_author IS '회원 권한';





-- courses
CREATE TABLE courses 
(
  course_id NUMBER NOT NULL
, course_name VARCHAR2(100) NOT NULL
, course_script VARCHAR2(1024)
, course_price NUMBER DEFAULT 0 NOT NULL
, course_main_category VARCHAR2(30) NOT NULL
, course_sub_category VARCHAR2(30) NOT NULL
, course_teacher VARCHAR2(50) NOT NULL
, course_grade VARCHAR2(20) DEFAULT 'normal' NOT NULL
, course_img VARCHAR2(100)
, CONSTRAINT courses_course_id_pk PRIMARY KEY
  (
    course_id 
  )
  ENABLE 
);

COMMENT ON COLUMN courses.course_id IS '강의 ID';
COMMENT ON COLUMN courses.course_name IS '강의 이름';
COMMENT ON COLUMN courses.course_script IS '강의 설명';
COMMENT ON COLUMN courses.course_price IS '강의 가격';
COMMENT ON COLUMN courses.course_main_category IS '강의 메인 카테고리';
COMMENT ON COLUMN courses.course_sub_category IS '강의 서브 카테고리';
COMMENT ON COLUMN courses.course_teacher IS '강의 강사';
COMMENT ON COLUMN courses.course_grade IS '강의 난이도';
COMMENT ON COLUMN courses.course_img IS '강의 이미지첨부';





-- members_courses
CREATE TABLE members_courses 
(
  member_id VARCHAR2(100) NOT NULL
, course_id NUMBER NOT NULL
, CONSTRAINT members_courses_pk PRIMARY KEY 
  (
    member_id, course_id
  )
, CONSTRAINT members_courses_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE CASCADE
, CONSTRAINT members_courses_course_id_fk FOREIGN KEY
  (
    course_id 
  )
  REFERENCES courses
  (
    course_id 
  )
  ON DELETE CASCADE
  ENABLE 
);

COMMENT ON COLUMN members_courses.member_id IS '회원 ID';
COMMENT ON COLUMN members_courses.course_id IS '강의 ID';





-- subcourses
CREATE TABLE subcourses 
(
  subcourse_id NUMBER NOT NULL
, course_id NUMBER NOT NULL
, subcourse_name VARCHAR2(100) NOT NULL
, subcourse_link VARCHAR2(256) NOT NULL
, subcourse_time NUMBER NOT NULL
, CONSTRAINT subcourses_subcourse_id_pk PRIMARY KEY 
  (
    subcourse_id
  )
, CONSTRAINT subcourses_course_id_fk FOREIGN KEY
  (
    course_id 
  )
  REFERENCES courses
  (
    course_id 
  )
  ON DELETE CASCADE
  ENABLE 
);

COMMENT ON COLUMN subcourses.subcourse_id IS '세부강의 ID';
COMMENT ON COLUMN subcourses.course_id IS '강의 ID';
COMMENT ON COLUMN subcourses.subcourse_name IS '세부강의 이름';
COMMENT ON COLUMN subcourses.subcourse_link IS '세부강의 링크';
COMMENT ON COLUMN subcourses.subcourse_time IS '세부강의 시간';





-- reviews
CREATE TABLE reviews 
(
  review_id NUMBER NOT NULL
, member_id VARCHAR2(100) NOT NULL
, course_id NUMBER NOT NULL
, review_content VARCHAR2(512)
, review_stars NUMBER NOT NULL
, review_enter_date DATE DEFAULT SYSDATE NOT NULL
, review_update_date DATE
, CONSTRAINT reviews_review_id_pk PRIMARY KEY 
  (
    review_id
  )
  ENABLE 
);

COMMENT ON COLUMN reviews.review_id IS '후기 ID';
COMMENT ON COLUMN reviews.member_id IS '회원 ID';
COMMENT ON COLUMN reviews.course_id IS '강의 ID';
COMMENT ON COLUMN reviews.review_content IS '후기 내용';
COMMENT ON COLUMN reviews.review_stars IS '후기 별점';
COMMENT ON COLUMN reviews.review_enter_date IS '후기 작성일';
COMMENT ON COLUMN reviews.review_update_date IS '후기 수정일';





-- bucket
CREATE TABLE bucket
(
  member_id VARCHAR2(100) NOT NULL
, course_id NUMBER NOT NULL
, count NUMBER DEFAULT 0 NOT NULL
, CONSTRAINT bucket_pk PRIMARY KEY
  (
    member_id, course_id
  )
, CONSTRAINT bucket_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE CASCADE
, CONSTRAINT bucket_course_id_fk FOREIGN KEY
  (
    course_id 
  )
  REFERENCES courses
  (
    course_id 
  )
  ON DELETE CASCADE
);

COMMENT ON COLUMN bucket.member_id IS '회원 ID';
COMMENT ON COLUMN bucket.course_id IS '강의 ID';
COMMENT ON COLUMN bucket.count IS '진도';




-- boards
CREATE TABLE boards 
(
  board_id NUMBER NOT NULL
, member_id VARCHAR2(100) NOT NULL
, board_title VARCHAR2(100) NOT NULL
, board_content VARCHAR2(512) NOT NULL
, board_enter_date DATE DEFAULT SYSDATE NOT NULL
, board_update_date DATE
, board_img VARCHAR2(100)
, board_hit NUMBER DEFAULT 0 NOT NULL
, board_like NUMBER DEFAULT 0 NOT NULL
, board_dislike NUMBER DEFAULT 0 NOT NULL
, CONSTRAINT boards_board_id_pk PRIMARY KEY 
  (
    board_id
  )
, CONSTRAINT boards_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE SET NULL
  ENABLE 
);

COMMENT ON COLUMN boards.board_id IS '게시글 ID';
COMMENT ON COLUMN boards.member_id IS '회원 ID';
COMMENT ON COLUMN boards.board_title IS '게시글 제목';
COMMENT ON COLUMN boards.board_content IS '게시글 내용';
COMMENT ON COLUMN boards.board_enter_date IS '게시글 작성일';
COMMENT ON COLUMN boards.board_update_date IS '게시글 수정일';
COMMENT ON COLUMN boards.board_img IS '게시글 이미지첨부';
COMMENT ON COLUMN boards.board_hit IS '게시글 조회수';
COMMENT ON COLUMN boards.board_like IS '게시글 좋아요';
COMMENT ON COLUMN boards.board_dislike IS '게시글 싫어요';





-- replies
CREATE TABLE replies
(
  reply_id NUMBER NOT NULL
, board_id NUMBER NOT NULL
, member_id VARCHAR2(100) NOT NULL
, reply_content VARCHAR2(512) NOT NULL
, reply_enter_date DATE DEFAULT SYSDATE NOT NULL
, reply_update_date DATE
, reply_like NUMBER DEFAULT 0 NOT NULL
, reply_dislike NUMBER DEFAULT 0 NOT NULL
, CONSTRAINT replies_reply_id_pk PRIMARY KEY 
  (
    reply_id
  )
, CONSTRAINT replies_board_id_fk FOREIGN KEY
  (
    board_id 
  )
  REFERENCES boards
  (
    board_id 
  )
  ON DELETE CASCADE
, CONSTRAINT replies_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE SET NULL
  ENABLE 
);

COMMENT ON COLUMN replies.reply_id IS '댓글 ID';
COMMENT ON COLUMN replies.board_id IS '게시글 ID';
COMMENT ON COLUMN replies.member_id IS '회원 ID';
COMMENT ON COLUMN replies.reply_content IS '댓글 내용';
COMMENT ON COLUMN replies.reply_enter_date IS '댓글 작성일';
COMMENT ON COLUMN replies.reply_update_date IS '댓글 수정일';
COMMENT ON COLUMN replies.reply_like IS '댓글 좋아요';
COMMENT ON COLUMN replies.reply_dislike IS '댓글 싫어요';





-- questions
CREATE TABLE questions
(
  question_id NUMBER NOT NULL
, member_id VARCHAR2(100) NOT NULL
, course_id NUMBER NOT NULL
, question_title VARCHAR2(100) NOT NULL
, question_content VARCHAR2(512) NOT NULL
, question_enter_date DATE DEFAULT SYSDATE NOT NULL
, question_update_date DATE
, question_img VARCHAR2(100)
, question_hit NUMBER DEFAULT 0 NOT NULL
, CONSTRAINT questions_question_id_pk PRIMARY KEY 
  (
    question_id
  )
, CONSTRAINT questions_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE SET NULL
, CONSTRAINT questions_course_id_fk FOREIGN KEY
  (
    course_id 
  )
  REFERENCES courses
  (
    course_id 
  )
  ON DELETE CASCADE
  ENABLE 
);

COMMENT ON COLUMN questions.reply_id IS '질문 ID';
COMMENT ON COLUMN questions.member_id IS '회원 ID';
COMMENT ON COLUMN questions.course_id IS '게시글 ID';
COMMENT ON COLUMN questions.question_title IS '질문 제목';
COMMENT ON COLUMN questions.question_content IS '질문 내용';
COMMENT ON COLUMN questions.question_enter_date IS '질문 작성일';
COMMENT ON COLUMN questions.question_update_date IS '질문 수정일';
COMMENT ON COLUMN questions.question_img IS '질문 이미지첨부';
COMMENT ON COLUMN questions.question_hit IS '질문 조회수';


-- answers
CREATE TABLE answers
(
  answer_id NUMBER NOT NULL
, question_id NUMBER NOT NULL
, member_id VARCHAR2(100) NOT NULL
, answer_content VARCHAR2(512) NOT NULL
, answer_enter_date DATE DEFAULT SYSDATE NOT NULL
, answer_update_date DATE
, answer_img VARCHAR2(100)
, answer_like NUMBER DEFAULT 0 NOT NULL
, answer_dislike NUMBER DEFAULT 0 NOT NULL
, CONSTRAINT answers_answer_id_pk PRIMARY KEY 
  (
    answer_id
  )
, CONSTRAINT answers_question_id_fk FOREIGN KEY
  (
    question_id 
  )
  REFERENCES questions
  (
    question_id 
  )
  ON DELETE CASCADE
, CONSTRAINT answers_member_id_fk FOREIGN KEY
  (
    member_id 
  )
  REFERENCES members
  (
    member_id 
  )
  ON DELETE SET NULL
  ENABLE 
);

COMMENT ON COLUMN answers.answer_id IS '답변 ID';
COMMENT ON COLUMN answers.question_id IS '질문 ID';
COMMENT ON COLUMN answers.member_id IS '회원 ID';
COMMENT ON COLUMN answers.answer_content IS '답변 내용';
COMMENT ON COLUMN answers.answer_enter_date IS '답변 작성일';
COMMENT ON COLUMN answers.answer_update_date IS '답변 수정일';
COMMENT ON COLUMN answers.answer_img IS '답변 이미지첨부';
COMMENT ON COLUMN answers.answer_img IS '답변 좋아요';
COMMENT ON COLUMN answers.answer_img IS '답변 싫어요';





-- 커밋
COMMIT;

-- 롤백
ROLLBACK;

-- 테이블 제약조건 무시하고 전체 삭제
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE courses CASCADE CONSTRAINTS;
DROP TABLE members_courses CASCADE CONSTRAINTS;
DROP TABLE subcourses CASCADE CONSTRAINTS;
DROP TABLE reviews CASCADE CONSTRAINTS;
DROP TABLE bucket CASCADE CONSTRAINTS;
DROP TABLE boards CASCADE CONSTRAINTS;
DROP TABLE replies CASCADE CONSTRAINTS;
DROP TABLE questions CASCADE CONSTRAINTS;
DROP TABLE answers CASCADE CONSTRAINTS;
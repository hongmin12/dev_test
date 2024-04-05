-- tbl_board 테이블 생성

create table tbl_board(
	bno number primary key,                    -- 게시판 글번호.
	writer varchar2(50) not null,              -- 게시판 글 작성자.
	title varchar2(100) not null,              -- 게시판 글 제목.
	content varchar2(1000) not null,           -- 게시판 글 내용.
	pwd varchar2(50) not null,                 -- 게시판 글 비밀번호.
	regdate date not null,                     -- 게시판 글 작성일자.
	regupdate date                             -- 게시판 글 수정일자.
);


-- tbl_board 테이블에 게시글을 추가해 주자.
insert into tbl_board
	values(1, '홍길동', '제목1', '내용1', '1111', sysdate, '');
	
insert into tbl_board
	values(2, '세종대왕', '한글', '한글 애용~~~', '2222', sysdate, '');
	
insert into tbl_board
	values(3, '유관순', '만세', '대한독립만세!!!', '3333', sysdate, '');	
	
	
	
	
	
	
	
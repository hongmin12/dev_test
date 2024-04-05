-- tbl_reply 테이블 생성

create table tbl_reply(
	rno number primary key,                       -- 답변 글 번호.
	bno number not null,                          -- 원글 번호.
	rewriter varchar2(50) not null,               -- 답변글 작성자.
	recont varchar2(1000) not null,               -- 답변글 내용.
	redate date not null,                         -- 답변글 작성일자.
	reupdate date                                 -- 답변글 수정일자.
);

alter table tbl_reply add constraint reply_board_fk
foreign key (bno) references tbl_board(bno);
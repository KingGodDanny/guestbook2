Drop table guestbook;
DROP SEQUENCE seq_guestbook_id;

--guestbook 테이블 만들기 ( Primary key 설정, Not Null 설정 )
create table guestbook (
    guestbook_id number ,
    name VARCHAR2(80) ,
    password VARCHAR2(20),
    content VARCHAR2(2000),
    reg_date date,
    PRIMARY KEY (guestbook_id)
);

-- Sequence 만들기  (프라이머리 키-person_id가 1씩 증가하게끔)
create SEQUENCE seq_guestbook_id
INCREMENT BY 1 
START WITH 1;

commit;


select guestbook_id,
       name,
       password,
       content,
       reg_date
from guestbook
order by guestbook_id asc;

INSERT INTO guestbook VALUES(seq_guestbook_id.nextval, '정우성', '12412','하하하하오호호호', sysdate);



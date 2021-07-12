Drop table guestbook;
DROP SEQUENCE seq_guestbook_id;

--guestbook ���̺� ����� ( Primary key ����, Not Null ���� )
create table guestbook (
    guestbook_id number ,
    name VARCHAR2(80) ,
    password VARCHAR2(20),
    content VARCHAR2(2000),
    reg_date date,
    PRIMARY KEY (guestbook_id)
);

-- Sequence �����  (�����̸Ӹ� Ű-person_id�� 1�� �����ϰԲ�)
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

INSERT INTO guestbook VALUES(seq_guestbook_id.nextval, '���켺', '12412','�������Ͽ�ȣȣȣ', sysdate);



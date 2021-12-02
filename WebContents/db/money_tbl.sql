drop SEQUENCE "JSP"."MEMBER_SEQ";

CREATE SEQUENCE  "JSP"."MEMBER_SEQ"  
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 10001 
CACHE 20 
NOORDER  
NOCYCLE ;

create table money_tbl (
    custno  number(6)  not null  --고객번호 
  , salenol number(8)  not null  --판매번호
  , pcost   number(6)            --단가
  , amount  number(4)            --수량
  , price   number(8)            --가격
  , pcode   VARCHAR2(4)          --상품코드
  , sdate   date                 --판매일자
  ,primary key(custno, salenol)
);

DROP TABLE money_tbl;

insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
 insert into money_tbl (custno, salenol, pcost, amount, price, pcode, sdate)
 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');
 commit;
 
 
 
SELECT R.CUSTNO, R.CUSTNAME, R.GRADE, SUM(Y.PRICE)
 FROM MEMBER_TBL R JOIN MONEY_TBL Y
 ON R.CUSTNO = Y.CUSTNO
 GROUP BY R.CUSTNO, R.CUSTNAME, R.GRADE;
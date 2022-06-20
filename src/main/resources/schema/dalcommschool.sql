INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('lee1234', 'Lee12345', '이나영', '01011111111', 'lee@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('park1234', 'Park12345', '박미영', '01022222222','park@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('choi1234', 'Choi12345', '최가영', '01033333333', 'choi@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('kim1234', 'Kim12345', '김다영', '01044444444', 'kim@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('haa1234', 'Haa12345', '하진영', '01055555555', 'haa@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('moon1234', 'Moon12345', '문하영', '01066666666', 'moon@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('hong1234', 'Hong12345', '홍주영', '01077777777', 'hong@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('goo1234', 'Goo12345', '구민영', '01088888888', 'goo@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('ann1234', 'Ann12345', '안준영', '01099999999', 'ann@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('jang1234', 'Jang12345', '장영희', '01011112222', 'jang@naver.com', systimestamp, 'F');

select*from student;
commit;
--선생님 
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tlee1234' , 'Lee12345','이수영','이쁘니','01099999992', '01099999991', 'Tlee@naver.com','강사 소개글입니다.','이수영님프로필사진입니다.' , 2000000, 1500000, systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tjang1234' , 'Jang12345', '장도준', '도도한나쵸', '01088888882', '01088888881', 'Tjang@naver.com','강사 소개글입니다.', '장도준님프로필사진입니다.' , 3000000, 1000000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tann1234' , 'Ann12345', '안나영', '오늘도안뇽히', '01077777772', '01077777771', 'Tann@naver.com','강사 소개글입니다.', '안나영님프로필사진입니다.' , 4000000, 1500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tgoo1234' , 'Goo12345', '구준희', '구구88', '01066666662', '01066666661', 'Tgoo@naver.com','강사 소개글입니다','구준희님프로필사진입니다.' , 2000000, 500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Thong1234' , 'Hong12345', '홍주영', '호호호', '01055555552', '01055555551', 'Thong@naver.com','강사 소개글입니다.','홍주영님프로필사진입니다.' , 3500000, 2500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tmoon1234' , 'Moon12345', '문지영', '달님별님', '01044444442', '01044444441', 'Tmoon@naver.com','강사 소개글입니다.', '문지영님프로필사진입니다.' , 2000000, 1500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Thaa1234' , 'Haa12345', '하수영', '하하호호', '01033333332', '01033333331', 'Thaa@naver.com','강사 소개글입니다.','하수영님프로필사진입니다.' , 5000000, 1500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tkim1234' , 'Kim12345', '김문영', '레모나', '01022222223', '01022222221', 'Tkim@naver.com','강사 소개글입니다.', '김문영님프로필사진입니다.' , 2000000, 1000000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tchoi1234' , 'Choi12345', '최나영', '최고의기술자', '01011111112', '01011111113', 'Tchoi@naver.com','강사 소개글입니다.', '최나영님프로필사진입니다.' , 3000000, 1500000,systimestamp,'F');
INSERT INTO teacher(teacher_id,teacher_pwd,teacher_name,teacher_nickname,teacher_phone,teacher_tel,teacher_email,teacher_info,teacher_img,total_profit,adjustable,teacher_insert_date,teacher_quit) values( 'Tpark1234' , 'Park12345', '박진희', '요술램프지니', '01099998882', '01099998881', 'Tpark@naver.com','강사 소개글입니다.', '박진희님프로필사진입니다.' , 2000000, 1500000,systimestamp,'F');

select*from teacher;

delete from teacher where teacher_img='이수영님프로필사진입니다.';

--1대1문의     안됌
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'lee1234' , 'Tlee1234', '부분환불을 원합니다', '환불', '클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp, 'T');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'park1234' , 'Tpark1234', '클래스 등록 신청 여부를 알기 원합니다', '클래스', '클래스 등록신청을 하나했는데 언제 완료가 되는지 궁금합니다.' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'choi1234' , 'Tchoi1234', '후기 블라인드처리 문의드립니다.', '후기', '얼마전에 후기를 작성했는데 제가 작성한 후기가 보이지 않습니다.' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'kim1234' , 'Tkim1234', '등록한 클래스를 수정하고 싶어요', '클래스', '클래스를 하나 등록했는데 오타가 하나 있어서 수정을 하고 싶습니다.' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'lee1234' , 'Tlee1234', '환불해주세요', '환불', '클래스를 예약하고 수업에 갔지만 강사님께서 준비한 재료가 너무 이상했습니다. 환불 요청드립니다.' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'haa1234' , 'Thaa1234', '회원탈퇴를 하고 싶어요', '탈퇴', '회원탈퇴를 하고 싶은데 어떻게 탈퇴해야하는지 잘 모르겠습니다. 자세한 설명 부탁드립니다.' , null, systimestamp, systimestamp, 'T');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'moon1234' ,'Tmoon1234', '결제시 계속 오류가 나요', '결제', '클래스를 예약신청하려고 하면 자꾸 결제부분에서 오류가 납니다.' , null, systimestamp, systimestamp, 'T');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'hong1234' , 'Thong1234', '부분환불을원합니다', '환불', '클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'goo1234' , 'Tgoo1234', '확정된 클래스 일정을 알고 싶어요', '클래스', '원하는 클래스의 일정이 계속 안올라와서요 정확한 일정을 알고 싶습니다.' , null, systimestamp, systimestamp, 'F');
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'ann1234' , 'Tann1234', '클래스 공개취소를 원합니다.', '환불', '올렸던 클래스를 급하게 비공개로 바꾸고 싶어요' , null, systimestamp, systimestamp, 'F');

alter table class_schedule add schedule_finished varchar2(255 char) default 'F'

update set schedule_finished = 'F'

create SEQUENCE ask_no_seq noCACHE;

--1대1 문의댓글  안됌
INSERT INTO ANSWER(answer_no, ask_no, answer_content, answer_insert_date) VALUES(answer_no_seq.NEXTVAL, ask_no_seq.CURRVAL, '고객님 저희 사이트 환불 정책상 부분환불은 어렵습니다', systimestamp);
INSERT INTO ANSWER(answer_no, ask_no, answer_content, answer_insert_date) VALUES(answer_no_seq.NEXTVAL, ask_no_seq.CURRVAL, '고객님 회원탈퇴 방법은 자주묻는질문 게시판에 들어가보면 상세히 나와 있습니다.', systimestamp);
INSERT INTO ANSWER(answer_no, ask_no, answer_content, answer_insert_date) VALUES(answer_no_seq.NEXTVAL, ask_no_seq.CURRVAL, '고객님 죄송합니다 저희 사이트는 매일  자정12시부터 30분정도 매일 시스템 점검으로 인해서 그 시간에는 결제가 어렵습니다. ', systimestamp);
commit;
--클래스
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tlee1234', 1, '마카롱만들기', '저희 마카롱만들기는 당일 완성이 가능하며 4시간동안 수업이 진행됩니다.', '30000', systimestamp, systimestamp, systimestamp, 4);
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tann1234', 2, '커스텀 케익 만들기', '저희 커스텀 케익 만들기는 당일 완성이 가능하며 6시간동안 수업이 진행됩니다.', '80000', systimestamp, systimestamp, systimestamp, 3);
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tgoo1234', 3, '무지개떡 만들기', '저희 무지개떡 만들기는 당일 완성이 가능하며 5시간동안 수업이 진행됩니다.', '30000', systimestamp, systimestamp, systimestamp, 6);
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tchoi1234', 3, '쿠키 만들기', '저희 쿠키 만들기는 당일 완성이 가능하며 3시간동안 수업이 진행됩니다.', '25000', systimestamp, systimestamp, systimestamp, 1);
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tkim1234', 3, '반려견쿠키 만들기', '저희 반려견쿠키 만들기는 당일 완성이 가능하며 3시간30분동안 수업이 진행됩니다.', '50000', systimestamp, systimestamp, systimestamp, 7);
INSERT INTO CLASSES(class_id, teacher_id, state_id, class_name, class_info, class_price, class_insert_date, class_update_date, class_open_date, category_id) VALUES(CLASS_ID_SEQ.nextval, 'Tpark1234', 3, '생크림 슈 만들기', '저희 생크림 슈 만들기는 당일 완성이 가능하며 2시간동안 수업이 진행됩니다.', '20000', systimestamp, systimestamp, systimestamp, 1);

--클래스카테고리
set escape on
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '쿠키');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '구움과자');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '빵');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '케이크');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '마카롱');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '파이\&타르트');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, '떡');
INSERT INTO CLASS_CATEGORY VALUES(category_id_seq.nextval, 'for 반려동물');
set escape off

CREATE SEQUENCE  category_id_seq
        START WITH 1
        INCREMENT BY 1;

Alter table class_qna rename column qnacontent to qna_content;
commit;
--클래스 Q&A 안됌
insert into class_qna values ( qna_id_seq.nextval , false, true, systimestamp, '수업 문의 드립니다.', null, '빵 만들고 집에 가져가고 싶은데 혹시 포장지도 제공이 되나요?', false, class_id_seq.currval, 'Lee12345');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp, '재료 문의드립니다.', null, '견과류 알러지가 있는데 재료 교체도 가능한가요?', false, class_id_seq.currval, 'kim1234');
insert into class_qna values ( qna_id_seq.nextval , false, true, systimestamp, '주차공간 문의 드려요.', null,'주차공간이 얼마나 있을지 궁금합니다. 차가 좀 커서 공간이 많이 필요합니다.', false, class_id_seq.currval, 'haa1234');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp,'수업 문의 드려요', null, '아이들을 데려가도 괜찮을까요?', false, class_id_seq.currval, 'moon1234');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp, '어제 예약했는데 문의 드립니다.', null, '예약 변경하고 싶은데 다음 달 예약 가능 날짜는 언제쯤 나올까요??', false, class_id_seq.currval, 'hong1234');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp,'같은 맛을 여러개 만들어도 될까요?', null, '클래스 내용보면 여러가지 맛을 만드는 것 같은데 좋아하는 맛만 만들 수 있나요?', false, class_id_seq.currval, 'goo1234');
insert into class_qna values ( qna_id_seq.nextval , false, true, systimestamp, '재료 재입고 언제쯤 될까요?', null,'클래스에서 사용하는 재료의 재입고는 언제 될까요??', true, class_id_seq.currval, 'ann1234');
insert into class_qna values ( qna_id_seq.nextval , false, true, systimestamp,'모든 빵이 같은 영양성분인건가요?', null, '클래스에서 빵을 여러개 만드는데 영양성분이 다 같거나 비슷한가요?', false, class_id_seq.currval, 'jang1234');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp,'재료 관련 문의 드립니다.', null, '함밀당과 알룰로스로만 이루어진게 아니라 설탕도 어느 정도 들어가긴한건가요?', true, class_id_seq.currval, 'moon1234');
insert into class_qna values ( qna_id_seq.nextval , false, true, systimestamp,'유통기한 문의드립니다.', null, '빵 만들면 유통기한이 어떻게 되나요??', true, class_id_seq.currval, 'haa1234');
insert into class_qna values ( qna_id_seq.nextval , false, false, systimestamp,'강아지들 알러지 관련 문의드립니다.', null, '저희 강아지가 닭고기 알러지가 있는데 재료 변경 가능할까요?', false, class_id_seq.currval, 'kim1234');

create SEQUENCE qna_id_seq nocache;
commit;

--클래스 Q&A답글 안됌
insert into class_reply values(reply_id_seq.nextval, '네 ^^ 포장지도 같이 제공되기 때문에 집에 포장해가셔도 됩니다~', systimestamp, null, qna_id_seq.currval, 'Tlee1234');
insert into class_reply values(reply_id_seq.nextval, '건물 주차장을 쓰기 때문에 공간은 넉넉한 편입니다.', systimestamp, null, qna_id_seq.currval, 'Tjang1234');
insert into class_reply values(reply_id_seq.nextval, '현재 재료 수급이 다소 어려워져서 다음달에 재료 재입고 됩니다', systimestamp, null, qna_id_seq.currval,'Tgoo1234');
insert into class_reply values(reply_id_seq.nextval, '영양성분은 대체로 다 비슷하나 약간의 차이가 있습니다.', systimestamp, null, qna_id_seq.currval, 'Tchoi1234');
insert into class_reply values(reply_id_seq.nextval, '유통기한은 평균 2~3일정도이나 최대한 빨리 드시는걸 권장합니다.', systimestamp, null, qna_id_seq.currval, 'Tkim1234');

create SEQUENCE reply_id_seq nocache;


commit;
--클래스 상태 
insert into class_state values(state_id_seq.nextval, '등록');
insert into class_state values(state_id_seq.nextval, '공개 신청');
insert into class_state values(state_id_seq.nextval, '공개');
insert into class_state values(state_id_seq.nextval, '비공개');
insert into class_state values(state_id_seq.nextval, '삭제');


--공지사항  
insert into notice values (notice_no_seq.nextval, '달콤 스쿨을 이용해주시는 고객님들께 진심으로 감사 드립니다. 현충일 당일, 고객센터 휴무가 예정되오니 고객님들은 이 점 참고해주시길 바랍니다.' ,  null, systimestamp, '[22.06.02] 6월 6일 현충일 당일, 고객센터 휴무 안내', null,0);		
insert into notice values (notice_no_seq.nextval,'안녕하세요. 달콤스쿨입니다. 22년 6월 3일부터 달콤스쿨의 결제 수수료가 8%에서 10%로 변경됨을 안내드립니다.' ,  null, systimestamp, '[22.06.03] 달콤스쿨 결제 수수료 변경 안내', null,0);
insert into notice values (notice_no_seq.nextval, '22년 6월 5일부터 반려동물 관련 제과제빵 카테고리가 새롭게 열립니다. 많은 관심 부탁드립니다.' ,  null, systimestamp, '[22.06.04] 반려동물 관련 제과제빵 카테고리 오픈', null,0);
insert into notice values (notice_no_seq.nextval, '안녕하세요. 달콤스쿨입니다. 보다 안정적인 서비스 제공을 위해 6월 10일 01:00~05:00까지 사이트 및 서버 점검이 진행될 예정입니다.' ,  null, systimestamp, '[22.06.07] 달콤스쿨 서비스 점검 안내 (06.10 01:00~05:00)', null,0);
insert into notice values (notice_no_seq.nextval,'안녕하세요. 달콤스쿨입니다. 달콤스쿨은 보다 나은 인터넷 문화와 깨끗한 환경을 만들어가기 위해 [신고하기] 기능을 통해 다양한 의견을 접수 받고 있습니다. 많은 이용 부탁드립니다.' ,  null, systimestamp, '[22.06.08] 신고하기 기능 추가 안내', null,0);

--이벤트 
insert into event values(event_no_seq.nextval, '신규 가입 이벤트!! 6월 20일까지 신규 가입하시는 분들을 위해 달콤스쿨이 할인쿠폰을 발급하고 있습니다. 많은 이용 부탁드립니다 ^^', null, systimestamp,'신규 가입 이벤트 안내', null, 0);
insert into event values(event_no_seq.nextval,'반려동물 관련 제과제빵 클래스로 한정하여 할인쿠폰을 발급합니다. 이용에 참고해주시길 바랍니다.', null, systimestamp,'반려동물 관련 제과제빵 클래스 오픈 이벤트', null, 0);
insert into event values(event_no_seq.nextval,'안녕하세요. 달콤스쿨입니다. 서비스 오픈을 기념하여 제주 항공권 이벤트를 진행하고 있습니다. 많은 관심 부탁드립니다.', null, systimestamp,'서비스 오픈 기념 이벤트', null, 0);

--클래스 후기 안됌
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'아이가 갔다 오고도 나서도 잼있었다고 계속 이야길 하네요.',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'너무 재미있고 여자친구가 좋아하네요 ~ 강사님 친절하세요~.',systimestamp,systimestamp,'쿠키이미지',5,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'생각보다 강사님이 불친절 하시네요 ㅠ  강습시간보다 5분 늦게갔는데 기분 안좋은 목소리로 응대하시네요.',systimestamp,systimestamp,'쿠키이미지',1,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'선생님이 친절하게 잘 알려주시고 재밌게 배울수 있어서 좋았어요. 친구랑 처음 해본건데 알차고 좋은추억 만든거같아서 덕분에 기분좋은하루 보냈습니다!.',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'재방문했는데 역시나 재밌고 유익했어요!',systimestamp,systimestamp,'쿠키이미지',5,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'가이드가 쉽고, 단계별로 완성도가 훅훅 진행되어 성취감과 재미를 모두 느낄 수 있습니다.',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'첫베이킹 수업이였는데 재밌고 좋았어요! 팬닝이 어려웠는데 선생님께서 도와주셔서 수월하게 했습니다! 맛도 좋고 좋아요',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'많이 안달고 맛있어요ㅎㅎ',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'만들기도 쉽고 즐거운 시간이었어용',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'재방문했는데 역시나 재밌고 유익했어요!',systimestamp,systimestamp,'쿠키이미지',4,false);
insert into Class_Review values(review_id_seq.nextval,class_id_seq.CURRVAL,student_id.CURRVAL,'정말 재미있는 시간이었고 결과물도 만족스러워요! 진짜 맛있어요ㅎㅎ',systimestamp,systimestamp,'쿠키이미지',4,false);

commit;
--클래스 일정 안됌
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'20:00',1,systimestamp,'19:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'17:00',2,systimestamp,'16:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'16:00',3,systimestamp,'15:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'15:00',4,systimestamp,'14:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'21:00',4,systimestamp,'20:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'18:00',5,systimestamp,'17:00',5,1);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'16:00',4,systimestamp,'15:00',5,2);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'14:00',3,systimestamp,'13:00',5,2);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'13:00',3,systimestamp,'12:00',5,2);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'15:00',4,systimestamp,'14:00',5,2);
insert into Class_Schedule values(schedule_id_seq.nextval,systimestamp,systimestamp,'16:00',4,systimestamp,'15:00',5,2);

alter table class_schedule rename column id to schedule_id;

alter table teacher modify (ADJUSTABLE number(19, 0));
alter table teacher modify (TOTAL_PROFIT number(19, 0));
--클래스 상세 이미지 안됌
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','쿠키이미지', 1);
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','마카롱이미지', 2);
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','식빵이미지',3);
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','쿠키2이미지',4);
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','소보루이미지',5);
insert into class_Image values(classimage_id_seq.nextval, systimestamp, 'T','맘모스빵이미지',6);
commit;
create sequence schedule_id_seq nocache;

--찜하기 안됌
insert into likes values(like_id_seq.nextval, 1, 'kim1234');
insert into likes values(like_id_seq.nextval, 2, 'kim1234');
insert into likes values(like_id_seq.nextval, 3, 'kim1234');
insert into likes values(like_id_seq.nextval, 4, 'kim1234');
insert into likes values(like_id_seq.nextval, 5, 'kim1234');
insert into likes values(like_id_seq.nextval, 6, 'kim1234');
commit;
--예약 안됌




--1대1문의
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'lee1234' , "Tlee1234", "부분환불을 원합니다", "환불", "클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요" , null, systimestamp, systimestamp, 'T')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'park1234' , "Tpark1234", "클래스 등록 신청 여부를 알기 원합니다", "클래스", "클래스 등록신청을 하나했는데 언제 완료가 되는지 궁금합니다." , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'choi1234' , "Tchoi1234", "후기 블라인드처리 문의드립니다.", "후기", "얼마전에 후기를 작성했는데 제가 작성한 후기가 보이지 않습니다." , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'kim1234' , "Tkim1234", "등록한 클래스를 수정하고 싶어요", "클래스", "클래스를 하나 등록했는데 오타가 하나 있어서 수정을 하고 싶습니다." , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'lee1234' , "Tlee1234", "환불해주세요", "환불", "클래스를 예약하고 수업에 갔지만 강사님께서 준비한 재료가 너무 이상했습니다. 환불 요청드립니다." , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'haa1234' , "Thaa1234", "회원탈퇴를 하고 싶어요", "탈퇴", "회원탈퇴를 하고 싶은데 어떻게 탈퇴해야하는지 잘 모르겠습니다. 자세한 설명 부탁드립니다." , null, systimestamp, systimestamp, 'T')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'moon1234' , "Tmoon1234", "결제시 계속 오류가 나요", "결제", "클래스를 예약신청하려고 하면 자꾸 결제부분에서 오류가 납니다." , null, systimestamp, systimestamp, 'T')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'hong1234' , "Thong1234", "부분환불을원합니다", "환불", "클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요" , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'goo1234' , "Tgoo1234", "확정된 클래스 일정을 알고 싶어요", "클래스", "원하는 클래스의 일정이 계속 안올라와서요 정확한 일정을 알고 싶습니다." , null, systimestamp, systimestamp, 'F')
INSERT INTO ASK(ask_no, student_id, teacher_id, ask_title, ask_category, ask_content, ask_img, ask_insert_date, ask_update_date, ask_complete) VALUES(ask_no_seq.NEXTVAL, 'ann1234' , "Tann1234", "클래스 공개취소를 원합니다.", "환불", "올렸던 클래스를 급하게 비공개로 바꾸고 싶어요" , null, systimestamp, systimestamp, 'F')

commit;

-- 1대1 문의 카테고리
insert into ask_category values(ask_category_id_seq.nextval, '클래스');
insert into ask_category values(ask_category_id_seq.nextval, '결제');
insert into ask_category values(ask_category_id_seq.nextval, '환불');
insert into ask_category values(ask_category_id_seq.nextval, '후기');
insert into ask_category values(ask_category_id_seq.nextval, '탈퇴');

--학생
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('lee1234', 'Lee12345', '이나영', '01011111111', 'lee@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('park1234', 'Park12345', '박미영', '01022222222','park@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('choi1234', 'Choi12345', '최가영', '01033333333', 'choi@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('kim1234', 'Kim12345', '김다영', '01044444444', 'kim@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('haa1234', 'Haa12345', '하진영', '01055555555', 'haa@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('moon1234', 'Moon12345', '문하영', '01066666666', 'moon@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('hong1234', 'Hong12345', '홍주영', '01077777777', 'hong@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('goo1234', 'Goo12345', '구민영', '01088888888', 'goo@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('ann1234', 'Ann12345', '안준영', '01099999999', 'ann@naver.com', systimestamp, 'F');
INSERT INTO STUDENT(student_id, student_pwd, student_name, student_phone, student_email, student_insert_date, student_quit) VALUES ('jang1234', 'Jang12345', '장영희', '01011112222', 'jang@naver.com', systimestamp, 'F');



insert into ask(ask_no,student_id, ask_title,ask_category, ask_content, ask_img,ask_insert_date,ask_update_date) 
values(ask_no_seq.nextval,'lee1234','부분환불을원합니다', '환불','클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp);

insert into ask(ask_no,student_id, ask_title,ask_category, ask_content, ask_img,ask_insert_date,ask_update_date) 
values(ask_no_seq.nextval,'park1234','부분환불을원합니다', '환불','클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp);

insert into ask(ask_no,student_id, ask_title,ask_category, ask_content, ask_img,ask_insert_date,ask_update_date) 
values(ask_no_seq.nextval,'choi1234','부분환불을원합니다', '환불','클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp);

insert into ask(ask_no,student_id, ask_title,ask_category, ask_content, ask_img,ask_insert_date,ask_update_date) 
values(ask_no_seq.nextval,'kim1234','부분환불을원합니다', '환불','클래스를 여러개 예약했는데 그 중에서 일부만 환불을 하고 싶어요' , null, systimestamp, systimestamp);

insert into place_region values (region_id_seq.nextval, '서울');
insert into place_region values(region_id_seq.nextval, '경기');
insert into place_region values(region_id_seq.nextval, '부산');
insert into place_region values(region_id_seq.nextval, '인천');
insert into place_region values(region_id_seq.nextval, '대구');
insert into place_region values(region_id_seq.nextval, '울산');
insert into place_region values(region_id_seq.nextval, '광주');
insert into place_region values(region_id_seq.nextval, '대전');
insert into place_region values(region_id_seq.nextval, '경남');
insert into place_region values(region_id_seq.nextval, '경북');
insert into place_region values(region_id_seq.nextval, '전남');
insert into place_region values(region_id_seq.nextval, '전북');
insert into place_region values(region_id_seq.nextval, '충남');
insert into place_region values(region_id_seq.nextval, '충북');
insert into place_region values(region_id_seq.nextval, '강원');
insert into place_region values(region_id_seq.nextval, '제주');
insert into place_region values(region_id_seq.nextval, '세종');
commit;
alter table place drop column place_region;


insert into book_state values(book_state_id.nextval, '수강 확정');
insert into book_state values(book_state_id.nextval, '수강 완료');
insert into book_state values(book_state_id.nextval, '취소');
commit;
create table class_schedule (schedule_id number(19,0) not null, schedule_insert_date timestamp, schedule_update_date timestamp, end_time varchar2(255 char), left_seat number(10,0) not null, schedule_date timestamp, schedule_finished varchar2(255 char) default 'F', start_time varchar2(255 char), total_seat number(10,0) not null, class_id number(19,0), primary key (schedule_id))

alter table class_schedule drop column schedule_finished

alter table teacher add constraint

ALTER TABLE class_qna MODIFY (blind_state DEFAULT 'F');
ALTER TABLE class_qna MODIFY (QNA_COMPLETE DEFAULT 'F');
ALTER TABLE class_qna MODIFY (SECRET_STATE DEFAULT 'F');

ALTER TABLE classes ADD region_id number(19,0);
ALTER TABLE classes ADD CONSTRAINT fk_region_id foreign KEY(region_id) references place_region(region_id);
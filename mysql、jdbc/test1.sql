1.创建student和score表 
create table student(id int(10) not null primary key auto_increment,
name varchar(20) not null,
sex varchar(4),
birth date,
department varchar(20) not null,
address varchar(50) );
create table score(id int(10) not null primary key auto_increment,
stu_id int(10) not null,
C_name varchar(20),
grade int(10),
foreign key(stu_id) references student(id));

2.为student表和score表增加记录 
向student表插入记录的INSERT语句如下：
insert into student values(901,'张老大','男','1985-1-1','计算机系','北京市海淀区');
insert into student values (902,'张老二','男','1986-1-1','中文系','北京市昌平区'),
(903,'张三','女','1990-1-1','中文系','湖南省永州市');
insert into student values(904,'李四','男','1990-1-1','英语系','辽宁省阜新市'),
(905,'王五','女','1991-1-1','英语系','福建省厦门市'),
(906,'王六','男','1988-1-1','计算机系','湖南省衡阳市');
insert into score values(null,901,'计算机',98),
(null,901,'英语',80),
(null,902,'计算机',65),
(null,902,'中文',88),
(null,903,'中文',95),
(null,904,'计算机',70),
(null,904,'英语',92),
(null,905,'英语',94),
(null,906,'计算机',90),
(null,906,'英语',85);

3.查询student表的所有记录
SELECT * FROM student
4.查询student表的第2条到4条记录
SELECT * FROM student LIMIT 1,3
5.从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT id,name,department FROM student
6.从student表中查询计算机系和英语系的学生的信息
SELECT * FROM student WHERE department='计算机系' OR department='英语系' 
7.从student表中查询每个院系有多少人 
SELECT department,count(*) FROM student GROUP BY department
8.从score表中查询每个科目的最高分 
SELECT C_name,max(grade) FROM score GROUP BY C_name
9.查询李四的考试科目（c_name）和考试成绩（grade）
SELECT name,C_name,grade FROM student JOIN score ON student.id=score.stu_id
	WHERE student.name='李四'
10.用连接的方式查询所有学生的信息和考试信息
SELECT * from student LEFT JOIN score ON student.id=score.stu_id
11.计算每个学生的总成绩
SELECT student.name,sum(grade) from student LEFT JOIN score 
	ON student.id=score.stu_id
	GROUP BY score.stu_id
12.计算每个考试科目的平均成绩 
	SELECT C_name,avg(grade) FROM score GROUP BY C_name
13.查询计算机成绩低于95的学生信息
	SELECT * from student LEFT JOIN score 
	ON student.id=score.stu_id WHERE C_name='计算机' AND grade<95
14.查询同时参加计算机和英语考试的学生的信息
	1. 查询出参加计算机考试的学生id
		SELECT stu_id FROM score WHERE C_name='计算机'
	2. 从这些id中在查找谁参加了英语考试
		select stu_id FROM score WHERE stu_id in(
			SELECT stu_id FROM score WHERE C_name='计算机'
			) AND C_name='英语'
	3. 拿着这些id去student中查询学生信息
	SELECT * from student where id in(
		select stu_id FROM score WHERE stu_id in(
			SELECT stu_id FROM score WHERE C_name='计算机'
			) AND C_name='英语'
	);
15.将计算机考试成绩按从高到低进行排序
	SELECT * FROM score WHERE C_name='计算机' ORDER BY grade DESC
16.查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT name,department,C_name,grade FROM student JOIN score 
	ON student.id=score.stu_id WHERE name like '张%' OR name like '王%'
17.查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT name,YEAR(now())-YEAR(birth),department,C_name,grade FROM student JOIN score 
	ON student.id=score.stu_id WHERE address like '%湖南%'



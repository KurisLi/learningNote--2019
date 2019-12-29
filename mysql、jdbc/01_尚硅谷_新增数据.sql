# 新建数据库
CREATE TABLE class(id INT PRIMARY KEY,name VARCHAR(10));
# 新增数据
# 语法1：insert into 表名(指定列名...) values(值...);   指定部分列的数据
INSERT INTO stu(stu_name,stu_age) values('周杰伦',20);
INSERT INTO stu(stu_age,stu_address,stu_name) values(25,'北京','张学友');
# 语法2：insert into 表名 values(值...);    添加全部列数据(值的顺序按照表结构的字段顺序)
INSERT INTO stu(stu_id,stu_name,stu_age,stu_address) VALUES(NULL,'aaa',20,'上海');
INSERT INTO stu VALUES(NULL,'bbb',20,'深圳');
# 语法3： insert into 表名(部分列...) values(值...),(值...),(值...)...
INSERT INTO stu(stu_name,stu_age) values('华仔',30),('郭富城',25),('蔡徐坤',28);
# 语法4： insert into 表名 values(值...),(值...),(值...)...
INSERT INTO stu VALUES(NULL,'ccc',20,'深圳'),(NULL,'ddd',20,'深圳');

# 练习
CREATE TABLE books(
	b_id INT PRIMARY KEY,
	b_name VARCHAR(50) NOT NULL,
	authers VARCHAR(100) NOT NULL,
	price FLOAT NOT NULL,
	pubdate YEAR,
	note VARCHAR(100),
	num int
);

INSERT INTO books(b_id,b_name,authers,price,pubdate,note,num) 
	VALUES(1,'Tal of AAA','Dickes',23,1995,'novel',11);

INSERT INTO books 
	VALUES(2,'EmmaT','Jane lura',35,1993,'Joke',22);

INSERT INTO books 
	VALUES(2,'EmmaT','Jane lura',35,1993,'Joke',22)
	,(2,'EmmaT','Jane lura',35,1993,'Joke',22)
	,(2,'EmmaT','Jane lura',35,1993,'Joke',22);

SELECT * FROM books;









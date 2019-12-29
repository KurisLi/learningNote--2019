# 查询 
# 语法： select 常量、字段名、函数、表达式以及上述组合形式 from 表名 where 查询条件; 

-- 常量
SELECT 100;
SELECT 'java';

-- 函数
# 1. 单行函数
	SELECT VERSION();#查看当前数据库的版本
		-- use java0805;
	SELECT DATABASE();#查看当前数据库是哪个
		-- show tables;
	#字符相关
	SELECT LOWER('Abc')
	SELECT UPPER('Abc')
	#将books中的数据全部查出，并且将书名设置为全大写的形式
	SELECT b_id,UPPER(b_name),price,LOWER(note),num FROM books;

	SELECT CONCAT('java','mysql','jdbc')
	#将books中的数据全部查出,将书名和作者名拼接到一起
	SELECT b_id,CONCAT(b_name,authers),price,note,num FROM books;

	SELECT SUBSTR('helloworld',3)  #从第三个字符截取到末尾
	SELECT SUBSTR('helloworld',3,6) #从第三个字符截取,总共截取6个
	SELECT LENGTH('helloworld你好')  #返回的是字节数
	SELECT INSTR('helloworld你好','o') #返回第一次出现指定字符的位置
	SELECT LPAD('java',7,'a')
	SELECT RPAD('java',7,'ab')
	SELECT TRIM('    hello   world    ') #去除字符串的前后空格
	SELECT TRIM('a' from 'aahelloaaworldaa')#去除字符串的前后指定字符
	SELECT REPLACE('helloworld','o','j')

# 和数学相关
	SELECT FLOOR(-1.3)
	SELECT CEIL(1.4)
	select ROUND(1.5)
	SELECT TRUNCATE(12.3456,2)
	SELECT RAND();
	SELECT MOD(10,6)  #求余数
# 日期函数
	#str->date
		# STR_TO_DATE(str,format)
	INSERT INTO stu VALUES(17,'周星驰',20,'香港','8888888',30000,STR_TO_DATE('1977年3月3日 13:34:56','%Y年%m月%d日 %H:%i:%s'));
	INSERT INTO stu VALUES(18,'周星驰',20,'香港','8888888',30000,STR_TO_DATE('5-8 1987','%m-%d %Y'));
	
SELECT * FROM stu
	#查询时就显示成 xxxx年xx月xx日
	#date->format
		#DATE_FORMAT(date,format)
SELECT DATE_FORMAT(stu_birthday,'%Y年%m月%d日') FROM stu
# 单独从生日中取出年份
	SELECT *,YEAR(stu_birthday),MONTH(stu_birthday),DAY(stu_birthday)
	,HOUR(stu_birthday),MINUTE(stu_birthday),SECOND(stu_birthday)
 FROM stu WHERE stu_id>14

	SELECT NOW() #获取当前系统的日期+时间
	SELECT CURDATE()#获取当前系统的日期
	SELECT CURTIME()#获取当前系统的时间

#练习
1. 显示所有图书的信息(作者和书名大写形式显示)
	SELECT b_id,UPPER(b_name) name,UPPER(authers) authers,note,price,num FROM books;
2. 查询出2000年之后出版的图书
	SELECT * FROM books WHERE pubdate>2000
3. 计算出每本图书的出版年限
	SELECT b_name,pubdate,YEAR(NOW())-pubdate FROM books;

# 2. 组合函数  
	#count(列名/*) 数据的总条数    ps:null值不算总条数
	#max(列名);  最大值
	#min(列名);  最小值
	#sum(列名);  总和
	#avg(列名);  平均值
# 查询一共有多少本不重名的书
	SELECT count(*) FROM books WHERE pubdate>2000;
# 求出库存最多的书的数量
	SELECT min(num) FROM books;
# 求图书馆中所有书的数量
	SELECT sum(num) FROM books;
# 求所有图书价格的平均值
	SELECT avg(price) avg,sum(num) FROM books;

#  分组查询    将相同的数据自动归为一组
# 查询出图书有多少种类   
	#去重 DISTINCT
	SELECT DISTINCT note FROM books
	# 分组
	SELECT note FROM books GROUP BY note
# 查询出每种图书种类的图书数    分组+组合函数
	# 组合函数在没有分组的sql语句中，对整张表格起作用
	# 组合函数在有分组的sql语句中，是对一个小组起作用
	SELECT note,sum(num) FROM books GROUP BY note

	

	







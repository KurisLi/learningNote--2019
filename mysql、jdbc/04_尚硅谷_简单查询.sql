# 简单查询
# 语法： select 常量、字段名、函数、表达式以及上述组合形式 from 表名 where 查询条件; 查询条件和修改删除条件写法都一样

# 如果查询的是字段   select 字段名1,字段名2... from 表名 【where 查询条件】
# 查询所有学生的所有信息
SELECT stu_id,stu_name,stu_age,stu_address,stu_phone,stu_salary FROM stu;
# 简写  *代表所有列，顺序是按照表结构的顺序
SELECT * FROM stu;

# 查询所有学生的姓名和地址
SELECT stu_name,stu_address,stu_age FROM stu;
# 查询年龄大于25岁的学生姓名和工资
SELECT stu_name,stu_salary,stu_age FROM stu WHERE stu_age>25

# 查询年龄大于25 并且小于30的学生信息
SELECT * FROM stu WHERE stu_age>25 and stu_age<30; 
SELECT * FROM stu WHERE stu_age BETWEEN 25 AND 30;
# 查询出电话为null的信息
SELECT * FROM stu WHERE stu_phone IS NULL; 
# 查询出名字中包含张字的学生信息    模糊查询   like
# %  0-n个字符
# _  1个字符
SELECT * FROM stu WHERE stu_name like '%张%'
# 查询出姓张的学生信息
SELECT * FROM stu WHERE stu_name like '张%'
# 查询出姓张并且全名为2个字的学生信息
SELECT * FROM stu WHERE stu_name like '张__'
# 查询名字中包含j的
SELECT * FROM stu WHERE BINARY stu_name like '%J%';  -- 英文没有区分大小写  BINARY

create table aaaa(id int,name varchar(10) BINARY)

# 排序 ORDER BY   不需要where关键字
# ORDER BY 需要排序的字段名 排序规则
# 查询所有学生的数据，按照工资进行排序   默认是升序(ASC)   降序(desc)
SELECT * FROM stu ORDER BY stu_salary DESC;
# 将工资不为空的所有学生信息查出，并按照工资进行排序
SELECT * FROM stu WHERE stu_salary IS NOT NULL ORDER BY stu_salary DESC
# 将工资不为空的所有学生信息查出，并按照工资进行排序,如果工资相同按照年龄排序
SELECT * FROM stu WHERE stu_salary IS NOT NULL ORDER BY stu_salary DESC,stu_age DESC

# 查询出所有学生的姓名和学生的年薪
SELECT stu_name,stu_salary,stu_salary*12 FROM stu;

# 起别名    
# 语法： 字段名、表达式、表名 as 别名       as是可以省略的
SELECT stu_name '姓名',stu_salary,stu_salary*12 年薪 FROM stu;

# 查询出所有学生的姓名和学生的年薪，并且按照年薪排序 (用到了别名排序)
SELECT stu_name,stu_salary,stu_salary*12 sum FROM stu ORDER BY sum;


# 练习

1. 显示所有小说的图书信息 
	SELECT * FROM books WHERE note='novel'
2. 查询出价格在40以上的图书信息
	SELECT * FROM books WHERE price>=40
3. 查询出图书名称中包含字母'a'的图书信息
	SELECT * FROM books WHERE BINARY b_name LIKE '%a%'
4. 查询出图书名称以字母'd'结尾的
	SELECT * FROM books WHERE BINARY b_name LIKE '%d'
5. 查询出价格在20-40之间的图书信息
	SELECT * FROM books WHERE price BETWEEN 20 and 40;
6. 计算出每本书的销售总价格(单价*库存)
	SELECT b_name,price,num,price*num FROM books;

1. 查询出价格在30以上的图书信息，并按照价格排序
	SELECT * FROM books WHERE price>30 ORDER BY price DESC
2. 查询出价格在30以上的图书信息，并按照价格从高-低排序，如果价格一致则按照库存从高-低排序
	SELECT * FROM books WHERE price>30 ORDER BY price DESC,num DESC
3. 计算出每本书的销售总价格(单价*库存)，并按总价从高-低排序
	SELECT b_name,price,num,price*num sum FROM books ORDER BY sum DESC;













#分组+组合
# 查询出每种图书种类的图书数
SELECT note,sum(num) FROM books GROUP BY note
# 查询出价格在40以下每种图书种类的图书数    分组之前是可以添加查询条件的
SELECT note,sum(num) FROM books WHERE price<40 GROUP BY note

# 查询出价格在40以下每种图书种类的图书数  只显示数据大于0的
# where关键字是在分组之前添加的查询条件
# 如果想要在分组+组合之后添加查询条件   HAVING
SELECT note,sum(num) FROM books
WHERE price<40 GROUP BY note HAVING sum(num)>0

# 分支结构
# 双分支  
	#语法   if(条件,值1,值2) 条件成立返回值1，条件不成立返回值2
	SELECT IF(5<3,1,2)
# 查询所有的图书，如果库存低于20本，价格显示为原来的2倍
SELECT b_id,b_name,IF(num<20,price*2,price),num from books;

# 多分支
SELECT
	CASE
	WHEN 2>3  THEN 10
	WHEN 2>3	THEN 20
	WHEN 5>3	THEN 30
	END

# 查询所有的图书，如果库存为0本，价格显示为原来的10倍，如果库存低于20本，价格显示为原来的2倍

SELECT b_id,b_name,
	CASE
		WHEN num=0 THEN price*10
		WHEN num<20 then price*2
		WHEN num>=20 THEN price
	END
,num FROM books;

# 类似switch结构   只能判断相等的情况，不能判断区间
SELECT
	CASE 3
	WHEN 1 THEN 10
	WHEN 2 THEN 20
	WHEN 3 THEN 30
	END
# 
1. 显示所有图书信息，如果书的库存低于10本，价格显示为原来价格的2倍
	如果书的库存低于5本，价格显示为原来价格的3倍，否则显示原价
	SELECT b_id,b_name,num,
		CASE
		WHEN num<5 THEN price*3
		WHEN num<10 THEN price*2
		ELSE price
		END
	FROM books;

2. 计算出一共有多少本图书
	SELECT sum(num) FROM books
3. 计算这些图书的平均单价是多少
	SELECT avg(price) FROM books
4. 查询出这些图书都有哪些单价，并统计出每个单价都有多少本数
	SELECT price,sum(num) FROM books GROUP BY price;


# 多表 (关系型数据库) 
# 1. 多对一
	-- 多个员工对应一个部门

	-- 查询出刘德华的全部信息(包括部门信息)
# 2. 一对多
	-- 一个部门对应多个员工

	-- 查询出人事部的信息，并且该部门下有哪些员工
# 3. 多对多
	-- 一个学生可以选多门课程
	-- 一个课程可以被多个学生选
	-- 查询王宝强都选了哪些课程 

# 4. 一对一   中国婚姻法
	-- 一个丈夫对应一个妻子 
	-- 查询黄晓明的妻子是谁

# 约束条件   
# 外键约束  员工信息中的部门id必须参照部门表的id数据   在员工信息的部门id这一列添加外键

# 多表联查  (需要得到的结果或者你的查询条件来自于多张表格) 

# sql92语法
	内连接  (只能查询出具有关联关系的数据)
		等值连接  多张表格中具有等值的条件
		-- 查询出刘德华的全部信息(包括部门信息)
		SELECT * FROM emp,dept WHERE emp_name='刘德华';  
		# 笛卡尔积现象
		# 原因：就是没有添加关联关系
		# 如何解决：添加关联关系    
		# 多表查询如果出现重名，需要采用表名.字段名的形式去区分
		SELECT * FROM emp,dept WHERE emp_name='郭富城' AND emp.dept_id=dept.dept_id;  
		# 查询所有员工的信息(包括部门信息)
		SELECT * FROM emp,dept WHERE emp.dept_id=dept.dept_id;
	  非等值连接
		#查询出员工的信息(包括他的工资级别)
		SELECT * FROM emp,gr WHERE emp.emp_salary>=gr.min and emp.emp_salary<=gr.max
		自连接  
		# 查询出北京市下有哪些区
		SELECT * FROM city c1,city c2 WHERE c1.city_name='上海市' AND c1.city_id=c2.pid
		# 查询昌平区在那个市
		SELECT * FROM city c1,city c2 WHERE c1.city_name='宝安区' AND c1.pid=c2.city_id
	外链接 (mysql不支持)
		左外连接
		右外连接
		全外连接

	三表联查
		#查询王宝强都选了哪些课程
	SELECT * FROM student,sc,course WHERE student.stu_name='张三' 
	AND sc.stu_id=student.stu_id AND sc.cou_id=course.course_id

		#心理学这门课被哪些学生选了
	SELECT * FROM student,sc,course WHERE course.course_name='心理学' 
	AND sc.stu_id=student.stu_id AND sc.cou_id=course.course_id
	
# sql99语法
	内连接
		等值连接 语法：表1 inner join 表2 on 管理关系 【where 查询条件】
		-- 查询出刘德华的全部信息(包括部门信息)
		SELECT * FROM emp JOIN dept ON emp.dept_id=dept.dept_id WHERE emp.emp_name='刘德华'
	  非等值连接
		#查询出员工的信息(包括他的工资级别)
		SELECT * FROM emp JOIN gr ON emp.emp_salary>=min AND emp.emp_salary<=max
		自连接
		# 查询出北京市下有哪些区
		SELECT * FROM city c1,city c2 WHERE c1.city_name='上海市' AND c1.city_id=c2.pid
		SELECT * FROM city c1 JOIN city c2 on c1.city_id=c2.pid WHERE c1.city_name='上海市'

	#查询王宝强都选了哪些课程
		SELECT * FROM student join sc join course 
		ON sc.stu_id=student.stu_id AND sc.cou_id=course.course_id
		WHERE student.stu_name='王宝强' 
	外链接
		左外连接   LEFT JOIN 将左侧的表信息全部显示，右侧的如果没有对应信息用null补齐
		#查询所有员工的信息(包括部门信息)
		SELECT * FROM emp LEFT JOIN dept ON emp.dept_id=dept.dept_id
		SELECT * FROM dept LEFT JOIN emp ON emp.dept_id=dept.dept_id
		右外连接  RIGHT JOIN 将右侧的表信息全部显示，右侧的如果没有对应信息用null补齐
		SELECT * FROM emp RIGHT JOIN dept ON emp.dept_id=dept.dept_id
		全外连接 (不支持) 

# 子查询
# sql语句的嵌套(一个sql语句中存在另一个完整的sql语句)
# 查询出部门id为1的所有员工信息
SELECT * FROM emp WHERE dept_id=1
# 查询出刘德华所在部门的员工信息
	1. 先查询出刘德华所在的部门id
	SELECT dept_id FROM emp WHERE emp_name='刘德华'
	2. 查询出员工信息
	SELECT * FROM emp WHERE dept_id=(SELECT dept_id FROM emp WHERE emp_name='刘德华')

# 查询出刘德华、王思聪所在部门的员工信息
	SELECT dept_id FROM emp WHERE emp_name='刘德华' OR emp_name='王思聪'

	SELECT * FROM emp WHERE dept_id in(
		SELECT dept_id FROM emp WHERE emp_name='刘德华' OR emp_name='王思聪'
	)

# 注意事项
	1. 子sql语句的结果必须是一列
	2. 等号只能等于一个结果：必须是一行
	3. 如果子sql返回多行结果，需要用in(结果),去实现功能

	SELECT * FROM emp WHERE dept_id in (1,3)

# 分页
# limit n; 获取筛选后结果的前n个
# limit n,m; 从n下标开始取，取m个  (mysql中需要从0开始的下标)
SELECT * FROM stu WHERE stu_id!=1 LIMIT 5;
SELECT * FROM stu LIMIT -1,5; #mysql中需要从0开始的下标

SELECT 字段、表达式、函数、常量以上的组合型
FROM 表名
JOIN 表名 ON 关联条件
WHERE 查询条件
GROUP BY 分组
HAVING 分组后查询条件
ORDER BY 排序
LIMIT 分页









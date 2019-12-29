# 修改数据
# 语法： update 表名 set 需要修改的列名=新值,需要修改的列名=新值,... 【where 修改条件】

# 将stu表格中的所有学生的地址修改为中国
UPDATE stu SET stu_address='中国'
# 将stu表格中的所有学生的地址修改为中国北京，并且将所有人的年龄增加1岁
UPDATE stu SET stu_address='中国北京',stu_age=stu_age+1;

/*
	关系运算符    > >= < <= = != <>
*/

# 将周杰伦的地址修改为中国台湾
UPDATE stu SET stu_address='中国台湾' WHERE stu_name='周杰伦'
# 将年龄大于25岁的学生，薪资设置为20000并且手机号码设置为666
UPDATE stu SET stu_salary=20000,stu_phone='666' WHERE stu_age>25;
# 将不是台湾人的薪资设置为26000
UPDATE stu SET stu_salary=26000 WHERE stu_address<>'中国台湾'

/*
	逻辑运算符   并且 and   或者 or   非  not
*/

# 将年龄是小于25岁并且地址是中国北京的学生手机号码设置为888
UPDATE stu SET stu_phone='888' WHERE stu_age<25 AND stu_address='中国北京'
# 将不是中国北京的学生薪资设置为2000
UPDATE stu SET stu_salary=2000 WHERE not stu_address='中国北京'
# 将薪资为空的学生薪资设置为25000
UPDATE stu SET stu_salary=25000 WHERE stu_salary IS NULL
# 将手机号码不为空的学生薪资设置为35000
UPDATE stu SET stu_salary=35000 WHERE stu_phone IS NOT NULL

UPDATE stu SET stu_salary=45000 WHERE NOT stu_phone IS  NULL


SELECT * FROM stu;
# 删除数据
# 语法： delete from 表名 【where 删除条件】    删除条件的语法和修改条件的语法一致

# 将class表中数据全部删除
DELETE FROM class;-- 一条一条的删
# 清空表  TRUNCATE TABLE 表名;
TRUNCATE TABLE class;
/*
					效率	自增长机制			数据回滚			删除条件
DELETE		较低	不会破坏原来的	支持数据回滚	允许
TRUNCATE  较高	会破坏原来的		不支持数据回滚	不允许

*/

# 将class表中id大于3的删除
DELETE FROM class WHERE id>3;

# 练习
/*
	1. 将books表中所有书的价格整体上调10元。
	2. 将库存为0的书籍删除
	3. 将George Byron的书价格修改为80、说明修改为 prose
	4. 将所有的小说(novel)的库存减少10本，价格上调20
*/
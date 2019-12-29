# 事务  

# 事务是由一个或者多个DML语句组成

# DML--> insert  update   delete
# 1.将修改保存到缓存区  2. 提交(MySQL自动提交,Oracle需要手动提交) 回滚 
SHOW VARIABLES like '%autocommit%'

# 将mysql的自动提交关闭
set autocommit=false;

UPDATE score SET grade=grade-10 WHERE id=1;
UPDATE score SET grade=gade+10 WHERE id=2;
# 提交
COMMIT;
# 回滚
ROLLBACK;


# 事务的特性 ACID特性
原子性(Atomicity)：原子意为最小的粒子，或者说不能再分的事物。数据库事务的不可再分的原则即为原子性。 组成事务的所有SQL必须：要么全部执行，要么全部取消
一致性(Consistency)：指数据的规则,在事务前/后应保持一致
隔离性(Isolation)：简单点说，某个事务的操作对其他事务不可见的.  Spring框架
持久性(Durability)：当事务提交完成后，其影响应该保留下来，不能撤消












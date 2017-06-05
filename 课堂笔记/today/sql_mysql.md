# SQL Lang #

## Select Clause Syntax ##
The order of the clauses in the `SELECT` statement is
significant. Any one of the optional clauses can be omitted, but
when the **optional clauses are used**, they **must** appear
in the appropriate order.

## Query Execution Order ##

SQL has no order of execution. Is a declarative language. The
optimizer is free to choose any order it feels appropriate to
produce the best execution time.

[Actually there is this: Logical Processing Order of the SELECT
statement.]
(https://stackoverflow.com/questions/4596467/order-of-execution-of-the-sql-query)

[Microsoft](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql)

> The following steps show the logical processing order, or binding
> order, for a SELECT statement. This order determines when the
> objects defined in one step are made available to the clauses in
> subsequent steps. For example, if the query processor can bind to
> (access) the tables or views defined in the FROM clause, these
> objects and their columns are made available to all subsequent
> steps. Conversely, because the SELECT clause is step 8, any
> column aliases or derived columns defined in that clause cannot
> be referenced by preceding clauses. However, they can be
> referenced by subsequent clauses such as the ORDER BY clause.
> Note that the actual physical execution of the statement is
> determined by the query processor and the order may vary from
> this list.

> 1. FROM
> 1. ON
> 1. JOIN
> 1. WHERE
> 1. GROUP BY
> 1. WITH CUBE or WITH ROLLUP
> 1. HAVING
> 1. SELECT
> 1. DISTINCT
> 1. ORDER BY
> 1. TOP



## Subqueries ##

### Where Clause ###

#### Multi-conditions ####

- `select * from student where (age,score)=(select
  min(age),max(score) from student);`
- **Equivalence:** `select * from student where age=(select
  min(age) from student) 
  and score=(select max(score) from student);`








## JOIN Operation ##

### Syntax ###

- **默认`inner join`**, 因此可以省略直接用 `join`
- `OUTER JOIN`: `LEFT OUTER JOIN` `RIGHT OUTER JOIN`，其中
  `OUTER` 可以省略

### `Natural Join v.s. Inner Join` ###

- `natural join` is a shortcut for `inner join`. It will
  automatically join two tables by matching exact same `column
  names` in both tables.
- `natural join` won't show duplicate `column names` twice while
  `join` will.
- However, `natural join` should be avoided.

> This is addressed somewhat in user166390's answer. Say you have
> a natural join between Customers and Employees, joining on
> EmployeeID. Employees also has a ManagerID field. Everything's
> fine. Then, some day, someone adds a ManagerID field to the
> Customers table. Your join will not break (that would be a
> mercy), instead it will now include a second field, and work
> incorrectly. Thus, a seemingly harmless change can break
> something only distantly related. **VERY BAD**. The only upside of
> a natural join is saving a little typing, and the downside is
> substantial.



## MISC ##

### `Aggregate Function` ###

- `count(*)` 会统计 null 的值
- `count(col_name)` 不会统计 null 的值

- `avg()` 会忽略 null 值

### Functions ###

- `select timestampdiff(year,'1975-01-01',curdate());`
- `curdate()` 返回当前日期
- `timestampdiff([SECOND|MINUTE|HOUR|DAY|WEEK|MONTH|QUARTER|YEAR])`

## 问题 ##

- subqueries 都能用在哪里？



### SQL 的输入输出是什么？ ###

### SQL 的执行顺序 ###
- `order by` 的执行顺序
- 各个`clause`的执行顺序











































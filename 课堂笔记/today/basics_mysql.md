# MySQL #

## Data Types ##

### Float Type Precision v.s. Range ###

#### TL;DR; ####

0. `floats` and `doubles` are necessarily imprecise. Using
   DECIMAL is usually what you want. (comment from below question)

1. In MySQL, there are exactly *two* floating point datatypes:
single precision (32-bits) and double precision (64-bits.)

2. floating types are actually saved in the form of exponent as
   `sign * mantissa * (radix ^ exponent)`. e.g. `+1 * 0.12345 * (
   10 ^ 3 )`.

3. **range** is the smallest value to the largest value. For
   DOUBLE, the range is from `-1 * 10^308` to `10^308`.

4. **precision** is basically the number of *digits* that can be
   represented. For a single precision FLOAT, we get
   approximately 7 decimal digits of precision. For a DOUBLE, we
   a precision in the neighborhood of twice that, 15 decimal
   digits.


#### Origin Answer ####

From my
SO [ question ](https://stackoverflow.com/a/44339941/4062451):

1) disregard the length specifier, That's just noise. In MySQL,
there are exactly *two* floating point datatypes: single
precision (32-bits) and double precision (64-bits.)

That optional length specifier is just provides an alternate way
to specify `DOUBLE`.

     alter table t add foo FLOAT(4), add bar FLOAT(40) ;

is equivalent to

     alter table t add foo FLOAT  , add bar DOUBLE ; 

2) The 38 in  `1e38`  is the exponent power of 10. That's equivalent to 

    1.0 x 10^38
 
Without diving into all of the details, a floating point number is essentially expressed as 

       sign * mantissa  * (radix ^ exponent)

For example, in base10, we could express the value `123.45` in this way:  

        +1  * 0.12345   * ( 10 ^ 3 )

Or, we could use base2, and express a value (between 0 and 1) times some power of 2.   


3)  `1e39` (1.0*10^39) is larger than the range of values that can be expressed in IEEE single precision FLOAT. ("The maximum representable IEEE 754 floating-point value is 2 * 2^−23 * 2^27  which is approximately 3.402x10^38.

A DOUBLE precision floating point supports a much larger range of values, up to 10^308.

4) **range** is the smallest value to the largest value.  For DOUBLE, the range is from `-1 * 10^308`  to `10^308`.

**precision** is basically the number of *digits* that can be represented.  For a single precision FLOAT, we get approximately 7 decimal digits of precision. For a DOUBLE, we a precision in the neighborhood of twice that, 15 decimal digits.

--

The IEEE floating point isn't unique to MySQL. Nearly all modern processors include floating point arithmetic units, that operate on floating point numbers. 

References:

https://en.wikipedia.org/wiki/Single-precision_floating-point_format  

https://en.wikipedia.org/wiki/Double-precision_floating-point_format  


### `BOOL, BOOLEAN` ###

- These types are synonyms for `TINYINT(1)`. A value of `zero` is
  considered `false`. **Nonzero** values are considered `true`
  
- the values `TRUE` and `FALSE` are merely aliases for `1` and `0`

### 最小显示宽度 ###

- `int(M)`: M 表示最小显示宽度; 超出显示宽度不超出类型范围可以存
  储，反之不行

### MISC ###

- `zerofill `: If you specify `ZEROFILL` for a numeric column,
  MySQL automatically adds the `UNSIGNED` attribute to the
  column.

- `SERIAL`: is an alias for `BIGINT UNSIGNED NOT NULL
  AUTO_INCREMENT UNIQUE`

- `SET`: retrieve the possible values for a `SET` field `SHOW
  COLUMNS FROM myset LIKE 'col';`

- `KEY name (col_name)` and `INDEX name (col_name)` equivalence:

  `KEY` is normally a synonym for `INDEX`. 

- `PRIMARY KEY` shortcut: The key attribute `PRIMARY KEY` can
  also be specified as just `KEY` when given in a column
  definition. This was implemented for compatibility with other
  database systems.


## Use Cases ##


### Foreign Keys ###

#### Show all foreign keys in `table_name` ####

`show create table table_name;`

#### Show FKs to a table or column ####

**[For a Table](https://stackoverflow.com/questions/201621/how-do-i-see-all-foreign-keys-to-a-table-or-column/201678#201678):**

``` sql
    SELECT 
      TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
    FROM
      INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE
      REFERENCED_TABLE_SCHEMA = '<database>' AND
      REFERENCED_TABLE_NAME = '<table>';
```

**For a Column:**

``` sql
    SELECT 
      TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
    FROM
      INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE
      REFERENCED_TABLE_SCHEMA = '<database>' AND
      REFERENCED_COLUMN_NAME = '<column>';
```

Basically, we changed `REFERENCED_TABLE_NAME` with
`REFERENCED_COLUMN_NAME` in the where clause.


## 问题 ##

- float: 范围是3.4e38
- 有效位数是 6
- 有效位数是显示的还是存储的

### Apache ###

- `ServerName` 与 `ServerAlias` 作用
- `example.com.conf` 文件名作用（与网站相同？）
- `a2ensite example.com.conf` 使configure 文件生效，`a2ensite` 作用？

















## Q&A ##

### Character Set ###

On mac the default character set is `latin1`. To change default
to `utf8`:

1. `sudo vim /etc/mysql/my.cnf`
2. Copy the following code into `my.cnf`:

  ```
  [mysqld]
  collation-server = utf8_general_ci
  init-connect='SET NAMES utf8'
  character-set-server = utf8
  skip-character-set-client-handshake

  [client]
  default-character-set = utf8

  [mysql]
  default-character-set = utf8
  ```

 














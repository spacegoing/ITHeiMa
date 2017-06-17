# PHP Class #

- Only Gotchas and php specified features are included. General
  concepts the same as Java are not.
- Notes in this document are from PHP Language Reference and
  comments below.

## General ##

- **compatible**: same visibility and initial value todo:? how
  about same type(class)?

### Autoloading Classes ###

The following code is equivalent to `include MyClass1.php;
include MyClass2.php`

``` php
  spl_autoload_register(function ($class_name) {
      include $class_name . '.php';
  });

  $obj  = new MyClass1();
  $obj2 = new MyClass2(); 
```



### Scope Resolution Operator `::` ###

The Scope Resolution Operator or in simpler terms, the double
colon, is a token that allows access to 

- **static** (methods/properties)
- **constant**
- **overridden** properties or methods of **parent** class

- Inside the class
  - `parent::method()`
  - todo: `static` method? `static` keyword access?

- Outside the class
  - `classname::$static_property_name` call class statics
  - `classname::constant_property_name` call class constants


When referencing these items **from outside** the class
definition, use the **name of the class**.

Three special keywords `self`, `parent` and `static` are used to
access properties or methods from inside the class definition.

When an extending class overrides the parents definition of a
method, PHP will not call the parent's method. It's up to the
extended class on whether or not the parent's method is called.
This also applies to Constructors and Destructors, Overloading,
and Magic method definitions.


todo: Overide Inheritance



## Properties ##

- Access:
  - From inside the class
  - `this->property_name` (without `$`) non-static property
  - `self::$static_property_name` static property
  - `self::$constant_property_name` constant property
  
  - Outside the class
  - `classname::$static_property_name` call class statics
  - `classname::constant_property_name` call class constants

-  Property declaration may include an initialization, but this
   initialization **must be** a constant value--that is, it must
   be able to be **evaluated at compile time** and must **not
   depend on** run-time information in order to be evaluated.

- `$this` can be cast to array. (see
  </language.types.array.php#language.types.array.casting> PHP
  manual page)

- You can access property names with dashes in them (for example,
  because you converted an XML file to an object) in the following
  way:

  ``` php
      $ref = new StdClass();
      $ref->{'ref-type'} = 'Journal Article';
      var_dump($ref);
  ```

## Constants ##

- Constants differ from normal variables in that you don't use
  the `$` symbol to declare or use them. The `default` visibility of
  class constants is `public`.
- Constants can be accessed by `Class` or `Object`
  - `Object=new Class();`
  - `Object::CONSTANT===Class::CONSTANT` true
- `::class` constant: allows for fully qualified class name
  resolution at compile, this is useful for namespaced classes.



## Constructors ##


- `__construct()` `__destruct()`
- Call parent constructor: `parent::__construct()`
- The `destructor` method will be called as soon as there are no
  other references to a particular object, or in any order during
  the shutdown sequence.

- Be aware of potential memory leaks caused by circular
  references within objects. (PHP Manual user comments under
  Constructors and Destructors)

- Attempting to throw an exception from a destructor (called in
  the time of script termination) causes a fatal error.



## Visibility ##

- The visibility of a property, a method or (as of PHP 7.1.0) a
  constant can be defined by prefixing the declaration with the
  keywords public, protected or private.

- Public can be accessed everywhere.  

- Protected can be accessed only within the class itself and by
  inheriting classes.

- Private may only be accessed by the class that defines the
  member. todo: previous examples doesn't match this!!! (Inherit)

- Class properties: **must be** defined as public, private, or
  protected.

- Class methods: **may be** defined as public, private, or protected.
  Methods declared without any explicit visibility keyword are
  defined as public.

- Constant: **may be** defined as public, private, or protected.
  Constants declared without any explicit visibility keyword are
  defined as public.

### Gotchas ###

- Objects of the same type will **have access** to each others
  private and protected members **even though they are not the
  same** instances. This is because the implementation specific
  details are already known when inside those objects.


#### Override Private Methods ####

The manual says that "Private limits visibility only to the class
that defines the item". That means extended children classes do
not see the private methods of parent class and vice versa also.

As a result, parents and children can have different
implementations of the "same" private methods, **depending on
where you call them** (e.g. parent or child class instance). Why?
Because private methods are visible only for the class that
defines them and the child class does not see the parent's
private methods. If the child doesn't see the parent's private
methods, the child can't override them. Scopes are different. In
other words -- each class has a private set of private variables
that no-one else has access to.

A sample demonstrating the percularities of private methods when
extending classes:

``` php
abstract class base { 
    public function inherited() { 
        $this->overridden(); 
    } 
    private function overridden() { 
        echo 'base'; 
    } 
} 

class child extends base { 
    private function overridden() { 
        echo 'child'; 
    } 
} 

$test = new child(); 
$test->inherited(); 
```

Output will be "base". 

If you want the **inherited methods to use overridden**
functionality in extended classes but public sounds too loose,
use **protected**. That's what it is for:)

A sample that works as intended: 

``` php
abstract class base { 
    public function inherited() { 
        $this->overridden(); 
    } 
    protected function overridden() { 
        echo 'base'; 
    } 
} 

class child extends base { 
    protected function overridden() { 
        echo 'child'; 
    } 
} 

$test = new child(); 
$test->inherited(); 
```

Output will be "child".






## Inheritance ##

- the subclass inherits all of the **public and protected**
  methods from the parent class. Unless a class overrides those
  methods, they will retain their original functionality.

- I was recently extending a PEAR class when I encountered a
  situation where I wanted to call a constructor two levels up
  the class hierarchy, ignoring the immediate parent. In such a
  case, you need to explicitly reference the class name using the
  `::` operator.

todo: what properties will be inherited? constants? static?



## `Static` Key Word ##

> static can also be used to define static variables and for late
> static bindings. Please refer to those pages for information on
> those meanings of static.

### Properties ###

- Inside class: `self::$static_property`. There is a `$` before
  property name.
- Outside class: `Class_name::$static_property`. There is a `$`
  before property name.



### Methods ###

- Inside class: `self::static_method()`
- Outside class: `Class_name::static_method()`

### Gotchas ###

Here `static` accessed property prefer property of the class for
which it is called. Where as `self` keyword enforces use of
current class only.

``` php
  class a{

    static protected $test="class a";

    public function static_test(){

      echo static::$test;
      echo self::$test;

    }

  }

  class b extends a{

    static protected $test="class b";

  }

  $obj = new b();
  $obj->static_test();
  // class b
  // class a
```







## Abstract ##

- Abstract Class can contains non-abstract methods with
  implementations.

- Signatures of the methods must match, i.e. the type hints and the
  number of required arguments must be the same. 
- If the child class defines an optional argument, where the
  abstract method's signature does not, there is no conflict in
  the signature. This also applies to constructors as of PHP 5.4.


## Interface ##

Fucking PHP society no one answers interface explicitly.

Interface is just an "interface". No differences than "USB
interface" or others. If you want to standardize the
communication between two entities, then standardize an interface
just like engineering people did to USB.


- All methods declared in an interface must be public, without
  any of the methods having their contents defined; this is the
  nature of an interface.

- Interfaces can have `constants`. Interface constants works
  exactly like class constants except they `cannot` be overridden
  by a class/interface that `implements`/`extends` them.

- `interface` can `extends` other interfaces. Can `extends` more
  than one.

- Classes may `implements` more than one interface if desired by
  separating each interface **with a comma**.

- The class implementing the interface must use the exact same
  method signatures as are defined in the interface. Not doing so
  will result in a fatal error.

todo: how to is_interface? to determine which interface/abstract
class implemented/inherited? maybe `instanceof`.


## Trait ##

- Unlike inheritance; if a trait has `static` properties, each
  class using that trait has **independent instances** of those
  properties.

- The best way to understand what traits are and how to use them
  is to look at them for what they essentially are: language
  assisted copy and paste.

  If you can copy and paste the code from one class to another (and
  we've all done this, even though we try not to because its code
  duplication) then you have a candidate for a trait.



## Namespace ##

- qualified class name:
- fully qualified class name:






























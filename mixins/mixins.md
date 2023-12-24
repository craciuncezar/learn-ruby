## Mixins

In ruby a mixin is a module that is included in a class. In this way the class can use the methods defined in the module. This is a way to share code between classes without using inheritance.

Ruby has single inheritance.

You can include a module in a class (this will add all the methods in the module to the class) or you can extend a class with a module (this will add all the methods in the module to the class as class methods).

There is also prepend which acts as a proxy for the class.

The order of execution is like this

- prepend
- instance method
- include
- parent class

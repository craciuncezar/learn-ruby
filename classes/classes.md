### Classes

#### Attributes

##### Readers

By default all instance variables are private. You can read them using `attr_reader` yourself (which is just some syntax sugar to create a method for you).

```ruby
class Book
    attr_reader :isbn

    def initialize(isbn)
        @isbn = isbn
    end
end
```

##### Writers

```ruby
class Book
    def initialize(isbn)
        @isbn = isbn
    end

    def isbn=(isbn)
        @isbn = isbn
    end
end
```

> If you create a method whose name ends with an equals sign, that name can appear on the left side of an assignment and the Ruby parser will ignore whitespace between the end of the name and the equals sign. You can even treat the setter method like a regular method invocation book.isbn=(1.50)

A shorthand for this is to use `attr_writer` which is just some syntax sugar to create a method for you.

##### Accessors

You can use `attr_accessor` to create both a reader and a writer.

```ruby
class Book
    attr_accessor :isbn

    def initialize(isbn)
        @isbn = isbn
    end
end

book = Book.new(123)
book.isbn = 456
puts book.isbn # 456
```

##### Reopening classes

You can reopen classes to add methods to them.

```ruby
class Book
    attr_accessor :isbn

    def initialize(isbn)
        @isbn = isbn
    end
end

# Assume this is in another file
class Book
    def to_s
        "ISBN: #{@isbn}"
    end
end
```

> You can even reopen classes that are defined in the Ruby standard library and add methods to them. This is a powerful technique, but it can be dangerous. If you add a method to a class that already exists, you might break code that depends on the original definition of the class.

##### Inheritance

```ruby
class Book; end

class TextBook < Book; end

TextBook.superclass # Book
Book.superclass # Object
Object.superclass # BasicObject
BasicObject.superclass # nil
```

Class variables are shared between the class and all subclasses.

```ruby
class Book
    @@book_count = 0

    def initialize
        @@book_count += 1
    end

    def self.book_count
        @@book_count
    end
end

class TextBook < Book; end

Book.new
Book.new
TextBook.new

Book.book_count # 3
TextBook.book_count # 3
```

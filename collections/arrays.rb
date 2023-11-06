# frozen_string_literal: true

a = [3.14, 'pie', 99]
a.class # => Array
a.length # => 3

# Accessing array
a[0] # => 3.14
a[3] # => nil
a[-1] # => 99
a[-2] # => 'pie'
a[-99] # => nil
a[0..2] # => [3.14, 'pie', 99] its inclusive
a[0...2] # => [3.14, 'pie']

# Inserting inside array
b = [1, 3, 5, 7, 9]
b[2, 2] = 'cat' #=> [1,3,"cat",9]
b[2, 0] = 'dog' #=> [1,3,"dog","cat",9]
b[1, 1] = [9, 8, 7] #=> [1,9,8,7,"dog","cat",9]
b[0..3] = [] #=> ["dog", "cat", 9]
b[5..6] = 99, 98 #=> ["dog", "cat", 9, nil,nil,99,98]

# Shortcut for creating string array
c = %w[ant bee cat dog elk]
c[0] #=> "ant"

# Shortcut for symbol array
d = %i[ant bee cat dog elk]
d[0] #=>:ant

# Stack
stack = []
stack.push 'wow'
stack.pop #=> "wow"
stack << 'eh' #=> same as push

# Queue
queue = []
queue.push 'red'
queue.push 'green'
queue.shift #=>"red"
queue.shift #=>"green"

# First and last helpers
array = [1, 3, 4, 5]
array.first #=> 1
array.first(2) #=> 1,3
array.last #=>5
array.last(2) #=> 4,5

# Using symbols in blocks
# You can pass the name of the method you want to apply
# to successive elements of the collection
array.reduce(:+) #=> Creates a sum
array.reduce(:*) #=> Creates the product

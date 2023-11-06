# Procs are just a way to store and later call blocks
# Great way for implementing callbacks, dispatch tables etc
class ProcExample
  # using & makes the block a Proc instance
  def pass_in_block(&action)
    @stored_proc = action
  end

  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new
eg.pass_in_block { |param| puts "The parameter is #{param}" }
eg.use_proc(99)

# Stabby lambda (-> is shortcut syntax for lambda keyword)
bo = ->(param) { puts "You called me with #{param}" }
bo.call('Stabby lamda')

# Proc initializer
bo = proc { |param| puts "You called me with #{param}" }
bo.call('Proc')

# Difference between proc and lambda is that
# the lambda values return an error if called with the wrong number of arguments
# while proc will allow the call, and either truncate extra arguments or assign nil to unspecified arguments.
# Also, using return inside a proc will also return from the method the proc is inside,
# whereas using return inside a lambda will not.

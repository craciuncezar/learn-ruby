# frozen_string_literal: true

# Debug mixin
module Debug
  def who_am_i?
    "#{self.class.name} (id: #{object_id}): #{name}"
  end
end

# Example class with mixin
class Phonograph
  # include adds the module’s methods as instance methods to the class
  include Debug

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Example class with mixin
class EightTrack
  include Debug

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

phonograph = Phonograph.new('West End Blues')
eight_track = EightTrack.new('Surrealist Pillow')

phonograph.who_am_i? # => "Phonograph (id: 60): West End Blues"
eight_track.who_am_i? # => "EightTrack (id: 80): Surrealistic Pillow"

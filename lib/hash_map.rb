# frozen_string_literal: true

# map strings to a key, which is index of an array of a determinate size
class HashMap
  include EditMap

  attr_accessor :coll, :resizes
  attr_reader :capacity, :load

  def initialize(capacity = INIT_CAPACITY, coll = Array.new(capacity))
    @capacity = capacity
    @coll = coll
    @load = 0
    @resizes = 0
  end

  def to_s
    "capacity: #{capacity},\n coll: #{coll},\n load: #{load}"
  end

  private

  attr_writer :capacity, :load

  PRIME = 31
  def hash(value)
    return unless value.is_a?(String)

    key = 0
    pos = 1
    value.each_char do |char|
      key += PRIME * char.ord * pos
      pos += 1
    end
    key %= capacity
    key
  end
end

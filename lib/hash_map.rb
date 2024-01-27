# frozen_string_literal: true

# map strings to a key, which is index of an array of a determinate size
class HashMap
  include EditMap

  attr_accessor :coll, :resize_count
  attr_reader :capacity, :load

  def initialize(capacity = INIT_CAPACITY, coll = Array.new(capacity))
    @capacity = capacity
    @coll = coll
    @load = INIT_MEMBERS
    @resize_count = 0
  end

  def to_s
    "capacity: #{capacity},\n coll: #{coll},\n load: #{load}"
  end

  private

  attr_writer :capacity, :load

  PRIME = 31
  def hash(value)
    return unless value.is_a?(String)

    key = value[0].ord
    value.each_char { |char| key += PRIME * char.ord }
    key %= capacity
    key
  end
end

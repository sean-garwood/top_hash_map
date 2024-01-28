# frozen_string_literal: true

# map strings to a key, which is index of an array of a determinate size
class HashMap
  include EditMap
  include MapInfo

  def initialize(capacity = INIT_CAPACITY, coll = Array.new(capacity))
    @capacity = capacity
    @coll = coll
    @load = 0
    @resizes = 0
  end

  private

  attr_accessor :capacity, :coll, :load, :resizes
end

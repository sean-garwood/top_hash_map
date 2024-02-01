# frozen_string_literal: true

require_relative 'hash_map/edit_map'
require_relative 'hash_map/hasher'
require_relative 'hash_map/map_info'
require_relative 'hash_map/print'

# map strings to a key, which is index of an array of a determinate size
class HashMap
  include EditMap
  include MapInfo

  attr_accessor :slots, :keys, :values

  def initialize(capacity = INIT_CAPACITY)
    @capacity = capacity
    @load = 0
    @resizes = 0
    @slots = make_slots
  end

  private

  include Hasher
  include PrintMap
  attr_accessor :capacity, :load, :resizes
end

# frozen_string_literal: true

# Obtain information about the map
module MapInfo
  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  INIT_MEMBERS = 0
  def get(value)
    key = hash(value)

    coll[key]
  end

  def keys
    all_keys = []
    coll.each_index { |k| all_keys << k unless @coll[k].nil? }
    all_keys
  end

  def values
    keys.reduce([]) { |vals, key| vals << @coll[key] }
  end

  private

  # key?(key) sounded dumb
  def empty_slot?(key)
    coll[key].nil?
  end

  def fullish?
    load.to_f / capacity >= MAX_LOAD
  end
end

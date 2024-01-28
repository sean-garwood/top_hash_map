# frozen_string_literal: true

# Obtain information about the map
module MapInfo
  def get(value)
    key = hash(value)

    coll[key]
  end

  def keys
    all_keys = []
    coll.each_index { |k| all_keys << k if key?(k) }
    all_keys
  end

  def length
    keys.size
  end

  def values
    keys.reduce([]) { |vals, key| vals << @coll[key] }
  end

  private

  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  PRIME = 31
  def key?(key)
    !coll[key].nil?
  end

  def fullish?
    load.to_f / capacity >= MAX_LOAD
  end

  def to_s
    "\ncapacity: #{capacity}\nload: #{load}\nkeys: #{length}\nvalues: #{values.size}\nresizes: #{resizes}"
  end
end

# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  include MapInfo
  def set(value)
    @coll[hash(value)] = value
    resize
    @load = keys.size
    value
  end

  def remove(value)
    key = hash(value)
    return unless key?(key)

    @load -= 1
    value_to_del = coll[key]
    coll[key] = nil
    resize
    value_to_del
  end

  def clear!
    @capacity = INIT_CAPACITY
    @coll = Array.new(capacity)
    @load = 0
    @resizes = 0
  end

  private

  def hash(value)
    return unless value.is_a?(String)

    key = 0
    pos = 1
    value.each_char do |char|
      key += PRIME * char.ord * pos
      pos += 1
    end
    key %= capacity
  end

  def rehash!
    @resizes += 1
    values.each { |v| set(v) }
  end

  def add_slots
    slots = @capacity
    @capacity *= 2
    slots.times { @coll << nil }
    rehash!
  end

  def resize
    fullish? && add_slots
  end
end

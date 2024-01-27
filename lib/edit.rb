# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  include MapInfo
  def set(value, rehash = nil)
    @load += 1 unless @coll[hash(value)] == value || rehash
    @coll[hash(value)] = value
    resize
    value
  end

  def remove(value)
    key = hash(value)
    return if empty_slot?(key)

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
  end

  private

  def rehash!
    @resizes += 1
    old_values = values
    values.each { |v| set(v, true) }
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

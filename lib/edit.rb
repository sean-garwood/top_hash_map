# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  include MapInfo
  def set(value)
    @load += 1 unless @coll[hash(value)] == value
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
    values.each { |v| set(v) }
    @load = values.length
  end

  def add_slots
    slots = @capacity
    @capacity *= 2
    slots.times { @coll << nil }
    rehash!
  end

  def trim_slots
    @capacity /= 2
    rehash!
  end

  def resize
    return unless emptyish? || fullish?

    emptyish? && trim_slots || fullish? && add_slots
  end
end

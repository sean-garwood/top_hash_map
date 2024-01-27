# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  include MapInfo
  def set(value)
    key = hash(value)
    if empty_slot?(key)
      @load += 1
      resize
    end
    @coll[key] = value
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
    @coll = coll.each_index { |i| coll[i] = nil }
  end

  private

  def change_load(change)
    @load += change
  end

  def rehash!
    vals = values
    @coll = vals.map { |v| set(v) }
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
    @resize_count += 1 if emptyish? || fullish?
    emptyish? && trim_slots || fullish? && add_slots
  end
end

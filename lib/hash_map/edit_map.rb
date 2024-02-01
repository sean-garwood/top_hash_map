# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  def set(key, value)
    insert_node(key, value)
    fullish? && rehash(capacity * 2)
  end

  def remove(key)
    return unless key?(key)

    @load -= 1
    goto_slot(key).delete(key).key
  end

  def clear!
    @capacity = INIT_CAPACITY
    @slots = make_slots
    @load = 0
    @resizes = 0
  end

  private

  def goto_slot(key)
    slots[hash_index(key)]
  end

  def make_slots(slots = capacity)
    Array.new(slots) { LinkedList.new }
  end

  def insert_node(key, value)
    slot = goto_slot(key)
    return slot.find(key).value = value if key?(key)

    @load += 1
    slot.append(key, value)
  end
end

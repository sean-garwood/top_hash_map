# frozen_string_literal: true

# Edit values in the hash map's collection
module EditMap
  def set(key, value)
    fullish? && add_slots
    insert_node(key, value)
  end

  def remove(key)
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

  PRIME = 31
  def hash(str)
    return unless str.is_a?(String)

    str.each_char.reduce(0) { |code, char| code * PRIME + char.ord }
  end

  def hash_index(key)
    hash(key) % capacity
  end

  def goto_slot(key)
    idx = hash_index(key)
    coll[idx] ||= LinkedList.new
  end

  def insert_node(key, value)
    slot = goto_slot(key)
    return slot.find(key).value = value if slot.contains?(key)

    @load += 1
    slot.append(key, value)
  end

  def add_slots
    slots = @capacity
    @capacity *= 2
    slots.times { @coll << nil }
    rehash!
  end

  def rehash!
    @load = 0
    @resizes += 1
    get_nodes.each { |n| set(n.value, n.key) }
  end
end

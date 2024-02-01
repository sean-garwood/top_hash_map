# frozen_string_literal: true

# hash function to convert keys to a small integer that is within the range of
# indices of @slots
module Hasher
  PRIME = 31
  def hash(str)
    return unless str.is_a?(String)

    str.each_char.reduce(0) { |code, char| code * PRIME + char.ord }
  end

  def hash_index(key)
    hash(key) % capacity
  end

  def rehash(num_slots)
    old_entries = entries.flatten(1)
    # reset slots
    @capacity = num_slots
    @slots = Array.new(num_slots) { LinkedList.new }
    # reset entries
    @load = 0
    old_entries.each { |entry| set(entry[0], entry[1]) }
  end
end

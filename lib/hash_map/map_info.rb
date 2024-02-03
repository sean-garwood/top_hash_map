# frozen_string_literal: true

# Obtain information about the map
module MapInfo
  def get(key)
    key?(key) && goto_slot(key).find(key)
  end

  private

  MIN_LOAD = 0.25
  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  def entries
    occupied_slots.reduce([]) { |entries, slot| entries << slot.entries }
  end

  def keys
    occupied_slots.reduce([]) { |keys, slot| keys << slot.keys }.flatten
  end

  def load_f
    load.to_f / capacity
  end

  def occupied_slots
    slots.reject(&:empty?)
  end

  def values
    occupied_slots.reduce([]) { |values, slot| values << slot.values }.flatten
  end

  def fullish?
    load_f >= MAX_LOAD
  end

  def key?(key)
    goto_slot(key).contains?(key)
  end
end

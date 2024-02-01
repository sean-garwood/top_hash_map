# frozen_string_literal: true

# Obtain information about the map
module MapInfo
  def get(key)
    key?(key) && goto_slot(key).find(key)
  end

  def entries
    occupied_slots.reduce([]) { |entries, slot| entries << slot.entries }
  end

  private

  MIN_LOAD = 0.25
  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  def load_f
    load.to_f / capacity
  end

  def occupied_slots
    slots.reject(&:empty?)
  end

  def keys
    occupied_slots.reduce([]) { |keys, slot| keys << slot.keys }
  end

  def values
    occupied_slots.reduce([]) { |values, slot| values << slot.values }
  end

  def fullish?
    load_f >= MAX_LOAD
  end

  def key?(key)
    goto_slot(key).contains?(key)
  end
end

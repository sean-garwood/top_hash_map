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
  def collect(&attr)
    return unless block_given?

    occupied_slots.reduce([]) { |attrs, slot| attrs << attr.call(slot) }
  end

  def entries
    collect(&:entries)
  end

  def length
    entries.size
  end

  def keys
    collect(&:keys).flatten
  end

  def load_f
    load.to_f / capacity
  end

  def occupied_slots
    slots.reject(&:empty?)
  end

  def values
    collect(&:values).flatten
  end

  def fullish?
    load_f >= MAX_LOAD
  end

  def key?(key)
    goto_slot(key).contains?(key)
  end
end

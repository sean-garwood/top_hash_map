# frozen_string_literal: true

# Obtain information about the map
module MapInfo
  def get(key)
    idx = hash_index(key)
    return unless coll[idx] || coll[idx].contains_key?(key)

    coll[idx].find(key)
  end

  def get_all(&keys_or_values)
    get_nodes.map{ |node| node.value[keys_or_values.call] }
  end

  def keys
    get_all(:key)
  end

  def values
    get_all(:value)
  end

  def length
    keys.size
  end

  def entries
    get_nodes
  end

  private

  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  def key?(key)
    coll[hash_index(key)].contains?(key)
  end

  def fullish?
    (load + 1.to_f) / capacity >= MAX_LOAD
  end

  def get_nodes
    coll.flatten { |slot| slot.collect_nodes }
  end

  def to_s
    "\ncapacity: #{capacity}\nload: #{load}\nkeys: #{length}\nvalues: #{values.size}\nresizes: #{resizes}"
  end
end

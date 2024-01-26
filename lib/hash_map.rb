# map strings to a key, which is an array of a determinate size
class HashMap
  MIN_LOAD = 0.25
  MAX_LOAD = 0.75
  INIT_CAPACITY = 16
  attr_accessor :coll, :load
  attr_reader :load_f, :capacity

  def initialize
    @load_f = MAX_LOAD
    @capacity = INIT_CAPACITY
    @coll = Array.new(capacity) # this could probably be its own class that
    #   would inherit from the HashMap class, maybe just call it Collection?
    @load = coll.compact.size
  end

  def length
    coll.compact.length
  end

  def get(value)
    key = hash(value)
    raise IndexError if out_of_bounds?(key)

    coll[key]
  end

  def set!(value)
    key = hash(value)
    raise IndexError if out_of_bounds?(key)

    resize(1)
    return @coll[key] = value if empty_slot?(key)

    nil
  end

  def remove(value)
    key = hash(value)
    raise IndexError if out_of_bounds?(key)

    coll[key] = nil
    resize(-1)
  end

  def keys
    all_keys = []
    coll.each_with_index { |v, k| all_keys << k unless v.nil? }
    all_keys.compact
  end

  def values
    all_values = []
    coll.each { |v| all_values << v }
    all_values.compact
  end

  def clear!
    reset_capacity!
    @coll = coll.each_index { |i| coll[i] = nil }
  end

  def to_s
    "load_f: #{load_f}, capacity: #{capacity}, coll: #{coll}, load: #{load}"
  end

  private

  attr_writer :load_f, :capacity

  PRIME = 31
  def hash(value)
    return unless value.is_a?(String)

    key = value[0].ord
    value.each_char { |char| key += PRIME * char.ord }
    key %= capacity
    key
  end

  def add_slots
    @capacity *= 2
    rehash
  end

  def trim_slots
    @capacity *= 0.5
    rehash
  end

  def resize(signed_int)
    emptyish? && trim_slots
    fullish? && add_slots
  end

  def rehash
    new_map = HashMap.new
    coll.compact.each { |v| new_map.set!(v) }
  end

  def reset_capacity!
    @capacity = INIT_CAPACITY
  end

  # key?(key) sounded dumb
  def empty_slot?(key)
    coll[key].nil?
  end

  def emptyish?
    !fullish? && capacity != INIT_CAPACITY
  end

  def fullish?
    load_f <= load / capacity
  end

  def out_of_bounds?(key)
    key.negative? || key >= @coll.size
  end
end

# frozen_string_literal: true

# make some entries
module FakeEntries
  private

  def make_key
    random_letter = proc { rand(97..97 + 25).chr }
    key = []
    rand(min_chars..min_chars + 4).times { key << random_letter.call }
    key.join('')
  end

  def make_keys
    some_keys = []
    len.times { some_keys << make_key }
    some_keys
  end

  def make_entries
    make_keys.reduce([]) { |entries, k| entries << [k, rand(1..2**32 - 1)] }
  end

  def to_s
    "number of keys: #{len}\nname len (chars): #{min_chars}-#{min_chars + 6}"
  end
end

# frozen_string_literal: true

require_relative 'lib/hash_map'
require_relative 'lib/linked_list'
require_relative 'lib/entries'

foo = HashMap.new
bar = Entries.new(88)
bar.entries.each_with_index { |key, value| foo.set(key, value) }

puts foo

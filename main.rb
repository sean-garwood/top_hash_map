# frozen_string_literal: true

require 'pry-byebug'

require_relative 'lib/hash_map'
require_relative 'lib/linked_list'
require_relative 'lib/entries'
foo = HashMap.new
bar = Entries.new(12)
bar.entries.each_with_index { |key, value| foo.set(key, value) }
puts foo
bar.entries.each_with_index { |key, value| foo.remove(key) if value.even? }

puts foo

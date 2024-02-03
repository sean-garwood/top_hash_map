# frozen_string_literal: true

require_relative 'lib/hash_map'
require_relative 'lib/linked_list'
require_relative 'lib/entries'

# foo = HashMap.new
# Entries.new(12).entries.each_with_index { |key, value| foo.set(key, value) }
# puts foo

bar = HashMap.new
bar.set('sean', 'cannot get this right...or can he?')
puts bar
puts bar.remove('sean')
puts bar

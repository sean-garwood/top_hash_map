# frozen_string_literal: true

require_relative 'lib/hash_map'
require_relative 'lib/linked_list'
require_relative 'lib/entries'

foo  = HashMap.new
baz = Entries.new(10).entries


baz.each { |entry| foo.set(entry[0], entry[1]) }
foo.set('key i know', -1)

puts foo
puts foo.remove('key i know')
puts foo

# frozen_string_literal: true

require_relative 'lib/info'
require_relative 'lib/edit'

require_relative 'lib/hash_map'
require_relative 'lib/names'

foo = HashMap.new
bar = Names.new(2056 - 512)
bar.names.each { |name| foo.set(name) }

puts foo.values.length.to_f / bar.names.length
puts foo.load

puts foo

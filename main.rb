# frozen_string_literal: true

require_relative 'lib/info'
require_relative 'lib/edit'

require_relative 'lib/hash_map'
require_relative 'lib/names'

foo = HashMap.new
bar = Names.new(2056 - 512)
bar.names.each { |name| foo.set(name) }

puts "total names: #{bar.names.length}"
puts "values in hmap: #{foo.values.length}"
puts "hmap load: #{foo.load}"
puts "resized #{foo.resizes} times"

# frozen_string_literal: true

require_relative 'lib/info'
require_relative 'lib/edit'

require_relative 'lib/hash_map'
require_relative 'lib/names'

foo = HashMap.new
bar = Names.new(1000, 3)
bar.names.each { |name| foo.set(name) }

puts "\nnames:\n\n#{bar}"
puts "\nmap:\n#{foo}"

foo.clear!

puts foo

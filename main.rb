# frozen_string_literal: true


require_relative 'lib/hash_map'


hashie = HashMap.new
some_names = %w[beate charles karen mellisa rachel jessica sean]
some_names.each { |name| hashie.set!(name) }


puts "here are some names: #{hashie.values}"
puts hashie

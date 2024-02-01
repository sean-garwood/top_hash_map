# frozen_string_literal: true

# print hash map
module PrintMap
  def print_lists
    slots.reject(&:empty?).each { |list| puts list }
  end

  def print_entries
    "\nentries: #{entries}"
  end

  def to_s
    print_lists
    "
    \ncapacity: #{capacity}\nload: #{load}\nresizes: #{resizes}\n
    "
  end
end

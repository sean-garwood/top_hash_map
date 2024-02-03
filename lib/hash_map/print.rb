# frozen_string_literal: true

# print hash map
module PrintMap
  def print_slots
    slots.each { |slot| puts slot }
  end

  def to_s
    print_slots
    "
    \ncapacity: #{capacity}\nload: #{load}\nresizes: #{resizes}
    \nkeys: #{keys}\nvalues: #{values}\nentries: #{entries}
    "
  end
end

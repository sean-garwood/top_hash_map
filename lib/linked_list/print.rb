# frozen_string_literal: true

# print linked lists
module PrintList
  def to_s
    return '{ }' if empty? || nil?

    print_linked_node = ->(key, value) { print "{ #{key}: #{value} } -> " }
    current_node = @head
    while current_node != @tail
      print_linked_node.call(current_node.key, current_node.value)
      current_node = current_node.next_node
    end
    "{ #{@tail.key}: #{@tail.value} }"
  end
end

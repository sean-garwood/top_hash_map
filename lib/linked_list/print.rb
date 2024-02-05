# frozen_string_literal: true

# print linked lists
module PrintList
  def linked(key, value)
    "{ #{key}: #{value} } -> "
  end

  def to_s
    return '{ }' if empty? || nil?

    nodes = []
    curr = head
    while curr != tail
      nodes << linked(curr.key, curr.value) unless curr.nil?
      curr = curr.next_node
    end
    tail.nil? ? nil : nodes << "{ #{tail.key}: #{tail.value} }"
    nodes.join
  end
end

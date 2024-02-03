# frozen_string_literal: true

# modify contents
module EditList
  def append(key, value)
    node = Node.new(key, value)
    if empty?
      @head = node
    elsif head == tail
      @head.next_node = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def delete(key)
    return unless contains?(key)

    del = find(key)
    if head == del
      @head = del.next_node
    else
      all.select { |n| n.next_node == del }[0].next_node = del.next_node
    end
    @size -= 1
    del
  end
end

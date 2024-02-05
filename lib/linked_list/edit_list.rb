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
    return unless !empty? && contains?(key)

    del = find(key)
    reset_neighbor_attrs(del)
    del
  end

  private

  def reset_neighbor_attrs(del)
    if head == tail
      @head = nil
      @tail = nil
    elsif del == head
      @head = del.next_node
    elsif del == tail
      @tail = head
      @head.next_node = nil
    else
      parent = collect.select { |n| n.next_node == del }[0]
      parent.next_node = del.next_node
    end
  end
end

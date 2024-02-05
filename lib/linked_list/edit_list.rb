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

  def clear_list
    @head = nil
    @tail = nil
  end

  def target_is_head
    @head = del.next_node
  end

  def target_is_tail
    @tail = head
    @head.next_node = nil
  end

  def reset_neighbor_attrs(del)
    return clear_list if head == tail

    return target_is_head if del == head

    return target_is_tail if del == tail

    parent = collect.select { |n| n.next_node == del }[0]
    parent.next_node = del.next_node
  end
end

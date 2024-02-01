# frozen_string_literal: true

# modify contents
module ListInfo
  def keys
    collect.map(&:key)
  end

  def values
    collect.map(&:value)
  end

  def entries
    collect.map { |node| [node.key, node.value] }
  end

  def find(key, curr = head)
    return if empty? || curr.next_node.nil? && curr.key != key

    curr.key == key ? curr : find(key, curr.next_node)
  end

  def contains?(key)
    keys.any? { |k| k == key }
  end

  def empty?
    size.zero?
  end

  private

  def collect(curr = head, nodes = [])
    return if empty?

    nodes << curr
    curr == tail ? nodes : collect(curr.next_node, nodes)
  end

  def to_s
    print_linked_node = ->(key, value) { print "{ #{key}: #{value} } -> " }
    current_node = @head
    return '' if current_node.nil?

    while current_node != @tail
      print_linked_node.call(current_node.key, current_node.value)
      current_node = current_node.next_node
    end
    "{ #{@tail.key}: #{@tail.value} }"
  end
end

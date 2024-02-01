# frozen_string_literal: true

require_relative 'node'

# Ruby impl of a linked list.
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
    @size = 0
  end

  def append(key, value)
    node = Node.new(key, value)
    if @size.zero?
      @head = node
    elsif @size == 1
      @head.next_node = node
    else
      @tail.next_node = node
    end
    @size += 1
    @tail = node
  end

  def collect_nodes(curr = @head, nodes = [])
    return nodes if size.zero?

    nodes << curr
    curr == tail ? nodes : collect_nodes(curr.next_node, nodes)
  end

  def find(key, curr = @head)
    return if size.zero?

    if curr == tail
      return curr if curr.key == key

      return nil
    end
    curr.key.same?(key) ? curr : find(key, curr.next_node)
  end

  def contains?(key)
    collect_nodes.any? { |node| node.key == key }
  end

  def to_s
    print_linked_node = ->(key, value) { print "( { '#{key}' => #{value} } ) -> " }
    current_node = @head
    return '' if current_node.nil?

    while current_node != @tail
      # would be cleaner to refactor this call to print / lambda outside in its
      # own method
      print_linked_node.call(current_node.value)
      current_node = current_node.next_node
    end
    "( #{@tail.value} ) -> nil"
  end
end

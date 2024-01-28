# frozen_string_literal: true

require_relative 'node'

# Ruby impl of a linked list.
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
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

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head unless @head.nil?
    @head = node
    @size += 1
    size == 1 && @tail = @head
  end

  def at(index)
    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def reset_head_during_pop
    @size.zero? && nil || @size == 1 && @head = nil || @head.next_node = nil
  end

  def reset_tail_during_pop
    if size < 3
      @size.zero? && nil || @size == 1 && @tail = nil ||
                            @size == 2 && @head = @tail
    end
    @tail = at(size - 2)
    @tail.next_node = nil
  end

  def pop
    return if @size.zero?

    popped = @tail
    popped.freeze
    reset_head_during_pop
    reset_tail_during_pop
    @size -= 1
    popped
  end

  def collect_nodes
    nodes = []
    current_node = @head
    until current_node.nil?
      nodes << current_node
      current_node = current_node.next_node
    end
    nodes
  end

  def contains?(value)
    nodes = collect_nodes
    nodes.any? { |node| node.value == value }
  end

  def find(value)
    nodes = collect_nodes
    results = nodes.select { |node| node.value == value }
    results.empty? && nil || results.length == 1 && results[0] || results
  end

  def to_s
    print_linked_node = ->(value) { print "( #{value} ) -> " }
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

  # extra credit
  def split_nodes
    nodes = collect_nodes
    first_half = nodes[0..index - 1]
    second_half = nodes[index..]
    [first_half, second_half]
  end

  def back_to_list(node_collection)
    ll = LinkedList.new
    node_collection.each { |node| ll.append(node.value) }
  end

  def insert_at(value, index)
    node = Node.new(value)
    split_nodes
    back_to_list(nodes)
  end

  def remove_at(index)
    nodes = collect_nodes
    nodes = first_half.concat(second_half)
    back_to_list(nodes)
  end
end

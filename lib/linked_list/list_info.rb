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
    head.nil?
  end

  private

  def collect(curr = head, nodes = [])
    return nodes if empty?

    nodes << curr
    curr == tail ? nodes : collect(curr.next_node, nodes)
  end
end

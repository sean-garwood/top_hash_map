# frozen_string_literal: true

require_relative 'linked_list/edit_list'
require_relative 'linked_list/list_info'
require_relative 'linked_list/print'

require_relative 'linked_list/node'

# Ruby impl of a linked list.
class LinkedList
  include EditList
  include ListInfo
  include PrintList
  attr_accessor :head, :tail, :size
  attr_reader :keys, :values

  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
    @size = 0
    @keys = []
    @values = []
  end

  private

  attr_writer :keys, :values
end

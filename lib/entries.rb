# frozen_string_literal: true

require_relative 'entries/fake_entries'
# quickly generate lists of random letters
class Entries
  attr_reader :entries

  def initialize(len = 12, min_chars = 4)
    @len = len
    @min_chars = min_chars
    @entries = make_entries
  end

  private

  include FakeEntries
  attr_reader :len, :min_chars
end

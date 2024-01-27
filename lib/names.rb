# quickly generate large lists of random letters
class Names
  attr_accessor :names

  def initialize(len = 16, min_chars = 4)
    @len = len
    @min_chars = min_chars
    @names = make_names
  end

  private

  attr_reader :len, :min_chars

  def make_names
    some_names = []
    len.times { some_names << make_name }
    some_names
  end

  def make_name
    random_letter = proc { rand(97..97 + 25).chr }
    name = ''
    rand(min_chars..min_chars + 6).times { name << random_letter.call }
    name
  end
end

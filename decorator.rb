require "./nameable.rb"

class Decorator < Nameable
  attr_reader :nameable
  attr_writer :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
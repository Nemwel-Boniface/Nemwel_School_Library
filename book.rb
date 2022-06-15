class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rentals(person, date)
    Rental.new(person, date, self)
  end
end

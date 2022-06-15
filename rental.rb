class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, date, book)
    @date = date
    @person = person
    @book = book
  end

  def book=(book)
    @book = book
    book.rental.push(self) unless book.rental.includes?(self)
  end

  def person=(person)
    @person = person
    person.rental.push(self) unless person.rental.includes?(self)
  end
end
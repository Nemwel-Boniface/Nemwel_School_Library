class Rental
  attr_accessor :date, :book, :person

  def initialize(person, date, book)
    @date = date
    @person = person
    person.rental.push(self) unless person.rental.includes?(self)
    @book = book
    book.rental.push(self) unless book.rental.includes?(self)
  end
end

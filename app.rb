# require_relative './main'
require "./person.rb"
require "./student.rb"
require "./teacher.rb"
require "./rental.rb"
require "./book.rb"
require "./classroom.rb"
require './nameable'
require './decorator'
require './capitalizedecorator'
require './trimmerdecorator'

class App
  attr_accessor :people, :book, :rental
  def initialize()
    @people = []
    @books = []
    @book = nil
    @rentals = []
    @person = nil
  end

  def list_all_books
    if @books.length.zero?
      puts 'You don\'t have any books'
    else
      @books.each_with_index do |bk, index|
        puts "#{index}) Title: #{bk.title}, Author: #{bk.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'You need at least one person'
    else
      @people.map.each_with_index do |person, index|
        puts "#{index}) [#{person.classroom}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_student
    puts "Great! let's create the student!"
    print "Student age: "
    stdage = gets.chomp.to_i
    print "Student name: "
    stdname = gets.chomp
    print "Student class: "
    std_class = gets.chomp
    print "Parent permission? true/ false: "
    stdparpermission = gets.chomp
    case stdparpermission
    when 'true'
      @people.push(Student.new(stdage, std_class, stdname, true))
    when 'false'
      @people.push(Student.new(stdage, std_class, stdname, false))
    else
      puts "That was an invalid entry"
    end

    puts "Student is created successfully"
    print @people
  end

  def create_a_person
    print "Hello! Would you like to create a:
    1. Student
    2. Teacher
    Choose between the two: "
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student

    when 2
      puts "Great! let\'s create the Teacher!"
      print "Teacher age: "
      teacher_age = gets.chomp.to_i
      print "Teacher name: "
      teacher_name = gets.chomp
      print "Teacher specialization: "
      teacher_specs = gets.chomp
      teacher_permission = true
      @people.push(Teacher.new(teacher_age, teacher_name, teacher_specs, 'junior', teacher_permission))
      puts "Teacher is created successfully"
    end
  end

  def create_a_book
    print "Splendid! we love new books.
    Enter the book title: "
    book_title = gets.chomp
    print "Enter the book's author: "
    book_author = gets.chomp
    @books.push(Book.new(book_title, book_author))
    puts "Book was added succesfully!"
  end

  def create_a_rental
    if @books.empty? && @people.empty?
      puts 'Huh, nothing to see here'
    else
      puts 'Select the id of the book you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'Type your ID: '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter date of renting the book:(yyyy-mm-dd) '
      date = gets.chomp.to_s
      rent = Rental.new(individual, date, @books[index])
      @rentals << rent

      puts 'Book rented successfully'
    end
  end

  def list_all_rentals_id
    puts 'There are no rentals available at the moment' if @rentals.empty?
    print 'Wonderful! let\'s find your book!\n, Type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rent| rent.person.id == id }
    if rental.empty?
      puts 'Sorry there are no records for that ID'
    else
      puts 'Here are your records: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}) Date: #{record.date} Borrower: #{record.person.name}
         Status: #{record.person.class} Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
      end
    end
  end

  def quit_app
    puts 'Thank you for using my app!'
    exit(true)
  end
end

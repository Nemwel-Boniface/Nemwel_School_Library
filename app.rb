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
      # @people.push([teacher_age, teacher_name, teacher_specs, teacher_permission])
      puts "Teacher is created successfully"
    end
  end

  def create_a_book
    print "Splendid! we love new books.
    Enter the book title: "
    book_title = gets.chomp
    print "Enter the book's author: "
    book_author = gets.chomp
    # @book.push([book_title, book_author])
    @books.push(Book.new(book_title, book_author))
    puts "Book was added succesfully!"
  end

  def create_a_rental
    puts "Splendid! We are happy you want to read."
    @people.map.each_with_index do |person, index|
      puts "=> #{index}) [#{person.classroom}] Name: #{person.name}, ID: #{person.id}"
    end
    print "Enter your index: "
    person_index = gets.chomp.to_i
    print "Enter date of renting the book:(yyyy-mm-dd) "
    date = gets.chomp
    print "Enter the book index: "
    @books.each_with_index do |bk, index|
      puts "=> #{index}) Title: #{bk.title}, Author: #{bk.author}"
    end
    book_index = gets.chomp.to_i
    @person = @people[person_index]
    @book = @books[book_index]
    @rentals.push(Rental.new(@person, date, @book))
    puts "Book was rented succesfully!"
  end

  def list_all_rentals_id
  end

  def quit_app
    puts 'Thank you for using this app!'
    exit(true)
  end
end

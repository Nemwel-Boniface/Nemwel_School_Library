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
  end

  def create_a_book
  end

  def create_a_rental
  end

  def list_all_rentals_id
  end

  def quit_app
  end
end

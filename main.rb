require_relative './app'

def print_menu
  print "Welcome to my Library! You may perform the following tasks:
  1. List all books.
  2. List all people
  3. Create a person
  4. Create a book.
  5. Create a rental
  6. List all rentals for a given person id.
  7. Exit
  Choose (1-7): "
end

def get_choice
  choice = gets.chomp.to_i
  choice
end

def match_input(choice)
  method = App.new
  case choice
  when 1
    method.list_all_books
  when 2
    method.list_all_people
  when 3
    method.create_a_person
  when 4
    method.create_a_book
  when 5
    method.create_a_rental
  when 6
    method.list_all_rentals_id
  when 7
    method.quit_app
  else
    puts "Not a valid choice"
  end
end

def main
  method = App.new
  print_menu
  user_input = get_choice
  match_input(user_input)
end

main


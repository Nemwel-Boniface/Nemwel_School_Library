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

def main
  print_menu
end

main


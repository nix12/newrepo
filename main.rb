require_relative 'library.rb'
require_relative 'book.rb'

library = Library.new
looper = true

while looper
  puts "What action would you like to take"
  puts "ADD for adding a new book"
  puts "UPDATE for update book information"
  puts "DELETE for removing a book from the list"
  puts "LIBRARY for the contents of the library"

  option = gets.chomp.downcase

  case option

  when "add"

    puts "What is the title of the book you would like to add?"
    title = gets.chomp

    puts "What is the authors name?"
    author = gets.chomp

    puts "How would you rate this book?"
    rating = gets.chomp.to_s

    if library.already_has_book?(title)
      puts "This book is already in our library."
    else
      book = Book.new(title, author, rating)
      library.add(book)
      puts library.display_book_titles
      puts book.info
    end

  when "update"  	
    
    puts library.display_book_titles
    puts "What is the title of the book you would like to update?"
    title = gets.chomp

    if library.already_has_book?(title)
      
      puts "What information would you like to update?"
      puts "Type rating or review"
      update = gets.chomp.to_s

      if update == "rating"
      	puts library.select_book(title)
      	puts "What will the new rating be?"
      	rating = gets.chomp.to_s
      	book.rating = rating
      	puts
      	puts book.info
      	puts
      	puts "#{title} rating has been updated."
      	      # review update goes in this area
      else
      	puts "That option is not available"
      end
    
    else
      puts "This book does not exist in this library."
    end

  when "delete"

  	puts library.display_book_titles
    puts "What book would you like to delete"
    title = gets.chomp

    if library.already_has_book?(title)
      puts library.remove_book(title)
      puts "#{title} has been delete from the library"
      puts
      puts library.display_book_titles
    else
      puts "This book does not exist in this library."
    end


  when "library"

    puts "Welcome to the library"
    puts "Here are the list of actions you can do"
    puts "DISPLAY: Book Titles, Book information"
    puts "SORT: sort by title, sort by rating"
    #puts "review: options"
    
    puts "What information would you like to view?"
    action = gets.chomp.to_s.downcase
    
    case action

      when "display"
        

        puts "What information would you like displayed?"
        puts "titles: to display all titles available"
        puts "all: to display all information"
        subaction = gets.chomp.to_s.downcase

        if subaction == "titles"
          puts library.display_book_titles
        elsif subaction == "all"
          puts library.display_book_all
        else
          puts "That option is not available"
        end

      when "sort"
        puts "How would you like your library to be sorted?"
        puts "rating: to sort by ratings."
        puts "title: to sort by title."
        subaction = gets.chomp.to_s.downcase

        if subaction == "title"
          library.sort_by_title
        elsif subaction == "rating"
          puts library.sort_by_rating
        else
          puts "That option is not available"
        end
      end
            


  else
    puts "that is not an option"

  end

    puts "Press enter to continue."
    puts "Enter n if you wish to quit."
    continue = gets.chomp.downcase
    # breaks the loop since you said "while true"
    looper = false if continue == "n"
end

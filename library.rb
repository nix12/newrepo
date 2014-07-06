
class Library
  attr_accessor :books

  def initialize
    # this will be your list of books.
    @books = []
    @rate_array = []
  end

  def add(book)
    @books << book
    @rate_array << book.rating
    puts "#{book.title} has been added to the library"
  end

  def select_book(book_title)
    # find the book with the title that the user has put in
    # if you want case insensivite then do something like
    # @books.find { |book| book.title.downcase == book_title.downcase }
    @books.find { |book| book.title.downcase == book_title.downcase }
  end

  def already_has_book?(book_title)
    # select_book will either find it and return it as nil
    # the ! will do the opposite of what is there
    # if I say !true then that would be false
    # so !#nil? means is this not nil
    !select_book(book_title).nil?
  end

  def display_book_titles
    # this will iterate over the list of books and call title on them
    # at the end it will return an array of just the book titles
    # it is that same as doing something like:
    # array = []
    # @books.each do |book|
    #   array << book.title
    # end
    # return array
    @books.map do |book|
      book.title
    end
  end

  def display_book_all
    @books.map do |book|
      book.info
    end
  end

  def remove_book(book_title)
    # first go in and select the book from the title with 
    # the select_book method
    book = select_book(book_title)
    # now take that instance of the book and delete it from 
    # @books
    @books.delete(book)
  end

## Methods for sorting and display library
  def sort_by_title
    @books.sort_by { |book| puts book.title }
  end

  def sort_by_rating
    @rate_array.sort { |book| puts book.title }
  end

end

class Book
  # this will make all of these methods able to
  # be able to be manipulated outside of the context
  # of this class
  # for example you could say 
  # book = Book.new
  # book.title = 'Some Book'
  # book.author = 'A person'
  # book.rating = 9
  # and it will store those values on the instance variables
  attr_accessor :title, :author, :rating

  def initialize(title, author, rating)
    @title = title
    @author = author
    @rating = rating
  end

  def info
    puts "**********"
    puts "Book Title: #{title}"
    puts "Author: #{author}"
    puts "Rating: #{rating}"
    puts "**********"
  end
end
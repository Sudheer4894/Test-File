class Bookstore
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(title)
    @books.reject! { |book| book.title == title }
  end

  def search_books(author)
    @books.select { |book| book.author == author }
  end

  def total_books
    @books.size
  end

  def books_by_genre(genre)
    @books.select { |book| book.genre == genre }
  end
end

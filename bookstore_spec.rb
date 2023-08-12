require 'rspec'
require_relative 'bookstore' # Make sure the file path is correct

RSpec.describe Bookstore do
  let(:bookstore) { Bookstore.new }

  context 'when managing books' do
    let(:book1) { double('book1', title: 'Book 1', author: 'Author 1', genre: 'Fiction') }
    let(:book2) { double('book2', title: 'Book 2', author: 'Author 2', genre: 'Non-Fiction') }

    it 'can add a book' do
      bookstore.add_book(book1)
      expect(bookstore.books).to include(book1)
    end

    it 'can remove a book' do
      bookstore.add_book(book1)
      bookstore.add_book(book2)
      bookstore.remove_book('Book 1')
      expect(bookstore.books).not_to include(book1)
    end

    it 'can search books by author' do
      bookstore.add_book(book1)
      bookstore.add_book(book2)
      expect(bookstore.search_books('Author 1')).to eq([book1])
    end

    it 'can return the total number of books' do
      bookstore.add_book(book1)
      bookstore.add_book(book2)
      expect(bookstore.total_books).to eq(2)
    end

    it 'can list books by genre' do
      bookstore.add_book(book1)
      bookstore.add_book(book2)
      expect(bookstore.books_by_genre('Fiction')).to eq([book1])
    end
  end
end

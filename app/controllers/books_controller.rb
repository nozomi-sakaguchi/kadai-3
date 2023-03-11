class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
  end

  def show
  end

  def edit
  end


  def desutroy
  end

  private

  def books_params
    params.require(:books).oermit(:book_title, :opinion)
  end

end

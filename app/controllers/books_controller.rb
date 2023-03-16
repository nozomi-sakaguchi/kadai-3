class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book)
  end

  def index
    @book= Book.new
    @books= Book.all
    @user= current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @book = book.find(params[:id])
  end


  def desutroy
    @book =  book.find(params[:id])
    @book.desutroy
    redirect_to book_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end

end

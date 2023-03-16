class UsersController < ApplicationController

  def show
    @book = Book.new
    @books =Book.all
    @book_id = Book.find(params[:id])
    @user = current_user
  end

  def index
    @book= Book.new
    @books= Book.all
    @user= current_user
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book)
  end

  def edit
  end
end

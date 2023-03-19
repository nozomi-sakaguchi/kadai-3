class UsersController < ApplicationController

  def show
    @book = Book.new
    @books =Book.all
    @user = current_user
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end


  def index
    @user = current_user
    @new_user= User.new
    @users= User.all
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book)
  end

  def edit
  end

  def update
    @user = User.find(params:id)
    @user = update
    redirect_to  books_path(@user)
  end

end

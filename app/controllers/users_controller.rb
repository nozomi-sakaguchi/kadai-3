class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def index
    @book = Book.new
    @user = current_user
    @new_user= User.new
    @users= User.all
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice:"You have created book successfully."
    else
      flash.now[:alert] ="book was not created because of an error"
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      flash.now[:alert] = "user was not updated due to an error"
      render :edit
    end
  end

    private

  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end

class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book),notice:"You have created book successfully."
    else
      flash.now[:alert] ="book was not created because of an error"
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book= Book.new
    @books= Book.all
    @user= current_user

  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @books_user = @books.user
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user.id == current_user.id
      redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      flash.now[:alert] = "book was not updated due to an error"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    private

    def books_params
      params.require(:book).permit(:title, :body, :profile_image )
    end

end
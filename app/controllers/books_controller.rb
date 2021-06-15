class BooksController < ApplicationController
  def index
  end

  def show
   @list = List.find(params[:books])
  end

  def new
   @blog = Book.new
  end

  def create
    blog = Book.new(book_params)
    blog.save
    redirect_to boos_path
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

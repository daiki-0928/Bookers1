class BooksController < ApplicationController
protect_from_forgery
  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
   if @book.save
      redirect_to book_path(@book.id) , notice: 'Book was successfully created.'
   else
    flash.now[:alert] = '2 errors prohibited this book from being saved:'
   end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

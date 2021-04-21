class BooksController < ApplicationController

  def top
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] ='Book was successfully destroyed'
    redirect_to books_path(book)
    end
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = 'Book was successfully create.'
       redirect_to book_path(@book)
    else
       flash[:alert] = 'create error'
       render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] ='Book was successfully update'
    redirect_to book_path(@book)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
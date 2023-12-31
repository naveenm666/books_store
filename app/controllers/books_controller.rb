# app/controllers/books_controller.rb

class BooksController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_author, only: [:new, :create]
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = @author.books.build
  end

  def create
    @book = @author.books.build(book_params)

    if @book.save
      redirect_to author_books_path(current_author), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The set_book before_action ensures @book is set
  end

  def update
    if @book.update(book_params)
      redirect_to author_books_path(current_author), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to author_books_path(current_author), notice: 'Book was successfully destroyed.'
  end

  private

  def set_author
    @author = current_author
  end

  def set_book
    @book = current_author.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :title,
      :supplier_id,  
      :year_published,
      :out_of_print,
      :price
    )
  end
end

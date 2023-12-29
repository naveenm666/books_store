class ReviewsController < ApplicationController
    before_action :find_book, only: [:new, :create, :index, :show]
  
    def index
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    end

    def show
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    end
  
    def new
      @review = @book.reviews.new
    end
  
    def create
      @review = @book.reviews.new(review_params)
      if @review.save
        redirect_to book_reviews_path(@book), notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def find_book
      @book = Book.find(params[:book_id])
    end
  
    def review_params
      params.require(:review).permit(:body, :rating, :customer_id)
    end
  end
  
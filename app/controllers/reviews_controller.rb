class ReviewsController < ApplicationController
  before_action :find_order, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  def index
    @reviews = @order.reviews
  end

  def show
    @review = @order.reviews.find(params[:id])
  end

  def new
    @review = @order.reviews.new
  end

  def create
    @review = @order.reviews.new(review_params)
    if @review.save
      redirect_to order_reviews_path(@order), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
    @review = @order.reviews.find(params[:id])
  end

  def update
    @review = @order.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to order_reviews_path(@order), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review = @order.reviews.find(params[:id])
    @review.destroy
    redirect_to order_reviews_path(@order), notice: 'Review was successfully destroyed.'
  end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:body, :rating, :customer_id)
  end
end

class OrdersController < ApplicationController
  before_action :set_customer
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :check_current_customer_order, only: [:edit, :update, :destroy]

  def index
    @orders = @customer.orders
  end

  def show
    @order = @customer.orders.find(params[:id])
  end

  def new
    @order = @customer.orders.build
    @books = Book.all
  end

  def create
    @order = @customer.orders.build(order_params)
    @books = Book.all

    selected_books = Book.where(id: params[:order][:book_ids])
    total_price_of_selected_books = selected_books.sum(&:price)

    @order.total = total_price_of_selected_books * @order.subtotal

    if @order.save
      redirect_to customer_orders_path(@customer), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
    @books = Book.all
  end

  def update
    @books = Book.all

    selected_books = Book.where(id: params[:order][:book_ids])
    total_price_of_selected_books = selected_books.sum(&:price)

    @order.total = total_price_of_selected_books * @order.subtotal

    if @order.update(order_params)
      redirect_to customer_orders_path(@customer), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to customer_orders_path(@customer), notice: 'Order was successfully destroyed.'
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_order
    @order = @customer.orders.find(params[:id])
  end

  def check_current_customer_order
    unless @order.customer == current_customer
      redirect_to customer_orders_path(@customer), alert: "You don't have permission to perform this action."
    end
  end

  def order_params
    params.require(:order).permit(:date_submitted, :status, :subtotal, :shipping, book_ids: [])
  end
end

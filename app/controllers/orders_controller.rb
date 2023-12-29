class OrdersController < ApplicationController
  before_action :set_customer
  
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

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def order_params
    params.require(:order).permit(:date_submitted, :status, :subtotal, :shipping, book_ids: [])
  end
  
end

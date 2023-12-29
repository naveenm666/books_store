class CustomersController < ApplicationController
   def index
      @customers = Customer.all
    end
 
     def show
        @customer = Customer.find(params[:id])
      end
    
      def new
        @customer = Customer.new
      end
    
      def create
        @customer = Customer.new(customer_params)
    
        if @customer.save
          redirect_to @customer
        else
          render :new, status: :unprocessable_entity
        end
      end


      def full_name
        "#{first_name} #{last_name}"
      end
    
      def edit
        @customer = Customer.find(params[:id])
      end
    
      def update
        @customer = Customer.find(params[:id])
    
        if @customer.update(customer_params)
          redirect_to @customer
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
    
        redirect_to root_path, status: :see_other
      end
    
      private
        def customer_params
          params.require(:customer).permit(:firstname , :lastname , :email)
        end

end

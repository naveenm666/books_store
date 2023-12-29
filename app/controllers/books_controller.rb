class BooksController < ApplicationController
    def index
        @books = Book.all



        if params[:sort] == 'title_asc'
          @books = @books.order(title: :asc)
        elsif params[:sort] == 'price_low_high'
          @books = @books.order(price: :asc)
        elsif params[:sort] == 'price_high_low'
          @books = @books.order(price: :desc)
        else
          @books = @books.order(created_at: :desc)
        end
      
      
    end
    
      def show
        @book = Book.find(params[:id])
      end
      
    
      def new
        @book = Book.new
      end
    
      def create
        @book = Book.new(book_params)
    
        if @book.save
          redirect_to @book
        else
            puts @book.errors.full_messages.inspect

          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @book = Book.find(params[:id])
      end
    
      def update
        @book = Book.find(params[:id])
    
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to root_path, status: :see_other
      end
    
      private
        def book_params
          params.require(:book).permit(:title, :author_id, :supplier_id, :year_published, :out_of_print, :price)
        end
end

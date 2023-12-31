class AuthorsController < ApplicationController
  before_action :authenticate_author!, except: [:show]

  def index
    @current_author = current_author if author_signed_in?
  end
    
    
  private
  
  def author_params
    params.require(:author).permit(:name, :email, :password, :password_confirmation)
  end
end

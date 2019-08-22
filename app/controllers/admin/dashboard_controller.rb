class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"],
  :password => ENV["HTTP_BASIC_PASSWORD"], except: [:index]

  
  def show
   @count_product = Product.all 
   @count_category = Category.all
  end
end


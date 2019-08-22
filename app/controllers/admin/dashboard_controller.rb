class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"],
  :password => ENV["HTTP_BASIC_PASSWORD"], except:[ :index]

  
  def show
  end
end

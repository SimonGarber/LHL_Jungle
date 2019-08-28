require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  it "validates when they see all products" do

    visit root_path 
  end
    # DEBUG / VERIFY
    save_screenshot
  end

 

    


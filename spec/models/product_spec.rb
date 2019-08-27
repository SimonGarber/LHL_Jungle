require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid when all fields validate" do
      @category = Category.new
      @product = Product.new 
      @product.name = 'name'
      @product.price = 1
      @product.quantity = 1
      @product.category = @category
      expect(@product).to be_valid
    end
    it "is valid when price is present" do
      @category = Category.new
      @product = Product.new
      @product.name = 'name'
      @product.price = nil
      @product.quantity = 1
      @product.category = @category
      expect(@product).to_not be_valid
    end
    it "is valid when quantity is present" do
      @category = Category.new
      @product = Product.new
      @product.name = 'name'
      @product.price = 1
      @product.quantity = nil
      @product.category = @category
      expect(@product).to_not be_valid
    end
    it "is valid when category is present" do
      @category = Category.new
      @product = Product.new
      @product.name = 'name'
      @product.price = 1
      @product.quantity = 1
      @product.category = nil
      expect(@product).to_not be_valid
    end
    it "is valid when name is present" do
      @category = Category.new
      @product = Product.new
      @product.name = nil
      @product.price = 1
      @product.quantity = 1
      @product.category = @category
      expect(@product).to_not be_valid
    end
  end
end

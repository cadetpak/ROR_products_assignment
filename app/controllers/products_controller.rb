class ProductsController < ApplicationController

# Page that displays all products & available actions
def index
  # Selects all data in Product model, and assigns @products variable
  # @products is now usable in index.html.erb (which is automatically loaded)
  @products = Product.all 
  # NOTE: Do not need to declare @categories, because Product & Category relationship exists can call @product.category.name to show Category Name!
end

# Page to create new product
def new
  # @categories is now usable in new.html.erb which is automatically loaded
  @categories = Category.all
end

#Action to create new product
def create
  # YOU MUST FIND the category by ID first and then use that in Product.new
  # If not, will interpret ID as a string!!!
  # product_params gathers user input in form
  categoryid = Category.find(product_params[:category])
  @product = Product.new(name: product_params[:name], description: product_params[:description], pricing: product_params[:pricing], category: categoryid)
  # if input passes validations and saves product
  if @product.save
  	redirect_to action: 'index'
  else
  	# flash[:errors] is available in views/layouts/application.html.erb
  	flash[:errors] = @product.errors.full_messages
  	redirect_to products_new_path
  end 
end

# Page to show one product
def show
  # @product variable holds data on Product with ID passed in from URL
  @product = Product.find(params[:id])
  # @comments holds all comments with the Product ID passed in URL
  @comments = Product.find(params[:id]).comments
  # automatically loads show.html.erb
end

# Page to edit one product
def edit
  #creates @product variable that holds data on Product with ID passed in from URL
  @product = Product.find(params[:id])
  #creates @categories variable that holds dat on ALL categories
  @categories = Category.all
  #automatically loads edit.html.erb
end

#Action to update one product 
def update
  # Just like 'create' method, you MUST first find the category by ID and update using category1 variable
  # If not, will interpret product_params[:category] as a string!
  category1 = Category.find(product_params[:category])
  product1 = Product.find(params[:id])
  product1.update(name: product_params[:name], description: product_params[:description], pricing: product_params[:pricing], category: category1)
  redirect_to '/products'
end

#Action to destroy one product
def destroy
  # Destroy from db the Product with ID passed in from URL
  Product.find(params[:id]).destroy
  redirect_to '/products'
end

private
def product_params
  params.require(:product).permit(:name, :description, :pricing, :category)
end

end

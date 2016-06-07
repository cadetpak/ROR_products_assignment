class CommentsController < ApplicationController
#Page that displays all comments
def index
  #@comments variable holds ALL comments in database
  @comments = Comment.all 
  #automatically loads comments/index.html.erb
end

#Action that adds new comment
def create
  # NEED to set product_id by finding it first or else will interpret as string
  # params[:comment][:product] = comment[product] that was set up in form
  product_id = Product.find(params[:comment][:product])
  Comment.create(comment: params[:comment][:comment], product: product_id)
  # After comment is created, redirects back to that product's show page
  # id is gathered from the hidden input ':product'
  redirect_to "/products/#{params[:comment][:product]}"
end

end
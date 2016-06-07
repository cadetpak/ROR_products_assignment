Rails.application.routes.draw do
# using restful routes ... 

# [ PRODUCTS CONTROLLER ]
# GET METHODS
# displays all products
get '/products' => 'products#index'
# displays page to create new product
get '/products/new' => 'products#new'
# displays page for one product
get '/products/:id' => 'products#show'
# displays edit page for one product
get '/products/:id/edit' => 'products#edit'


# POST METHODS
#creates new product
post '/products' => 'products#create'

# PATCH METHOD 
#updates one product
patch '/products/:id' => 'products#update'

# DELETE METHOD
#destroys one product 
delete '/products/:id' => 'products#destroy'


# [ COMMENTS CONTROLLER ] 
# GET METHODS
#displays all comments
get '/comments' => 'comments#index'

# POST METHODS
#creates new comment
post '/comments' => 'comments#create'
end

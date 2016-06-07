class Category < ActiveRecord::Base
  # dependent destroy makes sure that when product is destroyed, the category_id for that product is also destroyed
  has_many :products, dependent: :destroy
end

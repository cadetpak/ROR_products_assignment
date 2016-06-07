class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      # created with: rails g model Comment comment:text product:references
      # this automatically sets class Comment to belong_to product 
      # YOU need to set class Product to has_many comments
      t.references :product, index: true

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :pricing
      # Manually added this, because Product belongs to one category
      # same as: rails g model Product references:category 
      t.references :category, index: true


      t.timestamps
    end
  end
end

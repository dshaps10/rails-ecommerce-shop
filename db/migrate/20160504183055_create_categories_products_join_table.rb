class CreateCategoriesProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
    end
  end
end

class AddImagelinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :img_link, :string
  end
end

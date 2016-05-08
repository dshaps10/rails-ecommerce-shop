class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :last_name
      t.string :first_name


      t.timestamps null: false
    end
  end
end

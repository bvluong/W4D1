class AddUserColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_name, :string,  null: false, unique: true
  end
end

class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :gender, :string
    add_column :users, :birth_day, :datetime
    add_column :users, :city, :string
    add_column :users, :phone_no, :string
    add_column :users, :info, :string
    add_column :users, :about, :string
  end
end

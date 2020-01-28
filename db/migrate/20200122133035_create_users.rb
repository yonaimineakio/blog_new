class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null=> false
      t.string :email, :null=>false
      t.integer :admin?, :default=>0
    end
  end
end

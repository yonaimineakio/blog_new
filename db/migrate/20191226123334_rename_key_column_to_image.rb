class RenameKeyColumnToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :key, :image 
  end
end

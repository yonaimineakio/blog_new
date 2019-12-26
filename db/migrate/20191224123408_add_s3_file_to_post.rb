class AddS3FileToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :key, :string
  end
end

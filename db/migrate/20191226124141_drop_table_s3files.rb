class DropTableS3files < ActiveRecord::Migration[5.2]
  def change
    drop_table :s3files
  end
end

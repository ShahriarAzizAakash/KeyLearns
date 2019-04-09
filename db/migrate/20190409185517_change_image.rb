class ChangeImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Image, :image
  end
end

class AddAuthorToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :author, :string
  end
end

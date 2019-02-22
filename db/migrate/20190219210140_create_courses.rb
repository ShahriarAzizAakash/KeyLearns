class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :author
      t.belongs_to :user
      
      t.timestamps
    end
  end
end

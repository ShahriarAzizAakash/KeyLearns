class AddFeaturedImageToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :featuredImage, :string
  end
end

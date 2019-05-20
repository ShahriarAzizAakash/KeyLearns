class AddRequirementsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :requirements, :string
  end
end

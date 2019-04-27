class AddNumofenrollmentsToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :numofenrollments, :integer
  end
end

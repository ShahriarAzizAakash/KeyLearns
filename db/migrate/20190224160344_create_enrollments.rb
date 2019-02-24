class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :course_title
      t.string :username

      t.timestamps
    end
  end
end

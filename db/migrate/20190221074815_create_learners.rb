class CreateLearners < ActiveRecord::Migration[5.2]
  def change
    create_table :learners do |t|

      t.timestamps
    end
  end
end

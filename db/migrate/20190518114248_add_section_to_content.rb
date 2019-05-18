class AddSectionToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :section, :string
  end
end

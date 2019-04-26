class AddAttachmentsToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :attachments, :string
  end
end

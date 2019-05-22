class RemoveAuthTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :auth_token, :string
  end
end

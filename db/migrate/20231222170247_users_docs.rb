class UsersDocs < ActiveRecord::Migration[7.1]
  def change
    add_column :users_docs, :title, :string
  end
end

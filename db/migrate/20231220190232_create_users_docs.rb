class CreateUsersDocs < ActiveRecord::Migration[7.1]
  def change
    create_table :users_docs do |t|
      t.string :username
      t.text :body
      t.references :doc, null: false, foreign_key: true

      t.timestamps
    end
  end
end

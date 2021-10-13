class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :synopsis, null: false
      t.string :impression, null: false

      t.timestamps
    end
  end
end

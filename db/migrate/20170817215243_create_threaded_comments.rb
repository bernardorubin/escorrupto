class CreateThreadedComments < ActiveRecord::Migration[5.1]
  def change
    create_table :threaded_comments do |t|
      t.text :body
      t.string :image
      t.boolean :escorrupto
      t.integer :likes
      t.integer :dislikes
      t.references :main_comment, foreign_key: true

      t.timestamps
    end
  end
end

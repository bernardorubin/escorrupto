class CreateMainComments < ActiveRecord::Migration[5.1]
  def change
    create_table :main_comments do |t|
      t.text :body
      t.string :image
      t.boolean :escorrupto
      t.integer :likes
      t.integer :dislikes
      t.references :target, foreign_key: true

      t.timestamps
    end
  end
end

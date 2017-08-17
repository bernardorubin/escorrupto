class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :image
      t.boolean :escorrupto
      t.integer :likes
      t.integer :dislikes
      t.references :person, foreign_key: true, index: true

      t.timestamps
    end
  end
end

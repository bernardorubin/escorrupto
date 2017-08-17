class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :profession
      t.string :position
      t.integer :esintegro
      t.integer :escorrupto

      t.timestamps
    end
  end
end

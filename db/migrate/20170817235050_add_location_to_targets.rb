class AddLocationToTargets < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :location, :string
  end
end

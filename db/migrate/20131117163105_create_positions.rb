class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.text :title
      t.integer :rank

      t.timestamps
    end
  end
end

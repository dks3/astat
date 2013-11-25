class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer   :person_id
      t.integer   :subdivision_id
      t.integer   :function_id

      t.timestamps
    end
  end
end

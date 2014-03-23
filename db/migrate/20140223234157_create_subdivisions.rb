class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.text     :title,                    null: false
      t.integer  :subdivision_id

      t.timestamps
    end
  end
end

class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.text :title

      t.timestamps
    end
    add_index :subdivisions, :title
  end
end

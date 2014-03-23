class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :number,                               null: false
      t.integer :channels, limit: 2, default: 1,      null: false
      t.text    :file
      t.boolean :autoanswer
      t.timestamps
    end
  end
end

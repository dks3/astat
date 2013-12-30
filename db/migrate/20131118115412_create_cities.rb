class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :number
      t.integer :channels
      t.text    :file
      t.boolean :autoanswer
      t.timestamps
    end
  end
end

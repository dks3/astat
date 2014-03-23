class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.text :title,           null: false
      t.integer  :rank
      t.timestamps
    end
  end
end

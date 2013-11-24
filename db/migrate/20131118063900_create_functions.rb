class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.text :title
      t.integer  :rank
      t.timestamps
    end
  end
end

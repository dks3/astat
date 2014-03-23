class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end

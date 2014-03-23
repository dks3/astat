class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.integer :tariff_id
      t.integer :city_code
      t.integer :country_code

      t.timestamps
    end
  end
end

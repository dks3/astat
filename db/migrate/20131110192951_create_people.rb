class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :surname
      t.string  :firstname
      t.string  :patronymic
      t.integer :sip_user_id
      t.integer :city_id
      t.boolean :status

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :surname,                   null: false
      t.string  :firstname,                 null: false
      t.string  :patronymic
      t.integer :sip_user_id
      t.integer :subdivision_id
      t.integer :function_id
      t.integer :city_id
      t.boolean :status,    default: false, null: false

      t.timestamps
    end
  end
end

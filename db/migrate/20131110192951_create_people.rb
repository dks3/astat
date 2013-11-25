class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :surname
      t.string  :firstname
      t.string  :patronymic
      t.integer :sip_user_id
<<<<<<< HEAD
      t.integer :subdivision_id
      t.integer :function_id
=======
>>>>>>> cbfd00219ef1cb36cedf1218f6d4c45963597e33
      t.integer :city_id
      t.boolean :status

      t.timestamps
    end
  end
end

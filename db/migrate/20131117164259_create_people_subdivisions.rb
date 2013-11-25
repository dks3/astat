class CreatePeopleSubdivisions < ActiveRecord::Migration
  def change
    create_table :people_subdivisions, id: false do |t|
      t.integer :person_id
      t.integer :subdivision_id
      #t.integer :position_id
    end
  end
end

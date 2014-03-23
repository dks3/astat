class Cdr < ActiveRecord::Base
  self.table_name = "cdr"
  #belongs_to :city, ->(x){ where("cities.number=?",x.src.to_i)}, primary_key: :number, foreign_key: :src 
  #belongs_to :person, foreign_key: "src", primary_key: ''#,->(x){includes(:city).where("cities.number=?", x.src.gsub(/^495/,''))}

end

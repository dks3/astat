class Subdivision < ActiveRecord::Base
  has_many :positions#, ->{includes(:function).order('functions.rank')}
  has_many :ordered_positions, ->{includes(:function, person:[:city, :sip_user]).order('functions.rank')}, class_name: Position
  has_many :people, through: :positions
  has_many :functions, through: :positions

def calls(cdr)
  numbers=people.includes(:city).all.map{|p| p.city.try(:number)}.compact
  buf=numbers.map{|x| "495#{x}"}
  numbers += buf
  numbers+=people.includes(:sip_user).all.map{|p| p.sip_user.try(:name)}.compact
  #Cdr.where(src: numbers.map{|x| "495#{x}"})
  cdr.where("src IN (?) OR dst IN (?)",numbers.map{|x| "#{x}"},numbers.map{|x| "#{x}"}).order(:calldate)

end
end

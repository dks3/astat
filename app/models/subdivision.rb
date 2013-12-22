class Subdivision < ActiveRecord::Base
  has_many :positions#, ->{includes(:function).order('functions.rank')}
  has_many :ordered_positions, ->{includes(:function).order('functions.rank')}, class_name: Position
  has_many :people, through: :positions
  has_many :functions, ->{order('functions.rank')}, through: :positions

def calls
  numbers=people.includes(:city).all.map{|p| p.city.try(:number)}.compact
  puts "-----------------------------------------------"
  puts numbers.inspect
  puts "-----------------------------------------------"
  #Cdr.where(src: numbers.map{|x| "495#{x}"})
  Cdr.where("src in (?) or dst in (?)",numbers.map{|x| "495#{x}"},numbers.map{|x| "495#{x}"}).order("billsec")
end
end

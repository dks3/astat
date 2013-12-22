class Subdivision < ActiveRecord::Base
  has_many :positions#, ->{includes(:function).order('functions.rank')}
  has_many :ordered_positions, ->{includes(:function).order('functions.rank')}, class_name: Position
  has_many :people, through: :positions
  has_many :functions, ->{order('functions.rank')}, through: :positions

def calls
  numbers=people.includes(:city).all.map{|p| p.city.try(:number)}.compact
  Cdr.where(src: numbers.map{|x| "495#{x}"})
end
end

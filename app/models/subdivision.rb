class Subdivision < ActiveRecord::Base
  has_many :positions, ->{includes(:function).order('functions.rank')}
  has_many :people, through: :positions
  has_many :functions, ->{order('functions.rank')}, through: :positions
end

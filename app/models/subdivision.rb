class Subdivision < ActiveRecord::Base
  has_many :positions
  has_many :people, through: :positions
  has_many :functions, through: :positions
end

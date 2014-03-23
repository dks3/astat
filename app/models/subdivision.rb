class Subdivision < ActiveRecord::Base
  has_many :subdivisions
  belongs_to :subdivision
  has_many :people, through: :positions
  has_many :functions, through: :positions
  has_many :positions
end

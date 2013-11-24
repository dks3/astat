class Function < ActiveRecord::Base
  has_many :positions
  has_many :people, through: :positions
  has_many :subdivisions, through: :positions
end

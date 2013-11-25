class Subdivision < ActiveRecord::Base
<<<<<<< HEAD
  has_many :positions
  has_many :people, through: :positions
  has_many :functions, through: :positions
=======
  has_and_belongs_to_many :people
>>>>>>> cbfd00219ef1cb36cedf1218f6d4c45963597e33
end

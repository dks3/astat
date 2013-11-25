class Position < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :subdivision
  belongs_to :function
  belongs_to :person

=======
  has_and_belongs_to_many :persons
>>>>>>> cbfd00219ef1cb36cedf1218f6d4c45963597e33
end

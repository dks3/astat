class Person < ActiveRecord::Base
<<<<<<< HEAD
  has_many :positions, :dependent => :destroy
  has_many :functions, through: :positions
  has_many :subdivisions, through: :positions
  belongs_to :sip_user
  belongs_to :city
  accepts_nested_attributes_for :positions, reject_if: :all_blank, :allow_destroy => true


=======
  has_and_belongs_to_many :subdivisions
  has_and_belongs_to_many :positions
  belongs_to              :sip_user
>>>>>>> cbfd00219ef1cb36cedf1218f6d4c45963597e33
end

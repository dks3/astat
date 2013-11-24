class Person < ActiveRecord::Base
  has_many :positions, :dependent => :destroy
  has_many :functions, through: :positions
  has_many :subdivisions, through: :positions
  belongs_to :sip_user
  belongs_to :city
  accepts_nested_attributes_for :positions, reject_if: :all_blank, :allow_destroy => true


end

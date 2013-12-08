class Person < ActiveRecord::Base
  has_many :positions, :dependent => :destroy
  has_many :functions, through: :positions
  has_many :subdivisions, through: :positions
  belongs_to :sip_user, :dependent => :destroy
  belongs_to :city, :dependent => :destroy
  accepts_nested_attributes_for :positions, reject_if: :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :city, :allow_destroy => true
  accepts_nested_attributes_for :sip_user, :allow_destroy => true
  validates :surname, :firstname, presence: true
  validates_associated :positions
end

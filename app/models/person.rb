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



  def calls(cdr)
    numbers = []
    numbers << city.try(:number)
    numbers << "495#{numbers[0]}"
    numbers << sip_user.try(:name)
    cdr.where("src in (?) or dst in (?)",numbers.map{|x| "#{x}"},numbers.map{|x| "#{x}"})
  end
end

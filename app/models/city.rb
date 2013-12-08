class City < ActiveRecord::Base
  has_one :person
  validates :number, presence: true
end

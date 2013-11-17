class Person < ActiveRecord::Base
  has_and_belongs_to_many :subdivisions
  has_and_belongs_to_many :positions
  belongs_to              :sip_user
end

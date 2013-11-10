class Person < ActiveRecord::Base
  belongs_to :subdivision
  belongs_to :sip_user
end

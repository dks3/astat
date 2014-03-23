class SipUser < ActiveRecord::Base
  has_one :person

  validates :name, :callerid, :username, presence: true, uniqueness: true
end

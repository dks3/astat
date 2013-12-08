class Position < ActiveRecord::Base
  belongs_to :subdivision
  belongs_to :function
  belongs_to :person
  validates :subdivision_id, :function_id, presence: true
end

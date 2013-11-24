class Position < ActiveRecord::Base
  belongs_to :subdivision
  belongs_to :function
  belongs_to :person

end

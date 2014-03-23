class Tariff < ActiveRecord::Base
  has_many :codes, :dependent => :destroy
  accepts_nested_attributes_for :codes, reject_if: :all_blank, :allow_destroy => true

end

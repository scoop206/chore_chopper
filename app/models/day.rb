class Day < ActiveRecord::Base
  default_scope :order => "day_of_week ASC"
end

class ChoresFamilyMember < ActiveRecord::Base
  set_table_name 'chores_family_members'
  belongs_to :chore
  belongs_to :family
  
  # need a function here to allow us to find records via home controller
  
end

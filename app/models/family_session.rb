class FamilySession < Authlogic::Session::Base
  
  # http://github.com/binarylogic/authlogic/issues/issue/101/#comment_142986
  def to_key
   new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
end
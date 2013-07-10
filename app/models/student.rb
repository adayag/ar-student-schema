require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true, :format => { :with => /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/ }
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validates :phone, :format => { :with => /\d{1,2}?[\s-.]?\d{3}?[\s-.]?\d{3}[\s-.]\d{4}[\s-.]x?\d{4}?/ }

 def name
  "#{first_name} #{last_name}"
  end
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end# implement your Student model here
end

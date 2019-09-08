class Author < ActiveRecord::Base
  has_many :posts
validates :name, presence: true
validates :name, uniqueness: true

# validates :phone_number, numericality: {only_integer: true}
validates :phone_number, length: {is: 10}




#name unique, present
# phone_number is 10 digits



end

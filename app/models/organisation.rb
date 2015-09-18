class Organisation < ActiveRecord::Base
  include Tokenable
  has_many :receipts  
end

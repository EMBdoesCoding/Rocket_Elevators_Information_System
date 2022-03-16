class Address < ApplicationRecord
    has_one :building 
    has_one :customer 
end

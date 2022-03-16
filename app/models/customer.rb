class Customer < ApplicationRecord
    has_many :buildings
    has_one :address 
    belongs_to :user
end

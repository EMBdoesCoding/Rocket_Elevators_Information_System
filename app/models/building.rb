class Building < ApplicationRecord
    has_one :building_detail
    has_one :address
    has_many :batteries
    belongs_to :customer
end

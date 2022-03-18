class Building < ApplicationRecord
    has_one :building_detail
    belongs_to :address
    has_many :batteries
    belongs_to :customer
end

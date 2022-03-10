class QuotesController < ApplicationController
  def create
    q = Quote.new
    q.department = 'goblble'
    q.number_of_floors
    q.number_of_companies
    q.number_of_basements
    q.number_of_parking_spots
    q.number_of_elevators
    q.number_of_corporations
    q.maximum_occupancy
    q.number_of_apartments
    q.business_hours
    q.service_grade
    q.elevator_amount
    q.elevator_unit_price
    q.elevator_total_price
    q.installation_fees
    q.final_price
    q.save
  end
end

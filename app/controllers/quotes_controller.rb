class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    quote = Quote.create!(
      department: params[:department],
      number_of_floors: params[:number_of_floors],
      number_of_companies: params[:number_of_companies],
      number_of_basements: params[:number_of_basements],
      number_of_parking_spots: params[:number_of_parking_spots],
      number_of_elevators: params[:number_of_elevators],
      number_of_corporations: params[:number_of_corporations],
      maximum_occupancy: params[:maximum_occupancy],
      number_of_apartments: params[:number_of_apartments],
      business_hours: params[:business_hours],
      service_grade: params[:service_grade],
      elevator_amount: params[:elevator_amount],
      elevator_unit_price: params[:elevator_unit_price], 
      elevator_total_price: params[:elevator_total_price],
      installation_fees: params[:installation_fees],
      final_price: params[:final_price],
      contact_name: params[:contact_name],
      company_name: params[:company_name],
      contact_email: params[:contact_email],
      


    )
    
    redirect_to('/quote')

  end
end

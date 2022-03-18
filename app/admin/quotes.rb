ActiveAdmin.register Quote do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :department, :number_of_floors, :number_of_companies, :number_of_basements, :number_of_parking_spots, :number_of_elevators, :number_of_corporations, :maximum_occupancy, :number_of_apartments, :business_hours, :service_grade, :elevator_amount, :elevator_unit_price, :elevator_total_price, :installation_fees, :final_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:department, :number_of_floors, :number_of_companies, :number_of_basements, :number_of_parking_spots, :number_of_elevators, :number_of_corporations, :maximum_occupancy, :number_of_apartments, :business_hours, :service_grade, :elevator_amount, :elevator_unit_price, :elevator_total_price, :installation_fees, :final_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

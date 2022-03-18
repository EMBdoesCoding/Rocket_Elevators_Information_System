ActiveAdmin.register Battery do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :building_type, :status, :commission_date, :last_inspection_date, :certificate_of_operations, :information, :notes, :building_id, :employee_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_type, :status, :commission_date, :last_inspection_date, :certificate_of_operations, :information, :notes, :building_id, :employee_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

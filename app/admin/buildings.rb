ActiveAdmin.register Building do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :building_administrator_name, :building_administrator_email, :building_administrator_phone, :tech_contact_name, :tech_contact_email, :tech_contact_phone, :customer_id, :address_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_administrator_name, :building_administrator_email, :building_administrator_phone, :tech_contact_name, :tech_contact_email, :tech_contact_phone, :customer_id, :address_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

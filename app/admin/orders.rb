ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :order_date, :order_subtotal, :order_tax_rate, :order_total, :order_state, :order_address, :order_postal_code, :order_province, :order_tracking_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_date, :order_subtotal, :order_tax_rate, :order_total, :order_state, :order_address, :order_postal_code, :order_province, :order_tracking_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

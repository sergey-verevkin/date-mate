ActiveAdmin.register SignificantDate do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :day, :month, :year, :variety, :datable_type, :datable_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:day, :month, :year, :variety, :datable_type, :datable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # config.sort_order = 'month_asc_and_day_asc'
end

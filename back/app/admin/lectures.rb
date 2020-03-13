ActiveAdmin.register Lecture do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :professor_name, :period, :day_of_week, :sem, :university_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :professor_name, :period, :day_of_week, :sem, :university_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

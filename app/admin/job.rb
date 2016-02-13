ActiveAdmin.register Job do
	menu priority: 7
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :company_id, :title,:location_id,:job_type_id,:postal_code,:industry_id,:salary_type,:salary_offered,:job_description,:contact_person_name,:contact_person_phone,:contact_person_email,:is_online
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end

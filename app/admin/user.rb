ActiveAdmin.register User do
	menu priority: 4
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :qualification_id, :name, :email, :phone, :password_digest, :activation_digest, :remember_digest, :activated_at, :reset_digest, :reset_sent_at
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end

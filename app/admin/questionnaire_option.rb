ActiveAdmin.register QuestionnaireOption do
	menu label: "Options", parent: "Questionnaires"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :questionnaire_id, :option, :isRight
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end

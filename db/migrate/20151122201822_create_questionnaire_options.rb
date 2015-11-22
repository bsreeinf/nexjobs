class CreateQuestionnaireOptions < ActiveRecord::Migration
  def change
    create_table :questionnaire_options do |t|
    	t.references :questionnaire

		t.string :option
		t.boolean :isRight

		t.timestamps null: false
    end
  end
end

class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
    	t.references :job

    	t.string :quesetion

      t.timestamps null: false
    end
  end
end

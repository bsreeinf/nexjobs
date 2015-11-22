class CreateQuestionnaireResults < ActiveRecord::Migration
  def change
    create_table :questionnaire_results do |t|
      t.belongs_to :user, index: true
      t.belongs_to :job, index: true

      t.integer :score
      t.boolean :passed

      t.timestamps null: false
    end
  end
end

class CreateSavedAppliedJobs < ActiveRecord::Migration
  def change
    create_table :saved_applied_jobs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :job, index: true
      
      t.string :status

      t.timestamps null: false
    end
  end
end

class CreateSavedAppliedJobs < ActiveRecord::Migration
  def change
    create_table :saved_applied_jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.references :job_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.references :company
    	t.references :industry
    	t.references :location
    	t.references :job_type

		t.string :title
		t.string :job_description
		t.string :postal_code
		t.string :salary_type
		t.integer :salary_offered

		t.string :contact_person_name
		t.string :contact_person_phone
		t.string :contact_person_email

		t.boolean :is_online

		t.timestamps null: false
    end
  end
end

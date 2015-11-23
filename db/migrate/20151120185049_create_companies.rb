class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
		t.string :name
		t.string :phone
		t.string :email
		t.string :pan
		t.string :address
		t.boolean :is_verified

    	t.string :password_digest
		t.string :activation_digest
		t.string :remember_digest    
		t.datetime :activated_at
		t.string :reset_digest
		t.datetime :reset_sent_at

      t.timestamps null: false
    end
  end
end

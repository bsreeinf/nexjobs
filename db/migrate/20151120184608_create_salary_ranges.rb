class CreateSalaryRanges < ActiveRecord::Migration
  def change
    create_table :salary_ranges do |t|
    	t.integer :min_amount
    	t.integer :max_amount
		t.timestamps null: false
    end
  end
end

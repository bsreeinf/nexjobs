class CreateUserQualifications < ActiveRecord::Migration
  def change
    create_table :user_qualifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :qualification, index: true

      t.timestamps null: false
    end
  end
end

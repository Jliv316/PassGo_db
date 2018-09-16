class CreateUserCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_companies do |t|
      t.integer :points
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
    end
  end
end

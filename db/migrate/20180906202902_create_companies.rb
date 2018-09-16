class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :industry
      t.float :lat
      t.float :lng
    end
  end
end

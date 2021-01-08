class CreateHealthcareProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :healthcareproviders do |t|
      t.string :org_name
    end
  end
end
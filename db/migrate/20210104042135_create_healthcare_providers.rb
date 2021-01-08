class CreateHealthcareProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :healthcare_providers do |t|
      t.string :org_name
    end
  end
end
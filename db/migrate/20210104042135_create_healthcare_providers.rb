class CreateHealthcareProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :healthcareproviders do |t|
      t.string :name
    end
  end
end

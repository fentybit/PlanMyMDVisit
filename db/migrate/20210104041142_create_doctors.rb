class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.integer :healthcareprovider_id
      t.integer :user_id
      t.string :title
    end
  end
end

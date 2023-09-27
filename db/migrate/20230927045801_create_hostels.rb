class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :title
      t.text :desc
      t.string :landmark
      t.text :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.text :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

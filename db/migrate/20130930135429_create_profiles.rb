class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.text :picture
      t.date :birth

      t.timestamps
    end
  end
end

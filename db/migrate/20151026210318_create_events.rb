class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :timing
      t.string :location
      t.string :state
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

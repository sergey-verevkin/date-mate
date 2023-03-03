class CreateSignificantDates < ActiveRecord::Migration[7.0]
  def change
    create_table :significant_dates do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :variety
      t.references :datable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

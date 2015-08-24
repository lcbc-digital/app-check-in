class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :campus
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :check_ins, :campus
  end
end

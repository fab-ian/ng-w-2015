class CreateTuitions < ActiveRecord::Migration
  def change
    create_table :tuitions do |t|
      t.string :period
      t.date :payment
      t.boolean :paid
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

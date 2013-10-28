class CreateCalculationRequests < ActiveRecord::Migration
  def change
    create_table :calculation_requests do |t|
      t.string :package
      t.string :function
      t.string :data

      t.timestamps
    end
  end
end

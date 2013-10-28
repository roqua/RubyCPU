class CreateOcpuCallbacks < ActiveRecord::Migration
  def change
    create_table :ocpu_callbacks do |t|
      t.string :value
      t.string :stdout
      t.string :source
      t.string :console
      t.string :info

      t.timestamps
    end
  end
end

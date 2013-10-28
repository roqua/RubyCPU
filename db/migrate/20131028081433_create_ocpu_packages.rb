class CreateOcpuPackages < ActiveRecord::Migration
  def change
    create_table :ocpu_packages do |t|
      t.string :name

      t.timestamps
    end
  end
end

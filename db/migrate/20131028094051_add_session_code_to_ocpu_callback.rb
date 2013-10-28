class AddSessionCodeToOcpuCallback < ActiveRecord::Migration
  def change
    add_column :ocpu_callbacks, :session_code, :string
  end
end

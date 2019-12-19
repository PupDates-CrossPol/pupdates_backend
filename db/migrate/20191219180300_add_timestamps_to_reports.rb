class AddTimestampsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :created_at, :datetime, null: false
    add_column :reports, :updated_at, :datetime, null: false
  end
end

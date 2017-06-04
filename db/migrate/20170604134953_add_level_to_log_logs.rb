class AddLevelToLogLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :log_logs, :level, :integer, default: 0
  end
end

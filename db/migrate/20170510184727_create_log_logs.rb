class CreateLogLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :log_logs do |t|
      t.belongs_to :project, foreign_key: true
      t.string :message
      t.json :data

      t.timestamps
    end
  end
end

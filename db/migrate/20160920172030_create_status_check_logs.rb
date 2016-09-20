class CreateStatusCheckLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :status_check_logs do |t|
      t.text :response
      t.boolean :is_fail
      t.belongs_to :status_check, foreign_key: true

      t.timestamps
    end
  end
end

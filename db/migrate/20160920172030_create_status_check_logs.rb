class CreateStatusCheckLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :url_test_results do |t|
      t.integer :response_code
      t.text :response_headers
      t.boolean :is_fail
      t.belongs_to :url_test, foreign_key: true

      t.timestamps
    end
  end
end

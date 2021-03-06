class CreateStatusChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :url_tests do |t|
      t.belongs_to :project, foreign_key: true
      t.string :url
      t.integer :expected_response_code

      t.timestamps
    end
  end
end

class AddExpectedResponseCodeToUrlTestResult < ActiveRecord::Migration[5.0]
  def change
    add_column :url_test_results, :expected_response_code, :integer
  end
end

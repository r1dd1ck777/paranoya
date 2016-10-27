class AddUrlToUrlTestResults < ActiveRecord::Migration[5.0]
  def change
    add_column :url_test_results, :url, :string
  end
end

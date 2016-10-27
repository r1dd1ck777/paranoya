ActiveAdmin.register UrlTestResult do
  actions :index, :show

  index do
    column :id
    column :created_at
    column :url do |url_test_result|
      url_test_result.url_test.url
    end
    column :expected_response_code
    column :response_code
    column :is_fail
    actions
  end

end

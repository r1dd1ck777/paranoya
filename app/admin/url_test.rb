ActiveAdmin.register UrlTest do
  permit_params :expected_response_code, :project_id, :url

  filter :project
  filter :url
end

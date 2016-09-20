ActiveAdmin.register StatusCheck do
  permit_params :status, :project_id, :url
end

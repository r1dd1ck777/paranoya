ActiveAdmin.register ::Log::Log do
  permit_params :message, :project_id
end

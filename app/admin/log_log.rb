ActiveAdmin.register ::Log::Log do
  permit_params :message, :project_id, :data, :level

  collection_action :destroy_all, method: :get do
    ::Log::Log.destroy_all
    redirect_to admin_log_logs_path
  end
end

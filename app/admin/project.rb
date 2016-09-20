ActiveAdmin.register Project do
  permit_params :name, :user_id, :url
end

ActiveAdmin.register Project do
  permit_params :name, :url, user_ids: []

  form do |f|
    inputs :name, :url, :users
    actions
  end

  show do
    attributes_table do
      row :name
      row :url
      row 'Users' do
        table_for resource.users do
          column :id
          column :email
          column :phone
          column :role
        end
      end
      # active_admin_comments
    end
  end
end

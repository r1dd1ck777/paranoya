ActiveAdmin.register User do
  permit_params :email, :phone, :password, :password_confirmation
end

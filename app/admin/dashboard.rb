ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       # span I18n.t("active_admin.dashboard_welcome.welcome")
  #       # small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #       h1 "Welcome"
  #       div "To create your first test do the following:"
  #       br
  #       div do
  #         div "1. Create new User(s) to handle notifications (SMS & email) if something broken"
  #         div "2. Create new Project (dont forget to attach your user to it)"
  #         div "3. Create new Url Test"
  #         div "4. Relax. Now we check your Url every minute."
  #       end
  #       br
  #       div "May the Force be with you"
  #       img src: 'http://vignette2.wikia.nocookie.net/starwars/images/d/d6/Yoda_SWSB.png/revision/latest?cb=20150206140125', width: 50
  #     end
  #   end
  #
  #   # Here is an example of a simple dashboard with columns and panels.
  #   #
  #   columns do
  #     column do
  #       panel "Recent Url Tests" do
  #         ul do
  #           UrlTestResult.recent(10).map do |utr|
  #             li do
  #               link_to(utr.url, admin_url_test_result_path(utr)) + ' ' + (utr.is_fail ? 'fail' : 'ok')
  #             end
  #           end
  #         end
  #       end
  #     end
  #
  #     column do
  #       panel "Recent Users" do
  #         ul do
  #           User.recent(10).map do |resource|
  #             li do
  #               link_to(resource.email, admin_project_path(resource))
  #             end
  #           end
  #         end
  #       end
  #     end
  #
  #     column do
  #       panel "Recent Projects" do
  #         ul do
  #           Project.recent(10).map do |resource|
  #             li do
  #               link_to(resource.name, admin_project_path(resource))
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end # content
end

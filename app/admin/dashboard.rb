ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Statistic" do
          ul do
            li "Users: #{User.count}"
            li "Posts: #{Storytime::Post.count}"
            li "Subscriptions: #{Storytime::Subscription.count}"
          end
        end
      end
      column do
        panel "Recent Users" do
          ul do
            User.limit(10).map do |user|
              li link_to(user.email, admin_user_path(user)) +
              " | #{user.sign_in_count} times" +
              " | #{time_ago_in_words(user.last_sign_in_at)} ago"
            end.join(' ').html_safe
          end
        end
      end
      column do
        panel "Resources" do
          ul do
            li link_to('CMS: Storytime', 'https://github.com/CultivateLabs/storytime', target: '_blank')
            li link_to('Theme: Paper Kit 2 Pro', 'http://demos.creative-tim.com/paper-kit-2-pro/index.html', target: '_blank')
            li link_to('Icons: Fontawesome', 'http://fontawesome.io/icons/', target: '_blank')
            li link_to('Icons: nucleo', 'http://demos.creative-tim.com/paper-kit-2-pro/nucleo-icons-demo.html', target: '_blank')
            li link_to('Admin: Active Admin', 'https://activeadmin.info/documentation.html', target: '_blank')
            li link_to('FB: Page plugin', 'https://developers.facebook.com/docs/plugins/page-plugin', target: '_blank')
          end
        end
      end
    end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Storytime: #{link_to('admin', '/storytime')}".html_safe
        small 'Banana Beer'
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

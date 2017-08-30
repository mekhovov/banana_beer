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
              link_to(user.email, admin_user_path(user)) +
              " | #{time_ago_in_words(user.updated_at)} ago"
            end.join(' ').html_safe
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

# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    dates = UpcomingDates.new.call

    panel "Today" do
      dates[:today].each do |date|
        li { date.display_name }
      end
    end

    panel "Tomorrow" do
      dates[:tomorrow].each do |date|
        li { date.display_name }
      end
    end

    panel "This month" do
      dates[:this_month].each do |date|
        li { date.display_name }
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

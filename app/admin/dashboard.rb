# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    dates = UpcomingDates.new.call

    panel "Today" do
      table_for dates[:today] do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
      end
    end

    panel "Tomorrow" do
      table_for dates[:tomorrow] do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
      end
    end

    panel "Upcoming month" do
      table_for dates[:this_month] do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
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

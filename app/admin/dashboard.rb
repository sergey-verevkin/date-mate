# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    dates = UpcomingDates.new

    # TODO: add color warning
    panel "Past month dates" do
      table_for dates.past_month_dates do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
      end
    end

    panel "Today" do
      table_for dates.today_dates do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
      end
    end

    panel "Tomorrow" do
      table_for dates.tomorrow_dates do
        column(:type) { |date| status_tag date.variety }
        column :happen_on
        column :datable
      end
    end

    panel "Upcoming month" do
      table_for dates.this_month_dates do
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

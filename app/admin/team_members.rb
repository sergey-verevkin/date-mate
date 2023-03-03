ActiveAdmin.register TeamMember do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :first_name, :last_name, :preferred_name, :slack_name,
                birthday_attributes: [:id, :day, :month, :year],
                anniversary_attributes: [:id, :day, :month, :year]

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :preferred_name
    column :slack_name
    # column :birthday
    # column :anniversary
    actions
  end

  controller do
    def resource
      super.tap do |record|
        record.build_birthday if record.birthday.blank?
        record.build_anniversary if record.anniversary.blank?
      end
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs

    f.has_many :birthday, heading: 'Birthday', class: 'class_for_inline_has_many_form',
               allow_destroy: false, new_record: false do |birthday_form|
      birthday_form.inputs :month, :day, :year
    end

    f.has_many :anniversary, heading: 'Anniversary', class: 'class_for_inline_has_many_form',
               allow_destroy: false, new_record: false do |anniversary_form|
      anniversary_form.inputs :month, :day, :year
    end

    f.actions
  end
end

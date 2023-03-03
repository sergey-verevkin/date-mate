class UpcomingDates
  attr_reader :form_date
  def initialize(form_date: Date.current)
    @form_date = form_date
  end

  def tomorrow_from_date
    form_date + 1.day
  end

  def call
    result = {}

    result[:today] = SignificantDate.natural_order.where(day: form_date.day, month: form_date.month).to_a
    result[:tomorrow] = SignificantDate.natural_order.where(day: tomorrow_from_date.day, month: tomorrow_from_date.month).to_a
    result[:this_month] = SignificantDate.natural_order.where(month: form_date.month).to_a

    result
  end
end

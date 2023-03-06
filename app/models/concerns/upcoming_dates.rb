class UpcomingDates
  attr_reader :form_date
  def initialize(form_date: Date.current)
    @form_date = form_date
  end

  def call
    {
      today: today_dates,
      tomorrow: tomorrow_dates,
      this_month: this_month_dates
    }
  end

  private

  def today_dates
    base_significant_dates.where(day: form_date.day, month: form_date.month)
  end

  def tomorrow_dates
    tomorrow_from_date = form_date + 1.day
    base_significant_dates.where(day: tomorrow_from_date.day, month: tomorrow_from_date.month)
  end

  def this_month_dates
    tomorrow_from_date = form_date + 2.day
    month_end_date = form_date + 1.month
    from_date_index = tomorrow_from_date.month * 100 + tomorrow_from_date.day
    to_date_index = month_end_date.month * 100 + month_end_date.day

    base_significant_dates.where("(month * 100 + day) BETWEEN ? AND ?", from_date_index, to_date_index)
  end

  def base_significant_dates
    SignificantDate.order(:month, :day)
  end
end

# frozen_string_literal: true

# Value object containing cronpieces
class Cron
  attr_reader :minute, :hour, :day_of_month, :month, :day_of_week, :filepath

  def initialize(*args)
    @minute = args[0]
    @hour = args[1]
    @day_of_month = args[2]
    @month = args[3]
    @day_of_week = args[4]
    @filepath = args[5]
  end
end

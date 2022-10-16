# frozen_string_literal: true

# Value object containing cronpieces
Cron = Struct.new(:minute, :hour, :day_of_month, :month, :day_of_week, :file)

# Value object containing cronpieces
class Cron < Struct.new(:minute, :hour, :day_of_month, :month, :day_of_week, :command)
end
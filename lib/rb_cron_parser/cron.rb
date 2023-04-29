# frozen_string_literal: true

#
# @attr_reader [String] hour
# @attr_reader day_of_month [String]
# @attr_reader month [String]
# @attr_reader day_of_week [String]
# @attr_reader filepath [String]
#
module RbCronParser
  # Value object containing cronpieces
  class Cron
    attr_reader :minute, :hour, :day_of_month, :month, :day_of_week, :filepath

    #
    # Constructor for Cron
    #
    # @param [Array<String>] *args Command line arguments parsed into an array
    #
    def initialize(*args)
      @minute = args[0]
      @hour = args[1]
      @day_of_month = args[2]
      @month = args[3]
      @day_of_week = args[4]
      @filepath = args[5]
    end
  end
end


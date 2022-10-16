# frozen_string_literal: true

require_relative './rules'
require_relative './interval_total'
require 'pry'

module RbCronParser
  # Module to parse cron fragments into possible values
  #
  # Author: Edward Heaver
  module Parser
    class << self
      include RbCronParser::Rules
      include RbCronParser::IntervalTotal

      # returns hash for each interval with the applicable periods
      def parse(cron)
        {
          minute: parse_data(cron.minute, IntervalTotal::MINUTE),
          hour: parse_data(cron.hour, IntervalTotal::HOUR),
          day_of_month: parse_data(cron.day_of_month, IntervalTotal::DAY_OF_MONTH),
          month: parse_data(cron.month, IntervalTotal::MONTH),
          day_of_week: parse_data(cron.day_of_week, IntervalTotal::DAY_OF_WEEK),
          file: cron.file
        }
      end

      # Run cronlet through a set of regex rules to verify which it statisfies
      # Once identified, use the matching func to process vals
      def identify_rule(cronlet)
        case cronlet
        in /(^\*$)/
          :wildcard
        in /(^\d{1,2}-\d{1,2}$)/
          :range
        else
          :default
        end
      end

      private

      def parse_data(cronlet, chronounit)
        [*send(identify_rule(cronlet), cronlet, chronounit)]
      end
    end
  end
end

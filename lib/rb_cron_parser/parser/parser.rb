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
          minute: [*send(identify_rule(cron.minute), cron.minute, IntervalTotal::MINUTE)],
          hour: [*send(identify_rule(cron.hour), cron.hour, IntervalTotal::HOUR)],
          day_of_month: [*send(identify_rule(cron.day_of_month), cron.day_of_month, IntervalTotal::DAY_OF_MONTH)],
          month: [*send(identify_rule(cron.month), cron.month, IntervalTotal::MONTH)],
          day_of_week: [*send(identify_rule(cron.day_of_week), cron.day_of_week, IntervalTotal::DAY_OF_WEEK)],
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
    end
  end
end

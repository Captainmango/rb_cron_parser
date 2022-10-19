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

      # Converts the cron object into a collection of parsed intervals with rules applied
      #
      # Returns a hash
      def parse(cron)
        {
          minute: parse_interval(cron.minute, IntervalTotal::MINUTE),
          hour: parse_interval(cron.hour, IntervalTotal::HOUR),
          day_of_month: parse_interval(cron.day_of_month, IntervalTotal::DAY_OF_MONTH),
          month: parse_interval(cron.month, IntervalTotal::MONTH),
          day_of_week: parse_interval(cron.day_of_week, IntervalTotal::DAY_OF_WEEK),
          file: cron.file
        }
      end

      # Identifies what rule to apply to the cron fragment
      #
      # Returns a symbol
      def identify_rule(cronlet)
        case cronlet
        in /(^\d{1,2}-\d{1,2}$)/
          :range
        in /(^\d{1,2},\d{1,2}$)/
          :list
        in /(^\*\/\d{1,2}$)/
          :modulo
        in /(^\*$)/
          :wildcard
        else
          :default
        end
      end

      private

      # Accepts cron fragment and interval and applies identified rule
      #
      # Returns an array
      def parse_interval(cronlet, chronounit)
        send(identify_rule(cronlet), cronlet, chronounit)
      end
    end
  end
end

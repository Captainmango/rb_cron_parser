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
        # take each piece from the struct
        # apply regex to determine which rule we should apply
        # if no match is found throw error
        # apply the rule that returns an array of values
        # save these into the hash and return
        res = {
          minute: [*self.send(identify_rule(cron.minute), cron.minute, IntervalTotal::MIN)]
        }
 
        res
      end

      # Run cronlet through a set of regex rules to verify which it statisfies
      # Once identified, use the matching func to process vals
      def identify_rule(cronlet)
        case true
        when /(^\*$)/.match?(cronlet)
          return :wildcard
        when /(^\d{1,2}-\d{1,2}$)/.match?(cronlet)
          return :range
        else
          return :default
        end
      end
    end
  end
end

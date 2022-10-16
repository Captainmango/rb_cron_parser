# frozen_string_literal: true

require_relative './rules'
require_relative './chronounits'

module RbCronParser
  # Module to parse cron fragments into possible values
  #
  # Author: Edward Heaver
  module Parser
    class << self
      include RbCronParser::Rules
      include RbCronParser::Chronunits

      # returns hash for each interval with the applicable periods
      def parse(cron)
        # take each piece from the struct
        # apply regex to determine which rule we should apply
        # if no match is found throw error
        # apply the rule that returns an array of values
        # save these into the hash and return
        cron
      end

      private

      # Run cronlet through a set of regex rules to verify which it statisfies
      # Once identified, use the matching func to process vals
      def identify_rule(cronlet, chronounit)
        # Probs going to use pattern matching as it makes sense
      end
    end
  end
end

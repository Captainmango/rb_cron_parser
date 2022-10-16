# frozen_string_literal: true

module RbCronParser
  # Module to format parser output into a nice looking table
  #
  # Author: Edward Heaver
  module Formatter
    class << self
      def format(cron_details)
        # iterate over the hash and print key (the interval) then value
        # (array of values that fit expression)
        puts cron_details
      end
    end
  end
end

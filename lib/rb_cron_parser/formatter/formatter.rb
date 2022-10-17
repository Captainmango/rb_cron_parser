# frozen_string_literal: true

module RbCronParser
  # Module to format parser output into a nice looking table
  #
  # Author: Edward Heaver
  module Formatter
    class << self
      def format(cron_details)
        raise ArgumentError.new('Formatter#format only accepts hashes') unless cron_details.is_a? Hash

        cron_details.each_pair do |key, value|
          puts "#{key} #{value}"
        end
      end
    end
  end
end

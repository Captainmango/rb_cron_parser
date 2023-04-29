# frozen_string_literal: true

module RbCronParser
  # Constants for max values of the intervals used by the program
  #
  # Author: Edward Heaver
  module IntervalTotal
    # @return [Integer] <description>
    DAY_OF_MONTH = 31
    # @return [Integer] <description>
    MINUTE = 59 # inclusive of 0
    # @return [Integer] <description>
    HOUR = 23 # inclusive of 0
    # @return [Integer] <description>
    DAY_OF_WEEK = 7
    # @return [Integer] <description>
    MONTH = 12
  end
end

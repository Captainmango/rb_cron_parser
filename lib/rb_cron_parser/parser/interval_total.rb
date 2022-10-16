# frozen_string_literal: true

module RbCronParser
  # Constants for max values of the intervals used by the program
  #
  # Author: Edward Heaver
  module IntervalTotal
    DAY_OF_MONTH = 30
    MIN = 59 # inclusive of 0
    HOUR = 23 # inclusive of 0
    DAY_OF_WEEK = 7
    MONTH = 12
  end
end

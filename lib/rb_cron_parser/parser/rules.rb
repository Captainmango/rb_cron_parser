# frozen_string_literal: true

require_relative './interval_total'
require 'pry'

module RbCronParser
  # Module containing rules for processing cron fragments
  #
  # Author: Edward Heaver
  module Rules
    include RbCronParser::IntervalTotal
    # just a star (*) - returns all the possible values for the interval
    def wildcard(_cronlet, chronounit)
      case chronounit
      in IntervalTotal::MINUTE | IntervalTotal::HOUR
        [*0..chronounit]
      in IntervalTotal::DAY_OF_WEEK | IntervalTotal::DAY_OF_MONTH | IntervalTotal::MONTH
        [*1..chronounit]
      else
        []
      end
    end

    # 2 numbers with a dash between (1-3) - returns all values between nums inclusive
    def range(cronlet, chronounit)
      (num1, num2) = cronlet.split('-')

      can_apply_rule_to_numbers!(numbers: [num1.to_i, num2.to_i], chronounit: chronounit)

      [*num1.to_i..num2.to_i]
    end

    # star with / and any number (*/10) - returns all that are divisible by right side number
    # must be a number or it throws error
    def modulo(cronlet, chronounit)
      (_, num) = cronlet.split('/')

      can_apply_rule_to_numbers!(numbers: [num.to_i], chronounit: chronounit)

      case chronounit
      in IntervalTotal::MINUTE | IntervalTotal::HOUR
        [*0..chronounit].select { |number| (number % num.to_i).zero? }
      in IntervalTotal::DAY_OF_WEEK | IntervalTotal::MONTH | IntervalTotal::DAY_OF_MONTH
        [*1..chronounit].select { |number| (number % num.to_i).zero? }
      else
        []
      end
    end

    # Comma separated values (1,2,3) - returns each number supplied
    def list(cronlet, chronounit)
      nums = cronlet.split(',').map{|num| num.to_i}

      can_apply_rule_to_numbers!(numbers: nums, chronounit: chronounit)

      nums
    end

    # default rule (1) - returns the value passed in. Returns empty array if value is nil
    def default(cronlet, chronounit)
      return cronlet if chronounit == -1

      [cronlet.to_i]
    end

    private

    def can_apply_rule_to_numbers!(**factors)
      factors.fetch(:numbers).each do |number|
        raise ArgumentError, 'Number too big to parse' if number > factors.fetch(:chronounit)
      end
    end
  end
end

# frozen_string_literal: true

require_relative './interval_total'

module RbCronParser
  # Module containing rules for processing cron fragments
  #
  # Author: Edward Heaver
  module Rules
    include RbCronParser::IntervalTotal
    # just a star (*) - returns all the possible values for the interval
    def wildcard(cronlet, chronounit)
      case chronounit
      in IntervalTotal::MINUTE
        return [*0..IntervalTotal::MINUTE]
      in IntervalTotal::HOUR
        return [*0..IntervalTotal::HOUR]
      in IntervalTotal::DAY_OF_WEEK
        return [*1..IntervalTotal::DAY_OF_WEEK]
      else
        return nil
      end
    end

    # 2 numbers with a dash between (1-3) - returns all values between nums inclusive
    def range(cronlet, chronounit); end

    # star with / and any number (*/10) - returns all that are divisible by right side number
    # must be a number or it throws error
    def modulo(cronlet, chronounit); end

    # Comma separated values (1,2,3) - returns each number supplied
    def list(cronlet, chronounit); end

    # default rule (1) - returns the value passed in. Returns empty array if value is nil
    def default(cronlet, _chronounit)
      [cronlet.to_i]
    end
  end
end

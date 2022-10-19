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
    def wildcard(cronlet, chronounit)
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

      [*num1.to_i..num2.to_i]
    end

    # star with / and any number (*/10) - returns all that are divisible by right side number
    # must be a number or it throws error
    def modulo(cronlet, chronounit)
      (_, num) = cronlet.split('/')

      case chronounit
      in IntervalTotal::MINUTE | IntervalTotal::HOUR
        [*0..chronounit].select {|number| number % num.to_i == 0 }
      in IntervalTotal::DAY_OF_WEEK | IntervalTotal::MONTH | IntervalTotal::DAY_OF_MONTH
        [*1..chronounit].select {|number| number % num.to_i == 0 }
      else
        []
      end
    end

    # Comma separated values (1,2,3) - returns each number supplied
    def list(cronlet, chronounit)
      (num1, num2) = cronlet.split(',')
      
      [*num1.to_i, num2.to_i]
    end

    # default rule (1) - returns the value passed in. Returns empty array if value is nil
    def default(cronlet, _chronounit)
      [cronlet.to_i]
    end
  end
end

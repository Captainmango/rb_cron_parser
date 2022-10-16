# frozen_string_literal: true

module RbCronParser
  # Module containing rules for processing cron fragments
  #
  # Author: Edward Heaver
  module Rules
    # just a star - returns all the possible values for the interval
    def wildcard(cronlet, chronounit); end

    # 2 numbers with a dash between - returns all values between nums inclusive
    def range(cronlet, chronounit); end

    # star with / and any number - returns all that are divisible by right side number
    # must be a number or it throws error
    def modulo(cronlet, chronounit); end

    # Comma separated values - returns each number supplied
    def list(cronlet, chronounit); end

    # default rule. Just returns the value passed in. Returns empty array if value is nil
    def default(cronlet, chronounit); end
  end
end

# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

module RbCronParser
  module Parser
    class ParserTest < Minitest::Spec
      describe 'RbCronParser::Parser#parse' do
        tests = [
          {
            scenario: 'Can parse basic input',
            input: [1, 2, 3, 4, 5],
            expected: {
              minute: [1],
              hour: [2],
              day_of_month: [3],
              month: [4],
              day_of_week: [5],
              command: nil
            }
          },
          {
            scenario: 'Can parse wildcards',
            input: ['*', '*', '*', '*', '*'],
            expected: {
              minute: [*0..59],
              hour: [*0..23],
              day_of_month: [*1..30],
              month: [*1..12],
              day_of_week: [*1..7]
            }
          },
          {
            scenario: 'Can parse ranges',
            input: %w[1-5 1-5 0-5 0-5 0-5],
            expected: {
              day: [*1..5],
              month: [*1..5],
              hour: [*0..5],
              minute: [*0..5],
              second: [*0..5]
            }
          },
          {
            scenario: 'Can parse all intervals divisible by 5',
            input: ['*/5', '*/5', '*/5', '*/5', '*/5'],
            expected: {
              day: [5],
              month: [5, 10],
              hour: [0, 5, 10, 15, 20],
              minute: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55],
              second: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
            }
          },
          {
            scenario: 'Can parse a complex expression',
            input: ['1-5', '*', '*/2', '0', '0'],
            expected: {
              day: [*1..5],
              month: [*1..12],
              hour: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22],
              minute: [0],
              second: [0]
            }
          }
        ]

        tests.each do |test_case|
          it "#{test_case[:scenario]} input: #{test_case[:input]}" do
            skip('Remove when writing functionality')
            cron = Cron.new(*test_case[:input])
            output = RbCronParser::Parser.parse(cron)

            expect(output).must_equal test_case[:expected]
          end
        end
      end
    end
  end
end

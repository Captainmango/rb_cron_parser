# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

module RbCronParser
  module Parser
    class ParserTest < Minitest::Spec
      describe 'RbCronParser::Parser#parse' do
        cron_struct = Struct.new(:day, :month, :hour, :minute, :second)

        tests = [
          {
            scenario: 'Can parse basic input',
            input: [1, 2, 3, 4, 5],
            expected: {
              day: [1],
              month: [2],
              hour: [3],
              minute: [4],
              second: [5]
            }
          },
          {
            scenario: 'Can parse wildcards',
            input: ['*', '*', '*', '*', '*'],
            expected: {
              day: [*1..30],
              month: [*1..12],
              hour: [*0..23],
              minute: [*0..59],
              second: [*0..59]
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
            cron = cron_struct.new(*test_case[:input])
            output = RbCronParser::Parser.parse(cron)

            expect(output).must_equal test_case[:expected]
          end
        end
      end
    end
  end
end

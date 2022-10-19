# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

module RbCronParser
  module Parser
    class ParserTest < Minitest::Spec
      describe 'RbCronParser::Parser#identify_rule' do
        it 'Can identify wildcards' do
          res = RbCronParser::Parser.identify_rule('*')

          expect(res).must_equal :wildcard
        end

        it 'Can identify ranges' do
          res = RbCronParser::Parser.identify_rule('1-5')

          expect(res).must_equal :range
        end
      end

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
              file: nil
            }
          },
          {
            scenario: 'Can parse complete input',
            input: ['*/15', '1,12', '5', '6-12', '*', 'task.sh'],
            expected: {
              minute: [0, 15, 30, 45],
              hour: [1, 12],
              day_of_month: [5],
              month: [*6..12],
              day_of_week: [*1..7],
              file: 'task.sh'
            }
          }
        ]
        it 'can parse complete output' do
          tests.each do |test_case|
            cron = Cron.new(*test_case[:input])
            output = RbCronParser::Parser.parse(cron)

            expect(output).must_equal test_case[:expected]
          end
        end

        it 'raises an error if input is too big' do
          cron = Cron.new('99-99', '*/5', '*', '99', '99,99')

          _ { RbCronParser::Parser.parse(cron) }.must_raise(ArgumentError)
        end
      end
    end
  end
end

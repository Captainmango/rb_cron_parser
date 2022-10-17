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
            scenario: 'Can parse wildcards',
            input: ['*', '*', '*', '*', '*'],
            expected: {
              minute: [*0..RbCronParser::IntervalTotal::MINUTE],
              hour: [*0..RbCronParser::IntervalTotal::HOUR],
              day_of_month: [*1..RbCronParser::IntervalTotal::DAY_OF_MONTH],
              month: [*1..RbCronParser::IntervalTotal::MONTH],
              day_of_week: [*1..RbCronParser::IntervalTotal::DAY_OF_WEEK],
              file: nil
            }
          }
        ]
        it "can parse complete output" do
          skip('not implemented yet')
          tests.each do |test_case|
            cron = Cron.new(*test_case[:input])
            output = RbCronParser::Parser.parse(cron)
  
            expect(output).must_equal test_case[:expected]
          end
        end
      end
    end
  end
end

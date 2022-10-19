# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

module RbCronParser
  module Parser
    class RulesTest < Minitest::Spec
      describe 'RbCronParser::Rules' do
        let(:fake_parser) do
          Class.new do
            extend RbCronParser::Rules
          end
        end

        let(:interval) { RbCronParser::IntervalTotal::DAY_OF_WEEK }

        it '#wildcard' do
          output = fake_parser.wildcard('*', interval)

          expect(output).must_equal [*1..interval]
        end

        it '#range' do
          output = fake_parser.range('1-3', interval)

          expect(output).must_equal [1, 2, 3]
        end

        it '#modulo' do
          output = fake_parser.modulo('*/2', interval)

          expect(output).must_equal [2, 4, 6]
        end

        it '#list' do
          output = fake_parser.list('1,5', interval)

          expect(output).must_equal [1, 5]
        end

        it '#default' do
          output = fake_parser.default('5', interval)

          expect(output).must_equal [5]
        end
      end
    end
  end
end

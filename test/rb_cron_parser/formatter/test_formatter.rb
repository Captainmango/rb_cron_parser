# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

class ParserTest < Minitest::Spec
  describe 'RbCronParser::Formatter#format' do
    input = {
      test: [2],
      thing: [4],
    }

    it 'can accept a hash and print out the data' do
      output, _ = capture_io do 
        RbCronParser::Formatter::format(input)
      end

      expect(output).must_equal "test [2]\nthing [4]\n"
    end

    it 'raises an error if a non-hash is supplied' do
      _{ RbCronParser::Formatter::format([]) }.must_raise(ArgumentError)
    end
  end
end

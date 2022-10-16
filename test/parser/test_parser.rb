# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

class ParserTest < Minitest::Spec
  describe 'RbCronParser::Parser::Parser' do
    cron_struct = Struct.new(:day, :month, :hour, :minute, :second)
    it 'Can parse a basic input of [1,2,3,4,5]' do
      cron = cron_struct.new(1, 2, 3, 4, 5)
      output = RbCronParser::Parser.parse(cron)
      expect(output).must_equal cron
    end
  end
end

# frozen_string_literal: true

require 'test_helper'
require 'rb_cron_parser'

module RbCronParser
  class CronTest < Minitest::Spec
    describe 'RbCronParser::Cron' do
      let(:cron) { Cron.new(1,2,3,4,5,'thing.js') }

      it 'can get the minute' do
        expect(cron.minute).must_equal 1
      end

      it 'can get the hour' do
        expect(cron.hour).must_equal 2
      end

      it 'can get the day of month' do
        expect(cron.day_of_month).must_equal 3
      end

      it 'can get the month' do
        expect(cron.month).must_equal 4
      end

      it 'can get the day of week' do
        expect(cron.day_of_week).must_equal 5
      end

      it 'can get the file' do
        expect(cron.file).must_equal 'thing.js'
      end
    end
  end
end

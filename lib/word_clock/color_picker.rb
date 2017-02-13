# frozen_string_literal: true
require 'word_clock/color'
require 'word_clock/static_color_sampler'
require 'word_clock/all_day_arbiter'
require 'word_clock/carnival_arbiter'

module WordClock
  class ColorPicker
    def initialize(sampler)
      @sampler = sampler

      always_grey = StaticColorSampler.new(Color.new(64, 64, 64))

      @samplers = {
        CarnivalArbiter.new => sampler,
        AllDayArbiter.new(Easter.easter - 46) => always_grey, # Aschermittwoch
        AllDayArbiter.new(Time.parse('April 8')) => sampler,
      }
    end

    def choose(time=nil)
      @samplers.each do |arbiter, sampler|
        return sampler.sample if arbiter.match?(time)
      end

      @color ||= @sampler.sample
    end
  end
end

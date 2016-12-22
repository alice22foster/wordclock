# frozen_string_literal: true
require 'spec_helper'
require 'word_clock/stripe'
require 'shared_examples_for_word_clock'

RSpec.describe WordClock::Stripe do
  # 06:00..06:13

  describe 'es ist sechs uhr vier zehn' do
    it_behaves_like_a_word_clock(
      6,
      14,
      [0, 1, 3, 4, 5, 25, 26, 27, 28, 29, 105, 106, 107, 133, 134, 135, 136, 194, 195, 196, 197]
    )
  end

  # 06:15..06:16

  describe 'es ist sechs uhr sieb zehn' do
    it_behaves_like_a_word_clock(
      6,
      17,
      [0, 1, 3, 4, 5, 25, 26, 27, 28, 29, 105, 106, 107, 144, 145, 146, 147, 194, 195, 196, 197]
    )
  end

  # 06:18..06:19

  describe 'es ist zehn vor halb sieben' do
    it_behaves_like_a_word_clock(
      6,
      20,
      [0, 1, 3, 4, 5, 68, 69, 70, 71, 116, 117, 118, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149]
    )
  end

  # 06:21..06:59
end
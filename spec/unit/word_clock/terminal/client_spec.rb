# frozen_string_literal: true
require 'spec_helper'
require 'word_clock/terminal/client'
require 'stringio'

RSpec.describe WordClock::Terminal::Client do
  subject { WordClock::Terminal::Client.new(output, 18, 16) }
  let(:output) { StringIO.new }
  let(:strip) { double }

  before do
    allow(strip).to receive(:pixels).and_return(Array.new(18 * 16, ' '))
  end

  it 'has the right total amount of lines' do
    subject.write(strip)

    expect(output.string).to_not be_empty
    expect(output.string.lines.size).to eq(16 + 2) # header + footer
  end

  it 'is blank' do
    subject.write(strip)

    expect(output.string.lines).to eq([
      "+-------------------------------------+\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "|                                     |\n",
      "+-------------------------------------+\n",
    ])
  end
end
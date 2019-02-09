require 'oystercard'

describe Oystercard do
  it 'starts with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'starts with a maximum_balance of 90' do
    expect(subject.MAXIMUM_BALANCE).to eq(90)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases the value of balance when topped up' do
      expect{subject.top_up(1)}.to change{subject.balance}.by(1)
    end

    it 'raises an error if topped up by £91' do
      expect{subject.top_up(91)}.to raise_error 'Top up exceeds maximum balance'
    end
  end
end

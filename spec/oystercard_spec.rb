require 'oystercard'

describe Oystercard do
  it 'starts with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'starts with a journey status of false' do
    expect(subject.in_journey).to eq(false)
  end

  it 'starts with a minimum balance of £1' do
    expect(subject.MINIMUM_BALANCE).to eq(1)
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases the value of balance when topped up' do
      expect{subject.top_up(1)}.to change{subject.balance}.by(1)
    end

    it 'raises an error if topped up by £91' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      expect{subject.top_up(91)}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'reduces the balance by the amount deducted' do
      expect{subject.deduct(1)}.to change{subject.balance}.by(-1)
    end
  end

  describe '#touch_in' do
    it 'changes the status of injourney to true' do
      expect{subject.touch_in}.to change{subject.in_journey}.to (true)
    end
  end

  describe '#touch_out' do
    it 'changes the status of in_journey back to false' do
      subject.touch_out
      expect( subject.in_journey ).to eq(false)
    end
  end

end

require 'oystercard'

describe Oystercard do

  it "responds to the method balance" do
    expect(subject).to respond_to(:balance)
  end

  it "has a default balance" do
    default = Oystercard::DEFAULT_BALANCE
    
    expect(subject.balance).to eq default
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds value to the balance' do
      value = 100

      subject.top_up(value)

      expect(subject.balance).to eq value
    end

    it 'adds additional value to the balance' do
      value = 100

      subject.top_up(50)
      subject.top_up(value)

      expect(subject.balance).to eq (value + 50)
    end
  end
end

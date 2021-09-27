require 'oystercard'

describe Oystercard do
  let(:default) { Oystercard::DEFAULT_BALANCE }

  it "responds to the method balance" do
    expect(subject).to respond_to(:balance)
  end

  it "has a default balance" do
    expect(subject.balance).to eq default
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds value to the balance' do
      value = 10

      subject.top_up(value)

      expect(subject.balance).to eq value
    end

    it 'adds additional value to the balance' do
      value = 10
      value_two = 5

      subject.top_up(value)
      subject.top_up(value_two)

      expect(subject.balance).to eq (value + value_two)
    end

    it "raises an exception topping up beyond balance limit" do
      limit = Oystercard::LIMIT
      expect { subject.top_up(limit + 1) }.to raise_error "Error: £#{limit} limit exceeded"
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deduct value from balance' do
      value = 10
      subject.top_up(value)

      subject.deduct(value)

      expect(subject.balance).to eq default
    end
  end
end

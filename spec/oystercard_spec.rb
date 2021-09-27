require 'oystercard'

describe Oystercard do

  it "responds to the method balance" do
    expect(subject).to respond_to(:balance)
  end

  it "has a default balance" do
    default = Oystercard::DEFAULT_BALANCE
    
    expect(subject.balance).to eq default
  end

end

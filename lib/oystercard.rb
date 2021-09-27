class Oystercard
  DEFAULT_BALANCE = 0
  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(value)
    raise "Error: £#{LIMIT} limit exceeded" if limit_check(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  private

  def limit_check(value)
    (balance + value) > LIMIT
  end
end

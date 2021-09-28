class Oystercard
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(value)
    raise "Error: £#{LIMIT} limit exceeded" if limit_check(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    raise 'Insufficient funds' if balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def limit_check(value)
    (balance + value) > LIMIT
  end
end

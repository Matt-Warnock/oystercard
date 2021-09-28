class Oystercard
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  LIMIT = 90

  attr_reader :balance, :entry_station

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(value)
    raise "Error: £#{LIMIT} limit exceeded" if limit_check(value)
    @balance += value
  end

  def touch_in(station)
    raise 'Insufficient funds' if balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def limit_check(value)
    (balance + value) > LIMIT
  end

  def deduct(value)
    @balance -= value
  end
end

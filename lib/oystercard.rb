class Oystercard
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  LIMIT = 90

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = DEFAULT_BALANCE
    @journeys = []
  end

  def top_up(value)
    raise "Error: £#{LIMIT} limit exceeded" if limit_check(value)
    @balance += value
  end

  def touch_in(station)
    raise 'Insufficient funds' if balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys << {:entry_station => @entry_station, :exit_station => station}
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

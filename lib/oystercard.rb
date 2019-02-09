class Oystercard

  attr_reader :balance, :MAXIMUM_BALANCE

  def initialize
    @balance = 0
    @MAXIMUM_BALANCE = 90
  end

  def top_up(amount)
    fail 'Top up exceeds maximum balance' if amount > @MAXIMUM_BALANCE
    @balance += 1
  end

end

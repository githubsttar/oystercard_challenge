class Oystercard

  attr_reader :balance, :maximum_balance

  def initialize
    @balance = 0
    @maximum_balance = 90
  end

  def top_up(amount)
    @balance += 1
  end

end

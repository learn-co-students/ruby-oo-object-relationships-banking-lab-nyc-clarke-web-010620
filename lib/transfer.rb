require_relative './bank_account.rb'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount

  end

  def valid?
  if sender.valid? == true && receiver.valid? == true
    true
  end
  end 

  def execute_transaction

    if sender.balance < amount || @status == "complete" || !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end

  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount 
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end

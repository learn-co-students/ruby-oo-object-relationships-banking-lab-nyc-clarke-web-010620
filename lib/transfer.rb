# require_relative "./bank_account.rb"

class Transfer
  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  attr_accessor :sender, :receiver, :amount, :status

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    
    if self.status == "pending" && sender.balance > self.amount  && self.valid?
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if status == "complete"      
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end



end

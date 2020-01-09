require_relative './bank_account.rb'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    end
  end
  def execute_transaction
    if status == "pending" && @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount
      sender_new_balance = @sender.balance - @amount
      @sender.balance = sender_new_balance
      receiver_new_balance = @receiver.balance + @amount
      @receiver.balance = receiver_new_balance
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      sender_prev_balance = @sender.balance + @amount
      @sender.balance = sender_prev_balance
      receiver_prev_balance = @receiver.balance - @amount
      @receiver.balance = receiver_prev_balance
      @status = "reversed"
    end
  end  

end

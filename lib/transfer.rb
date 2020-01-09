class Transfer
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender,receiver,status = "pending",amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end



  def valid? 
    self.sender.valid? && self.receiver.valid?
  end
   
  def execute_transaction
    # if self.status == "complete"
    #   "Transaction already completed."
    # elsif self.sender.balance < self.amount 
    #   self.status ="rejected"
    #   "Transaction rejected. Please check your account balance." 
    # elsif self.status != ("complete" || "rejected")
    # self.receiver.balance += self.amount
    # self.sender.balance -= self.amount
    if self.status == "pending" && self.sender.balance > self.amount && valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  
    # elsif self.sender.balance < self.amount
    # self.status = "Transaction rejected. Please check your account balance."
    end 
  end
  def reverse_transfer 
    if self.status == "complete" && self.receiver.balance > self.amount && valid?
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
  end
end
end

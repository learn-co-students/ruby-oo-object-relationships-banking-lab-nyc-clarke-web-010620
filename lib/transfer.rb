require_relative "./bank_account.rb"

class Transfer
  attr_accessor :pending, :status, :amount
  attr_reader :sender, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    end
    false
  end

  def execute_transaction
    if @status != 'complete'
      if (@sender.valid? && @receiver.valid? && @sender.balance >= @amount)
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        # self.post_transaction
        self.status = "complete"
      else
        self.status= "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else  
      self.status = "rejected"
    end
  end

  # def post_transaction
  #   string = @sender.balance.to_s += @receiver.balance.to_s += @amount.to_s
  # end

  # def transfer_check
  #   string = @sender.balance.to_s += @receiver.balance.to_s += @amount.to_s
  #   if self.post_transaction == string
  #     return false
  #   end
  #   true
  # end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(+@amount)
      @receiver.deposit(-@amount)
      @status = 'reversed'
    end
  end
end
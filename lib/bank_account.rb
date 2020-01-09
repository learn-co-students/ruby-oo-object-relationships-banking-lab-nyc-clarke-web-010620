class BankAccount

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end 

    attr_reader :name
    attr_accessor :balance, :status

    def deposit(amt)
        self.balance += amt
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance == 0
            return false
        elsif
            self.status == "closed"
                return false
        else
            return true
        end

    end

    def close_account
        self.status = "closed"
    end





end

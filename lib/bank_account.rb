class BankAccount

attr_accessor :status, :balance
attr_reader :name
    def initialize (name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def balance
        @balance
    end

    def status
        @status
    end

    def deposit (amount)
        new_balance = @balance + amount
        @balance = new_balance
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    

    def close_account
        @status = "closed"
    end

    def valid?
        if @status == "open" && @balance > 0
            return true
        else
            return false
        end

    end

end

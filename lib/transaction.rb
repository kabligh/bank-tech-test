class Transaction

  attr_reader :value, :date

  def initialize(value)
    @value = value
    @date = Time.now.strftime("%d/%m/%Y") 
  end

end

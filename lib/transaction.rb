class Transaction

  attr_reader :value, :date

  def initialize(value, type)
    @value = value
    @type = type
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def credit
    value if @type == :credit
  end

  def debit
    -value if @type == :debit
  end

end

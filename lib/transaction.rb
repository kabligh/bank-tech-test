# frozen_string_literal: true

class Transaction
  attr_reader :value, :date, :type

  def initialize(value, type)
    @value = value
    @type = type
    @date = Time.now.strftime('%d/%m/%Y')
  end

end

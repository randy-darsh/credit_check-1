require 'pry'

class CreditCheck

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def split_number
    card_number.split("")
  end

  def double
    split_number.map.with_index do |number, index|
      if index.even?
       (number.to_i * 2).to_s
     else
       number
     end
    end
  end

  def reduce_doubled_numbers
      double.map do |number|
        if number.length > 1
          reduce(number)
        else
          number
        end
      end
  end

  def end_sum
    sum = []
    reduce_doubled_numbers.each do |number|
      sum << number.to_i
    end
    sum.inject(:+)
  end

  def validate
    if end_sum % 10 == 0
      true
    else
      false
    end
  end

  def validation_message
    if validate == true
      "Card Number #{card} is valid."
    else
      "Card Number #{card} is not valid."
    end
  end
binding.pry

end

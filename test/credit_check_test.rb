require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test

  def test_it_can_read_a_card_number
    check = CreditCheck.new("6011797668867828")

    assert_equal "6011797668867828", check.card_number
  end

  def test_it_splits_the_card_number
    check = CreditCheck.new("6011797668867828")

    assert_equal ["6", "0", "1", "1", "7", "9", "7", "6", "6", "8", "8", "6", "7", "8", "2", "8"], check.split_number
  end

  def test_it_doubles_every_number
    check = CreditCheck.new("6011797668867828")
    check.split_number

    assert_equal ["12", "0", "2", "1", "14", "9", "14", "6", "12", "8", "16", "6", "14", "8", "4", "8"], check.double
  end

  def test_it_can_add_doubled_numbers_over_10_together
    check = CreditCheck.new("6011797668867828")
    check.split_number

    assert_equal ["3", "0", "2", "1", "5", "9", "5", "6", "3", "8", "7", "6", "5", "8", "4", "8"], check.reduce_doubled_numbers
  end

  # def test_it_can_add_the_numbers_together
  #   check = CreditCheck.new("6011797668867828")
  # end

end

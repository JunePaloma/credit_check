require 'pry'
class CreditCheck
  attr_accessor :card_number #wrappr for the class that establishes what permission is aval for class
  def initialize(card_number)
    @card_number = card_number
  end

  def reverse_card
    card_number.reverse
  end

  def rc_to_array
    reverse_card.chars.map
  end

  def rc_array_to_nums
    rc_to_array.map { |x| x.to_i }
  end

  def id_odds
    rc_array_to_nums.map.with_index do |value, index|
      double_odds(value, index)
    end
  end

  def double_odds(value, index)
    if index.odd?
      value*2
    else value
    end
  end

  def string_of_num
    id_odds.join("")
  end

  def split_string
    string_of_num.split("")
  end

  def num_strings_to_integers
    split_string.map! do |x|
      x.to_i
    end
  end


  def summing_all_integers
    num_strings_to_integers.inject(0) do |sum,num|
      sum+num
    end
  end

  def testing_for_valid
    if summing_all_integers%10==0
      puts "Valid card number."
    else
      puts "Invalid card number."
    end
  end
end

a = CreditCheck.new("4024007106512380")
a.testing_for_valid


#credit_check_a = CreditCheck.new("4929735477250543")
#binding.pry

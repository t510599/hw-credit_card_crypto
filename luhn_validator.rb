module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    nums_a[-1] == luhn_checksum(nums_a[0..-2])
  end

  def luhn_checksum(nums)
    tmp = nums.reverse!.map.with_index { |num, i| (num * (i.even? ? 2 : 1)).to_s.chars.map(&:to_i).sum }.sum
    (10 - tmp) % 10
  end
end

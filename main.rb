ALPHABET_LEN = 26

def get_shifted_code_of_char(char, shift, bound)
  ((char.ord + shift - bound) % ALPHABET_LEN) + bound
end

def caesar_cipher(str, shift)
  result = str.chars.map do |char|
    next char if char.match?(/\W/)

    get_shifted_code_of_char(char, shift, char.upcase == char ? 'A'.ord : 'a'.ord).chr
  end

  result.join
end

cases = [
  { str: 'A', shift: 1 },
  { str: 'Aaa', shift: 1 },
  { str: 'Hello, World!', shift: 5 },
  { str: 'Mjqqt, Btwqi!', shift: -5 },
  { str: 'Z', shift: 1 },
  { str: 'Hello, World!', shift: 75 },
  { str: 'Hello, World!', shift: -29 }
]

cases.each do |test_case|
  puts "#{test_case[:str]} -> #{caesar_cipher(test_case[:str], test_case[:shift])}"
end

# https://adventofcode.com/2024/day/3 (Part 2)

def match_with_index(match, input)
  index = input.index(match[0]) if match
  [index, match]
end

MUL_REGEX = /mul\((\d+),(\d+)\)/
DO_REGEX = /do\(\)/
DONT_REGEX = /don't\(\)/

input = File.read("./input.txt")

sum = 0
enabled = true

loop do
  do_match = input.match(DO_REGEX)
  dont_match = input.match(DONT_REGEX)
  mul_match = input.match(MUL_REGEX)

  break if mul_match.nil?

  first_match = {
    mul_match: match_with_index(mul_match, input),
    do_match: match_with_index(do_match, input),
    dont_match: match_with_index(dont_match, input),
  }.reject{ |_, v| v[0].nil? }.sort_by { |_, v| v[0] }.first

  key = first_match[0]
  index = first_match[1][0]
  match = first_match[1][1]

  if key == :do_match
    enabled = true
  elsif key == :dont_match
    enabled = false
  elsif key == :mul_match
    sum += match[1].to_i * match[2].to_i if enabled
  end

  input = input[index + match[0].length..-1]
end

puts sum

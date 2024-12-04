# https://adventofcode.com/2024/day/3 (Part 1)

MUL_REGEX = /mul\((\d+),(\d+)\)/

input = File.read("./input.txt")
matches = input.scan(MUL_REGEX)
result = matches.map { |match| match[0].to_i * match[1].to_i }.sum

puts result

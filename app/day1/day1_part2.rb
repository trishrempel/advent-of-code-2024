# https://adventofcode.com/2024/day/1 (Part 2)

locations = File.read("./input.txt").chomp.split("\n").map { |location| location.split("   ").map(&:to_i) }.transpose

similarity_score = 0
for i in 0..locations[0].length - 1 do
  value = locations[0][i]
  count = locations[1].count(value)
  similarity_score += value * count
end

puts similarity_score

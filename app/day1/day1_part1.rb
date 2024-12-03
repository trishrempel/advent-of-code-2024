# https://adventofcode.com/2024/day/1 (Part 1)

locations = File.read("./input.txt").chomp.split("\n").map { |location| location.split("   ").map(&:to_i) }.transpose.map(&:sort)

total_distance = 0
for i in 0..locations[0].length - 1 do
  total_distance += (locations[0][i] - locations[1][i]).abs
end

puts total_distance

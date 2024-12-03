# https://adventofcode.com/2024/day/2 (Part 1)

reports = File.read("./input.txt").chomp.split("\n").map { |line| line.split(" ").map(&:to_i) }

safe_reports = 0
reports.each do |report|
  previous_level = nil
  previous_direction = nil
  is_safe = true
  report.each do |level|
    if previous_level
      difference = previous_level - level
      direction = difference.positive? ? :decreasing : :increasing
      previous_direction ||= direction
      is_safe = false if difference.abs < 1 || difference.abs > 3 || previous_direction != direction
      break unless is_safe
    end
    previous_level = level
  end
  safe_reports += 1 if is_safe
end

puts safe_reports

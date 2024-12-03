# https://adventofcode.com/2024/day/2 (Part 2)

def is_report_safe?(report)
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
  is_safe
end

reports = File.read("./input.txt").chomp.split("\n").map { |line| line.split(" ").map(&:to_i) }

safe_reports = 0
reports.each do |report|
  is_safe = is_report_safe?(report)
  unless is_safe
    (0..report.length - 1).each do |index|
      report_dup = report.dup
      report_dup.delete_at(index)
      is_safe = true if is_report_safe?(report_dup)
      break if is_safe
    end
  end
  safe_reports += 1 if is_safe
end

puts safe_reports

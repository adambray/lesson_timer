FILE_PATH = ARGV[0]

def convert_to_hours_and_minutes(num_minutes)
  minutes = num_minutes % 60
  hours = (num_minutes / 60)
  format("%02d:%02d", hours, minutes)
end

new_file = []
summary = []
total_time = 0

File.open(FILE_PATH, 'r') do |file|
  file.each do |line|
    match = line.match /(^\#+.*\()(\d+)(.*)(\))/

    if match
      total_time += match[2].to_i
      updated_header = match[1] + match[2] + match[3] + " - #{convert_to_hours_and_minutes(total_time)}" + match[4]

      new_file << updated_header
      summary << updated_header
    else
      new_file << line
    end

  end
end

File.open("#{FILE_PATH[0...-3]}_timed.md", "w") do |file|
  file.puts new_file
end

File.open("#{FILE_PATH[0...-3]}_summary.md", "w") do |file|
  file.puts summary
end

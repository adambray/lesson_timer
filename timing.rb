require 'time' # for Time.parse

FILE_PATH = ARGV[0]

new_file = []
summary = []

# always uses start_time, if none passed start_time is midnight.
start_time = ARGV[1] ? Time.parse(ARGV[1]) : Time.parse('00:00')
elapsed_time = start_time

File.open(FILE_PATH, 'r') do |file|
  file.each do |line|
    match = line.match /(^\#+.*\()(\d+)(.*)(\))/

    if match
      portion_minutes = match[2].to_i
      elapsed_time += (portion_minutes * 60)
      updated_header = match[1] + match[2] + match[3] + " - #{elapsed_time.strftime "%H:%M"}" + match[4]

      new_file << updated_header
      summary << updated_header
    else
      new_file << line
    end

  end
end
file_basename = File.basename(FILE_PATH, '.*')

File.open("#{file_basename}_timed.md", "w") do |file|
  file.puts new_file
end

File.open("#{file_basename}_summary.md", "w") do |file|
  file.puts summary
end

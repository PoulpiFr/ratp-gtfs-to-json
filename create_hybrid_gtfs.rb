def concat_file(file)

	puts "Processing #{file}.txt ..."
	fout = File.open("data/hybrid/#{file}.txt", 'w')

	Dir.glob("data/lines/*").each_with_index do |line_dir, line_index|
		IO.foreach("#{line_dir}/#{file}.txt").each_with_index do |line, index|
			fout.write(line) if not (line_index > 0 && index == 0)
		end
	end

	fout.close
end

concat_file("agency")
concat_file("calendar")
concat_file("calendar_dates")
concat_file("routes")
concat_file("stops")
concat_file("stop_times")
concat_file("transfers")
concat_file("trips")


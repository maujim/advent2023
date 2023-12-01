module helpers
        using HTTP;
	export get_input
	
	function get_input(year::Integer, day::Integer)
	
		if year < 2015
			throw(ArgumentError("year should be >= 2015"))
		elseif day < 1 || day > 25
			throw(ArgumentError("day should be between 1 and 25, inclusive"))
		end
	
		advent_url = "https://adventofcode.com/$year/day/$day/input";
		cookies = Dict("session" => "53616c7465645f5f6da2467223e04715bff79670b7e5af29336601520c92a0df6322bae9ab34e94a0c8b9df9e791557027b6e031629fbfb911fb7e38b2280682");
	
		response = HTTP.request("GET", advent_url, cookies=cookies)
		input = String(response.body);
	
		file = "inputs/input$day" * "_$year"
	
		open(file, "w") do fp
			write(fp, input);
			println(input)
		end

                return input
	end
end

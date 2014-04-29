module EventHelper
	def formatted_date (date)
		begin
			DateTime.strptime(date, "%m/%d/%Y")	
		rescue
			nil
		end
	end
end
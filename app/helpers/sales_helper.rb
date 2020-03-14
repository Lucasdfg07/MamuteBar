module SalesHelper
	def requests_chart_data
		(4.weeks.ago.to_date..Date.today).map do |date|
			{
				created_at: date
			}
		end
	end
end

module SalesHelper
	def requests_chart_data
		
	end

	def payment_data
	    (4.weeks.ago.to_date..Date.today).map do |date| 
	    	{
		      created_at: date.strftime('%d/%m/%Y'),
		      cash: Request.where("date(created_at) = ? AND payment = 'Dinheiro'", date).count,
		      card: Request.where("date(created_at) = ? AND payment = 'Cartão'", date).count
		    }
		end
    end
end

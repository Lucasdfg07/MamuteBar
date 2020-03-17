module SalesHelper
	def requests_chart_data
		(3.month.ago.to_date..Date.today).map do |date|
			{
				created_at: date,
				received: Request.joins(:product).where("date(requests.created_at) = ?", date).sum("requests.quantity * price"),
				spent: Pucharse.where("date(created_at) = ?", date).sum("quantity * price")
			}
		end
	end

	def payment_data
	    (4.weeks.ago.to_date..Date.today).map do |date| 
	    	{
		      created_at: date.strftime('%d/%m/%Y'),
		      cash: Request.where("date(requests.created_at) = ? AND payment = 'Dinheiro'", date).count,
		      card: Request.where("date(requests.created_at) = ? AND payment = 'Cartão'", date).count
		    }
		end
    end
end

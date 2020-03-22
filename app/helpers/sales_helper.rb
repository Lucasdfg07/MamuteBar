module SalesHelper
	def requests_chart_data
		(3.month.ago.to_date..Date.today).map do |date| 
			total = 0
			Request.where("date(created_at) = ? AND status = 'closed'", date).each{ |r| 
				count = 0
				r.products.each{|product|
					product_price = Product.find(product.to_i).price
					total += product_price * r.quantity[count]
					count += 1
				}
			}
			{
				created_at: date,
				received: total,
				spent: Pucharse.where("date(created_at) = ?", date).sum("price")
			}
		end
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

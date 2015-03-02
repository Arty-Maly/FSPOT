module MainPageHelper
	def get_urls_by_user(user_name=nil, num_of_pics=-1)
		ret = []
		(3...10).each do |i|
			ret << "img_main_#{i}.jpg"			
		end
		return ret
	end
end

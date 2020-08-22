class CleanupHelper

	def self.get_auth_token(url, email, password)
		response = RestClient.post "#{url}/token", { grant_type: 'password', username: email, password: password }
		token = JSON.parse(response)['access_token']
	end

	def self.delete_user_timelogs(url, userId, authToken)
		begin
			puts 'Deleting existing timelogs:'
			deleting = RestClient.delete "#{url}/api/timetracking?userid=#{userId}", { authorization: "Bearer #{authToken}" }
			if deleting.code == 200
				puts "Time logs for userId: #{userId} successfully deleted."
			end
		rescue RestClient::BadRequest
			puts 'No timelogs found'
		end
	end

	def self.delete_user_feedback(url, userId, authToken)
		begin
			puts 'Deleting existing feedbacks:'
			deleting = RestClient.delete "#{url}/api/userreview/user?userid=#{userId}", { authorization: "Bearer #{authToken}" }
			if deleting.code == 200
				puts "Feedback for userId: #{userId} successfully deleted."
			end
		rescue RestClient::BadRequest
			puts 'No feedback found'
		end
	end

	def self.delete_user_referrals(url, userId, authToken)
		begin
			puts 'Deleting existing referrals:'
			deleting = RestClient.delete "#{url}/api/jobapplication/user?userid=#{userId}", { authorization: "Bearer #{authToken}" }
			if deleting.code == 200
				puts "Referrals for userId: #{userId} successfully deleted."
			end
		rescue RestClient::BadRequest
			puts 'No referrals found'
		end
	end

	def self.delete_user_experience(url, userId, authToken)
		begin
			puts 'Deleting existing experience:'
			deleting = RestClient.delete "#{url}/api/userprofile/#{userId}/userexperience", { authorization: "Bearer #{authToken}" }
			if deleting.code == 200
				puts "Experience for userId: #{userId} successfully deleted."
			end
		rescue RestClient::BadRequest
			puts 'No experience found'
		end
	end
end

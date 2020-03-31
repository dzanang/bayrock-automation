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
end

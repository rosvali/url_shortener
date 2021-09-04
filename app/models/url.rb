require 'securerandom'

class Url < ApplicationRecord
	validate :valid_url?

	def custom_url
		"http://localhost:3000/#{id_url}" if id_url
	end

	def generate_id_url
		loop do
			id_url = SecureRandom.alphanumeric(6)
		break id_url unless Url.where(id_url: id_url).first
		end
	end

	def valid_url?
		errors.add(:original_url, "url not valid") unless original_url.start_with?("http")
	end
end

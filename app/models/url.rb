require 'securerandom'

class Url < ApplicationRecord
	validates :original_url, presence: true

	def custom_url
		"http://localhost:3000/#{id_url}" if id_url
	end

	def generate_id_url
		loop do
			id_url = SecureRandom.alphanumeric(6)
		break id_url unless Url.where(id_url: id_url).first
		end
	end
end

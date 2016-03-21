class Message < ActiveRecord::Base
	belongs_to :sender, class_name: 'User'
	belongs_to :recipient, class_name: 'User'

	validates :title, presence: true
	validates :body, presence: true
	def read?
		# !read_at.nil
		!!read_at
	end
end

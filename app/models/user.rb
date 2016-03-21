class User < ActiveRecord::Base
	has_secure_password

	validates :email, uniqueness: true
	validates :name, presence: true

	has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message' , dependent: :destroy
	has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message', dependent: :destroy
	has_many :friends, foreign_key: 'first_user_id', class_name: 'Friend', dependent: :destroy

	# def sent_messages
	# 	Message.where(sender_id: id)
	# end

	# def received_messages
	# 	Message.where(recipient_id: id)
end

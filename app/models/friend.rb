class Friend < ActiveRecord::Base
		belongs_to :first_user, class_name: "User"
		belongs_to :second_user, class_name: "User"

		validates :second_user_id, presence: true
end

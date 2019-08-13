class Attendance < ApplicationRecord
	belongs_to :attended_event, class_name:'Event'
	belongs_to :user
	validates_uniqueness_of :attended_event_id, scope: %i[user_id]
	after_create :new_attendee_send

	def new_attendee_send
		UserMailer.new_attendee_email(self.attended_event, self.user).deliver_now
	end
end

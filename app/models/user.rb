class User < ApplicationRecord
	has_many :attendances
	has_many :attended_events, foreign_key: 'attended_event_id', class_name:'Event', through: :attendances
	has_many :events_administrated, foreign_key: 'admin_id', class_name:'Event'
	after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end

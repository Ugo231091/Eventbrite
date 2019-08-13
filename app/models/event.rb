class Event < ApplicationRecord
	has_many :attendances, foreign_key: 'attended_event_id'
	has_many :users, through: :attendances
	belongs_to :admin, class_name: 'User'
	validates :start_date,
		presence: true,
		numericality: { greater_than_or_equal_to: Time.now.to_i}
	validates :duration,
		presence: true,
		numericality: { greater_than: 0, only_integer: true}
	validates :title,
		presence: true,
		length: { in: 5..140}
	validates :description,
		presence: true,
		length: { in: 20..1000}
	validates :price,
		presence: true,
		numericality: {only_integer: true, in: 1..1000}
	validates :location,
		presence: true
	validates :five_multiple?,
		presence: true
	private
	def five_multiple?
		duration % 5 == 0 ? true : errors.add(:duration, "must be a five multiple")
	end

end

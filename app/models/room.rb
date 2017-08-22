class Room < ApplicationRecord
	belongs_to :user
	has_many :photos, :dependent => :destroy
	default_scope -> {order(created_at: :desc)}
	has_many :reviews


	geocoded_by :location
	after_validation :geocode, :if => :location_changed?

	
end 
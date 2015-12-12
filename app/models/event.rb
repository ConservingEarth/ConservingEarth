class Event < ActiveRecord::Base

	belongs_to :user
	has_many :users

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	scope :chronological, -> { order({starts_at: :asc}) }
	scope :archaeological, -> { order({starts_at: :desc}) }
	scope :published, -> { where(published: true) }
	scope :unpublished, -> { where(published: false) } 

	def upcoming_events
		events.chronological.where("starts_at > ?", DateTime.now)
	end

	def published_upcoming_events
	    upcoming_events.published
	end

	def past_events
	    events.archaeological.where("starts_at < ?", DateTime.now)
	end

	def published_past_events
	    past_events.published
	end

	def next_event
	    published_upcoming_events.first
	end

	def attendees
    	invitations.accepted.map(&:user)
  	end

  	def in_the_past?
    	ends_at < Time.zone.now
  	end

  	protected

  		def starts_before_it_ends
    		if ends_at && starts_at && ends_at <= starts_at
      			errors.add(:ends_at, "Event must end after the start time.")
    	end
  	end
end

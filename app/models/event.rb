class Event < ActiveRecord::Base
	validates :guest_count, presence: true
	validates :title, presence: true
	validates :date, presence: true
	# validates :date,
	# 					date: { after: Proc.new { Time.now + 1.week },
	# 					        before: Proc.new { Time.now + 1.year } }

	validates :date,
          date: { after: Date.today + 1.week,
          				before: Date.today + 6.months }

end

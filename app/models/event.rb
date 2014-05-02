class Event < ActiveRecord::Base
  self.inheritance_column = nil
	validates :guest_count, presence: true
	validates :title, presence: true, uniqueness: true
	validates :date, presence: true
	validates :min_budget, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :max_budget, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: :valid_budget }
  validates :location, presence: true
  validates :status, presence: true
	validates :date,
          date: { after: Date.today + 1.week }

  validate :valid_budget

  belongs_to :user


  def valid_budget
    if min_budget?
      min_budget
    else 
      0
    end
  end

  def min_budget?
  	!min_budget.nil?
  end

  def max_budget?
  	!max_budget.nil?
  end

end

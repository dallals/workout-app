class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: { only_integer: true }
  validates :calories_burned, numericality: { only_integer: true }
  validates :calories_eaten, numericality: { only_integer: true }
  validates :weight, numericality: { only_integer: true }
  validates :workout_type, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true
  
  default_scope { where('workout_date > ?', 30.days.ago).order(workout_date: :desc) }
end

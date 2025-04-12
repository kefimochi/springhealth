class Appointement < ApplicationRecord
  has_one :note

  validate :title_presence
  validate :start_time_presence
  validate :end_time_presence

  private

  def title_presence
    if self.title.nil?
      errors.add(:title, ' is nil')
    end
  end

  def start_time_presence
    if self.start_time.nil?
      errors.add(:start_time, ' is nil')
    end
  end

  def end_time_presence
    if self.end_time.nil?
      errors.add(:end_time, ' is nil')
    end
  end
end

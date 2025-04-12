class Note < ApplicationRecord
  belongs_to :appointement
  has_many :section

  after_initialize :init

  validate :title_presence

  private

  def init
    self.status ||= "Drafted"
  end

  def title_presence
    if self.title.nil?
      errors.add(:title, ' is nil')
    end
  end
end

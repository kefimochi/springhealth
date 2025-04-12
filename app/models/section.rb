class Section < ApplicationRecord
  belongs_to :note

  validate :text_presence

  def text_presence
    if self.text.nil?
      errors.add(:text, ' is nil')
    end
  end
end

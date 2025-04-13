class Note < ApplicationRecord
  belongs_to :appointement
  has_many :section

  after_initialize :init

  validate :title_presence
  validate :status_correct

  private

  def init
    self.status ||= 'Draft'
  end

  def title_presence
    if self.title.nil?
      errors.add(:title, ' is nil')
    end
  end

  def status_correct
    if !(self.status.eql? 'Draft') && !(self.status.eql? 'Signed')
      errors.add(:status, ' cannot be asigned to this value')
    end
  end
end

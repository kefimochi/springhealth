class Note < ApplicationRecord
  belongs_to :appointement
  has_many :section
end

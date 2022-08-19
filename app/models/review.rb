class Review < ApplicationRecord
  belongs_to :list

  validates :content, length: { minimum: 6 }
end

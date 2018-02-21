class Quote < ApplicationRecord
  #prevent any new quote from being saved without a saying
  validates :saying, presence: true, length: { maximum: 140, minimum: 3}
  validates :author, presence: true, length: { maximum:50, minimum: 3}
end

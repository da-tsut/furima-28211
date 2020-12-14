class SendingDestination < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one : sending_destination
end


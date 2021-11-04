class Notification < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :text, presence: true
end

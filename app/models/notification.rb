class Notification < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :text, presence: true
  scope :unread, -> { where('viewed=>false') }
end

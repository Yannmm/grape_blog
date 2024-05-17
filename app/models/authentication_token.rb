class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  scope :valid, -> { where("expires_at IS ? or expires_at < ?", nil, Time.zone.now) }
end

class PairProgrammingSession < ApplicationRecord
  belongs_to :project
  belongs_to :host_user, class_name: "User"
  belongs_to :visitor_user, class_name: "User"

  has_many :reviews
end

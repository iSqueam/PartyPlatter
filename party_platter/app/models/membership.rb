class Membership < ApplicationRecord
  belongs_to :campaign
  belongs_to :character

  validates_uniqueness_of :character_id, :scope => :campaign_id
  # validation on unique combination of columns(values)
  # is PC or DM
end

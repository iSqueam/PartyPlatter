class Character < ApplicationRecord
    belongs_to :user
    has_many :memberships
    has_many :campaigns, through: :memberships
    validates :name, length: {minimum: 2}
    validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, numericality: {only_integer: true, in: 3..20}
end

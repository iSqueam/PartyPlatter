class Campaign < ApplicationRecord
    has_many :user
    has_many :characters
    validates :name, length: {minimum: 2}
    validates :minplayers, numericality: {only_integer: true, minimum: 0}
    validates :maxplayers, numericality: {only_integer: true, minimum: 1}
end
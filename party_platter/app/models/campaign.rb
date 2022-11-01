class Campaign < ApplicationRecord
    validates :name, length: {minimum: 2}
    validates :minplayers, numericality: {only_integer: true, minimum: 0}
    validates :maxplayers, numericality: {only_integer: true, minimum: :minplayers}
end
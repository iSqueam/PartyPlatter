class Character < ApplicationRecord
    validates :name, length: {minimum: 2}
    validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, numericality: {only_integer: true, in: 3..20}
end

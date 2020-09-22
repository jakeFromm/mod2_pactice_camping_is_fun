class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :age, numericality: true, :inclusion => {:in => 8..18}
    validates :name, uniqueness: true
end

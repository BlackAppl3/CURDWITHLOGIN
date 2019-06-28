class Information < ApplicationRecord
    validates :name, :age, presence: true
end

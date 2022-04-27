class Point < ApplicationRecord
    validates :name, presence: true
    validates :val, presence: true
    validates :desc, presence: true
end

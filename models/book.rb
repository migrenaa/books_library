class Book < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5, maximum: 120}
  validates :author, presence: true, length: {minimum: 5, maximum: 50}
  validates :genre, presence: true
  validates :description, length: {minimum:10, maximum: 1000}
end
class Room < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "can not contain whitespaces." }
end

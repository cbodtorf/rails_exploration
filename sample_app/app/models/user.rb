class User < ApplicationRecord
  validates(:name, presence: true, length: {maximum: 50, minimun: 3})
  validates(:email, presence: true, length: {maximum: 255, minimun: 3}, uniqueness: true)
end

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:name, presence: true, length: {maximum: 50, minimun: 3})
  validates(:email, presence: true, length: {maximum: 255, minimun: 3},
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX })
end
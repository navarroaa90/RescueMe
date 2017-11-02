class User < ApplicationRecord
has_secure_password
has_many :pets, dependent: :destroy
has_many :comments, dependent: :destroy
# verifying email if it exists or not
validates :email, presence: true, uniqueness: true
end


class User < ApplicationRecord
has_secure_password
has_many :pets
has_many :comments
# verifying email if it exists or not
validates :email, presence: true, uniqueness: true
end


class User < ApplicationRecord
has_secure_password
# verifying email if it exists or not
validates :email, presence: true, uniqueness: true
end


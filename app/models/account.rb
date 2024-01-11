class Account < ApplicationRecord
    has_secure_password
    # validates :username, :email,  :password_digest, presence: true
    # validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid Email Format" },uniqueness: true

end

class SocialAccount < Account
    before_save :generate_random_password, if: :new_record?
    # validates :unique_auth_id, presence: true ,uniqueness: true
    before_validation :generate_random_password, on: :create
    validates :email, uniqueness: true, allow_nil: true
    private
    def generate_random_password
        self.password = SecureRandom.hex(8) 
        puts (self.password + "asdfg")
    end
end

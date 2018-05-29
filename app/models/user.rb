class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :plays
  has_many :applications, :dependent => :delete_all


validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/},
 length: { minimum: 2}

validates :phone, presence: true, length: { minimum: 3}

# Validates that each email is unique
validates_uniqueness_of :email

# Before creating a user, the default role will be 'tester'
before_create :default_level

  private

    def default_level
      self.role = 'tester';
    end

    def self.get_user_role
      " is a #{self.role}"
    end

end

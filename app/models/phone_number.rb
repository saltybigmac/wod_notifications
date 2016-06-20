class PhoneNumber < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true
end

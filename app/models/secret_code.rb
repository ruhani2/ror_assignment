class SecretCode < ApplicationRecord
  require 'securerandom'
  belongs_to :user, optional: true
  validates :code, presence: true

  class << self
    def generate_code(number)
      required_array = []
      number.to_i.times{|x| required_array.push({code: SecureRandom.uuid})}
      required_array
    end
  end
end

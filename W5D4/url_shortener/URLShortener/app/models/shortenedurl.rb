require 'SecureRandom'

class Shortenedurl < ApplicationRecord
    validates :long_url, presence: true 
    validates :short_url, presence: true
    validates :short_url, uniqueness: true


    def self.random_code
      new_url = ''
      while new_url = ''
        new_url = SecureRandom.urlsafe_base64
        if self[new_url].exists?
          new_url = ''
        end
      end
      new_url
    end

end

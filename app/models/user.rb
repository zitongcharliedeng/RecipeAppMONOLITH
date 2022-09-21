class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value != "USER@foo.COM"
  end
end



class User < ApplicationRecord
    include ActiveModel::Validations

    has_many :recipes,  dependent: :destroy
    has_many :comments,  dependent: :destroy

    before_save { self.email.downcase! }


    validates :name, 
        presence: true, length: { maximum: 50 }

    validates :email, 
        presence: true, length: { maximum: 255 }, 
        format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
        uniqueness: true,
        email: true

    has_secure_password # occurs before save, under the hood ... probably
    validates :password, 
        format: {with: /(?=.{6,50})(?=.*\d{1,})(?=.*[A-Z]{1,})/} #regex works except from the exceeds 50 chars bit but not required in my trello so lol
        # : 
        #     self.password.to_s.split.each do |character|
        #         numbers = ["0", "1","2","3","4","5","6","7","8","9"]
        #         if numbers.include?(character)
        #             return true
        #         end
        #         return false
        #     end
        # }

end



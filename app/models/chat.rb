class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages

  before_save do
    if self.user_id == self.recipient_id
      throw :abort
    end
  end
end

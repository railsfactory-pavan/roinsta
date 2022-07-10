class Following < ApplicationRecord
  belongs_to :user

  before_save do
    if self.user_id == self.following_id
      throw :abort
    end
  end
end

class Expense < ApplicationRecord

  validates :user_id, precense: true

end

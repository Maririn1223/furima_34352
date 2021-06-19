class Order < ApplicationRecord
  with_options presence: true do
    validates :expiration_date

      with_options numericality: {with: /\A[0-9]+\z/ } do
        #カード番号
        validates :number
        validates :cvc
      end
  end

  belongs_to :item
end

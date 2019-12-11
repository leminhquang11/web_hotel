class Provider < ApplicationRecord
    has_many :services, dependent: :destroy
end

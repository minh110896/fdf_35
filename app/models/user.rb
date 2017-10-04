class User < ApplicationRecord
  has_many :suggests
  has_many :orders
  has_many :ratings
end

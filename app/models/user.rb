class User < ApplicationRecord
  validates :name, presence: true, length:{maximum:15}
  validates :email, presence: true, uniqueness: true, length:{minimum:5, maximum:30}
  validates :password, presence: true, length:{minimum:5, maximum:20}
  validates :self_introduction, length:{maximum:250}

end

class Post < ActiveRecord::Base
  belongs_to :user
  def self.search(search)
      where("state LIKE ?", "%#{search}%")
  end
end

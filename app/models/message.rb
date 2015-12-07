class Message < ActiveRecord::Base
  validates :title, presence: true
  after_initialize :init
  
  belongs_to(
    :creator,
    class_name:  'User',
    foreign_key: 'creator_id',
  )
  belongs_to(
    :recipient,
    class_name:  'User',
    foreign_key: 'recipient_id',
  )
  
  
  def init
    self.read ||= false
  end
end

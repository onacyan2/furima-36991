class ScheduledDelivery < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2で発送' },
    { id: 3, name: '3~4で発送' },
    { id: 4, name: '5~6で発送' },
  ]

end
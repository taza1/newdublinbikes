class Profile < ActiveRecord::Base
  belongs_to :user
  def self.search(search)
      where("lastname LIKE ?", "%#{search}%")
  end
end

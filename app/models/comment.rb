class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  def self.by_most_recent
      order(created_at: :desc)
  end
  validates :content, presence: :true, uniqueness: :true
end

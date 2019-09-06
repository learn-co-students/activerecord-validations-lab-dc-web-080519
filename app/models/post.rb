class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :valid_post

  def valid_post
    #binding.pry
      if !(!self.title.nil? && self.title.include?("Won't Believe" || "Secret" || "Top /\d/" || "Guess"))
        errors.add(:not_clickbaity, "Title not clickbait-y enough!")
      end
  end

end

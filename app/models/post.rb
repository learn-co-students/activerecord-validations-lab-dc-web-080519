class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :non_clickbait
end

def non_clickbait
   if self.title.present? && !self.title.downcase.include?("won't believe" || "secret" || "top /\d/" || "guess")
     errors.add(:title, "Not clickbait enough!")
   end
 end
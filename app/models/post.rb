class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
    
    baits = [
    /Won't Believe/,
    /Secret/,
    /Top/,
    /Guess/]

    if !baits.any? {|bait| bait.match title}
      errors.add(:title, "is not clickbaity enough")
    end
  end


end

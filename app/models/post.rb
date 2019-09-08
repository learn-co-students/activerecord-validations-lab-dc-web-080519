class Post < ActiveRecord::Base
  # belongs_to :author
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

  # def clickbaity
  #   clickbait = %W(#{"Won't Believe"} Secret Top Guess)


  # end

#title present && clickbaity -> ["Won't Believe", "Secret", "Top [number]", "Guess"]
#content is >= 250 charachters
#summary is <= 250 charachters
#category is Fiction || Non-Fiction (inclusion)



end

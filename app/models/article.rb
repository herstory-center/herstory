class Article < ApplicationRecord
  belongs_to :category
  before_save :url_shortener

  validates :title, :description, :email, :category_id, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :auto_url, uniqueness: true

  protected
  def url_shortener
    unless self.auto_url
      self.auto_url = ([*('A'..'Z'),*('a'..'z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
    end
  end
end

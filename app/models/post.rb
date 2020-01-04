class Post < ApplicationRecord
  has_rich_text :body
  #mount_uploader :image, ImageUploader
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category

  has_one_attached :image

  validates :title, :summary, :body, presence: true

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end


  def thumb
    return self.image.variant(resize: '250x250').processed
  end

  def large
    return self.image.variant(resize: '800x800').processed
  end

end

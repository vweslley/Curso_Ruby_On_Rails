class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  #Validates
  validates :title, :description, :category, :picture, :finish_date, presence: true
  validates :price, numericality: {greater_than: 0}

  #Gem PaperClip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #Valida a imagem
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  #Gem money-rails
  monetize :price_cents
  # Scopes
  scope :descending_order, -> (quantity = 10) {limit(quantity).order(created_at: :desc)}
  scope :to_the, -> (member) {where(member: member)}
end

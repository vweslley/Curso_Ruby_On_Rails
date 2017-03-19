class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  #Gem PaperClip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #Valida a imagem
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  #Gem money-rails
  monetize :price_cents
  # Scopes
  scope :last_six, -> {limit(6).order(created_at: :desc)}
end

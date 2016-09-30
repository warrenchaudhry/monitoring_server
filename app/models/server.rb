class Server < ApplicationRecord
  validates :name, :host, :port, presence: true
  validates_numericality_of :port, allow_blank: true
  validates_uniqueness_of :name, case_sensitive: false
  validates_uniqueness_of :host, case_sensitive: false
  validates_url :host, allow_blank: true

  before_validation :smart_add_url_protocol, if: 'host.present?'
  before_create :generate_auth_token

  private

  def smart_add_url_protocol
    unless self.host[/\Ahttp:\/\//] || self.host[/\Ahttps:\/\//]
      self.host = "http://#{self.host}"
    end
  end

  def generate_auth_token
    begin
      self.auth_token = SecureRandom.base64(48)
    end while self.class.exists?(auth_token: self.auth_token)
  end

end

class Server
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,  type: String
  field :host,  type: String
  field :port,  type: Integer, default: 80
  field :description, type: String
  field :authenticated, type: Boolean, default: false
  field :auth_token, type: String

  has_many :metrics, inverse_of: :server, dependent: :destroy

  validates :name, :host, :port, presence: true
  validates_numericality_of :port, allow_blank: true
  validates_uniqueness_of :name, case_sensitive: false
  validates_uniqueness_of :host, case_sensitive: false
  validates :host, :url => {:no_local => false}

  before_validation :smart_add_url_protocol
  before_create :generate_auth_token

  private

  def smart_add_url_protocol
    unless self.host[/\Ahttp:\/\//] || self.host[/\Ahttps:\/\//]
      self.host = "http://#{self.host}"
    end
  end

  def generate_auth_token
    begin
      self.auth_token = SecureRandom.base64
    end while self.class.where(auth_token: self.auth_token).exists?
  end
end

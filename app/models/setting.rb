class Setting < ApplicationRecord
  validates :cpu_usage_limit, :disk_usage_limit, presence: true
  validates_numericality_of :cpu_usage_limit, :disk_usage_limit,
                            greater_than: 0,
                            less_than_or_equal_to: 100,
                            allow_blank: true
  belongs_to :user, class_name: 'User', foreign_key: :last_updated_by
end

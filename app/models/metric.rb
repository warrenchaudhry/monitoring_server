class Metric
  include Mongoid::Document
  include Mongoid::Timestamps

  field :hostname, type: String
  field :cpu_usage, type: BigDecimal
  field :total_disk_space, type: BigDecimal
  field :used_disk_space, type: BigDecimal
  field :disk_remaining_percent, type: BigDecimal
  field :running_processes, type: Array

  belongs_to :server, inverse_of: :metrics

  validates :server, presence: true

end

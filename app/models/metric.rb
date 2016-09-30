class Metric
  include Virtus.model
  include ActiveModel::Model

  attribute :hostname,               String
  attribute :cpu_usage,              Decimal
  attribute :total_disk_space,       Integer
  attribute :used_disk_space,        Integer
  attribute :disk_remaining_percent, Decimal
  attribute :running_processes,      Array
  attribute :fetch_time,             DateTime
  attribute :server_id,              Integer

  attr_accessor :hostname, :cpu_usage, :total_disk_space, :used_disk_space, :disk_remaining_percent, :running_processes, :fetch_time, :server_id
  validates :hostname, :cpu_usage, :total_disk_space, :used_disk_space,
            :disk_remaining_percent, :running_processes, :server_id, presence: true
  validates_numericality_of :cpu_usage, :total_disk_space, :used_disk_space, :disk_remaining_percent


  def server
    Server.find(self.server_id) rescue nil
  end

  def save
    $redis.hset("metrics", server_id.to_s, self.attributes.to_json)
    MetricsBroadcastJob.perform_later(self.attributes)
    true
  end


end

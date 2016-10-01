class MetricsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(metrics)
    puts "Metrics ++++++++++++++++++++++++++++++++++++++++++++++"

    ActionCable.server.broadcast "server_metrics_#{metrics[:server_id]}_channel",
                                 metrics: render_message(metrics), server_id: metrics[:server_id]

  end
  private

  def render_message(metrics)
    ServersController.render partial: 'servers/metrics', locals: {metrics: JSON.parse(metrics.to_json)}
  end
end

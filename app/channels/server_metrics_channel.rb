# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ServerMetricsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "server_metrics_#{params['server_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

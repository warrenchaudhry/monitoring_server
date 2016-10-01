module Api
  module V1
    class MetricsController < Api::V1::BaseController
      before_action :authenticate_token!
      def create
        @settings = Setting.first
        @metric = Metric.new(metric_params)
        @metric.server_id = @server.id
        if @metric.valid?
          @metric.save
          info = {
            metric: @metric,
            cpu_usage:{
              on_limit: @metric.cpu_usage.to_f > @settings.cpu_usage_limit,
              value: @metric.cpu_usage,
              time: @metric.fetch_time
            },
            on_disk_usage_limit: @metric.disk_remaining_percent.to_f < @settings.disk_usage_limit
          }
          render json: info, status: 201
        else
            render json: @metric.errors
        end

        # @metric.server = @server
        # if @metric.save
        #   render json: @metric
        # else
        #   render json: @metric.errors
        # end
      end


      private

      def metric_params
        params.require(:metric).permit(:hostname, :cpu_usage, :total_disk_space, :used_disk_space, :disk_remaining_percent, :fetch_time, running_processes: [:command, :pid,:cpu,:mem, :user])
      end

      def authenticate_token!
        raise Api::Exceptions::UnAuthorized unless current_server.present?
      end

      def current_server
        @server ||= Server.where(auth_token: request.headers['Authorization']).first
      end
    end
  end
end

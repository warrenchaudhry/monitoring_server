require 'test_helper'

class Api::V1::MetricsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @server = Server.create(name: 'Testing Server', host: 'http://10.101.23.255', port: 80, description: 'Ubuntu Testing Server')
    @metric_params = metrics
  end

  test "should return success response" do
    post "/api/v1/metrics", params: @metric_params
    #assert_response :success
  end

  def metrics
    {:metric=>
      {
        :total_disk_space=>"498876809216.0",
        :used_disk_space=>"298564911104.0",
        :cpu_usage=>"32",
        :disk_remaining_percent=>"40.15",
        :hostname=>"localhost",
        :fetch_time=>"2016-10-01T07:46:18.509Z",
        :running_processes=>[
          {:command=>"Process 1", :pid=>"289", :cpu=>"3.9", :mem=>"0.4", :user => "anonymous"},
          {:command=>"Process 2", :pid=>"290", :cpu=>"12.56", :mem=>"3.67", :user=>"anonymous"},
          {:command=>"Process 3", :pid=>"293", :cpu=>"1.89", :mem=>"1.67", :user=>"guest_user"},
          {:command=>"Process 4", :pid=>"294", :cpu=>"6.92", :mem=>"5.4", :user=>"guest_user"},
          {:command=>"Process 5", :pid=>"295", :cpu=>"8.52", :mem=>"2.56", :user=>"guest_user"}
        ]
      }
    }
  end
end

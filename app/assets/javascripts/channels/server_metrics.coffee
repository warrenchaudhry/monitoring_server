jQuery(document).on 'turbolinks:load', ->
  messages = $('#metrics-info')
  if $('#metrics-info').length > 0
    metrics_container = $('#metrics-info')
    server_id = metrics_container.data('server-id')
    App.metrics = App.cable.subscriptions.create {
        channel: "ServerMetricsChannel",
        server_id: server_id
      },
      connected: ->

        # Called when the subscription is ready for use on the server
      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if parseInt(server_id) == data.server_id
          $('#metrics-info').html(data.metrics)

        # Called when there's incoming data on the websocket for this channel

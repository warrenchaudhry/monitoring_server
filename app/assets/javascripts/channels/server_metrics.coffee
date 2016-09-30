jQuery(document).on 'turbolinks:load', ->
  messages = $('#metrics-info')
  if $('#metrics-info').length > 0

    App.metrics = App.cable.subscriptions.create {
        channel: "ServerMetricsChannel",
        server_id: $('#metrics-info').data('server-id')
      },
      connected: ->

        # Called when the subscription is ready for use on the server
      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#metrics-info').html(data.metrics)

        # Called when there's incoming data on the websocket for this channel

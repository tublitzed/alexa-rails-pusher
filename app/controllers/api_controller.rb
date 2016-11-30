class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:alexa]

  def alexa
    pusher_client = Pusher::Client.new(
      app_id: ENV['PUSHER_APP_ID'],
      key: ENV['PUSHER_APP_KEY'],
      secret: ENV['PUSHER_APP_SECRET'],
      encrypted: true
    )

    pusher_client.trigger('alexa_channel', 'incoming_event', {
      data: ActiveSupport::JSON.decode(request.raw_post)
    })

    render :json => { success: true }
  end
end

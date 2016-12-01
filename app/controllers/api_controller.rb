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

    render :json => sample_json_response
  end

  private

  def sample_json_response
    {
      "version": "1.0",
      "response": {
        "outputSpeech": {
          "type": "PlainText",
          "text": "This is a sample response from the website...."
        },
        "reprompt": {
          "outputSpeech": {
            "type": "PlainText",
            "text": ""
          }
        },
        "shouldEndSession": true
      },
      "sessionAttributes": {}
    }
  end
end

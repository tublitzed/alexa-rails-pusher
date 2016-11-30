var App = {
  /**
   * Create a new pusher connection, and subscribe to
   * a channel.
   */
  initPusher: function () {
    var appId = $('input[name="pusher-app-key"]').val();
    var pusher = new Pusher(appId, {
      encrypted: true
    });

    var channel = pusher.subscribe('alexa_channel');
    channel.bind('incoming_event', function (data) {
      console.log(data);
    });
  }
};

$(function () {
  App.initPusher();
});

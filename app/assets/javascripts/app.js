var App = {

  /**
   * Create a new Pusher connection, and subscribe to
   * a channel.
   */
  initPusher: function() {
    var self = this;
    var appId = $('input[name="pusher-app-key"]').val();
    var pusher = new Pusher(appId, {
      encrypted: true
    });

    var channel = pusher.subscribe('alexa_channel');
    channel.bind('incoming_event', function(response) {
      console.log(response);
      var color = response.data.request.intent.name.toLowerCase();
      self.changeColor(color);
    });
  },

  /**
   * Change background color of element.
   * @param {string} color
   */
  changeColor: function(color) {
    this.$el.css({
      background: color
    });
  },

  /**
   * Cache main element, and then setup Pusher.
   */
  init: function() {
    this.$el = $('.demo');
    this.initPusher();
  }
};

$(function() {
  App.init();
});

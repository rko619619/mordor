import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('yiha we are live!')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

   received(data) {

    $("#msg").append('div class="message"'+ data.content+ '</div>')

    console.log(data.content)
  }
});

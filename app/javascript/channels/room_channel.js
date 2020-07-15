import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  consumer.subscriptions.create({channel: "RoomChannel"},
      {connected() {
          console.log("connected..... ")
        },

        disconnected() {
          // Called when the subscription has been terminated by the server
        },

        received(data) {
          console.log(data)
          const commentContainer = document.getElementById('comment_pane')
          commentContainer.innerHTML = commentContainer.innerHTML + data.html
        }
      });

})


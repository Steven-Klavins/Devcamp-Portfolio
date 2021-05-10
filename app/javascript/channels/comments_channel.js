import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    console.log("Test the channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#newly-posted-msg').append (
      '<div class="comment-card"><div class="card"><div class="card-block"><div class="row"><div class="col-md-1"></div><div class="col-md-11">'+ data.content +'</div></div></div></div></div>')
    $('#comment_content').val('')
    $('input[type="submit"]').attr('disabled' , false);
  }
});

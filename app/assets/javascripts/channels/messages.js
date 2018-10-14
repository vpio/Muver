$(document).on('turbolinks:load', function() {
   var channel = $('span#channel').data('channel');
   if(channel){
    var user_1_id = channel.split(":")[1];
    var user_2_id = channel.split(":")[2];
     App['messages_'+user_1_id+'_'+user_2_id] = App.cable.subscriptions.create(
      {
        channel:      'MessagesChannel',
        user_1_id: user_1_id,
        user_2_id: user_2_id
      },
      {
        received: function(data){
          window.messages.fetchMessages();
        }
      }
    );
  }
 });

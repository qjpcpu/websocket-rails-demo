$ ->
  dispatcher = new WebSocketRails 'localhost:3000/websocket'
  console.log dispatcher
  dispatcher.bind 'user_login', (data) ->
    console.log('Got===>', data)
    $('#text').append("<pre>user_login:#{data.message}</prev>")

  dispatcher.bind 'user_enter', (data) ->
    console.log('enter=======> ', data)
    $('#text').append("<pre>user_enter:#{data.message}</prev>")

  dispatcher.bind 'user_left', (data) ->
    console.log('left=======> ', data)
    $('#text').append("<pre>user_left: #{data.message}</prev>")
  
  dispatcher.bind 'message', (data) ->
    console.log('message=======> ', data)
    $('#text').append("<pre>message: #{data.message}</prev>")

  channel = dispatcher.subscribe('online')
  channel.bind 'user_enter', (data) ->
    console.log('c enter=======> ', data)
    $('#text').append("<pre>channel user_enter:#{data.name}</prev>")

  channel.bind 'user_left', (data) ->
    console.log('c left=======> ', data)
    $('#text').append("<pre>channel user_left:#{data.name}</prev>")

  dispatcher.trigger 'say',
    words: 'hi'
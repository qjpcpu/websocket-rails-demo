$ ->
  dispatcher = new WebSocketRails 'localhost:3000/websocket'
  console.log dispatcher

  dispatcher.bind 'user_enter', (data) ->
    console.log('enter=======> ', data)
    $('#text').append("<pre>[user_enter]-<b>[#{data.email}]</b>: I'm in!</prev>")

  dispatcher.bind 'user_left', (data) ->
    console.log('left=======> ', data)
    $('#text').append("<pre>[user_left]-<b>[#{data.email}]</b>: I'm leaving...</prev>")
  
  dispatcher.bind 'message', (data) ->
    console.log('message=======> ', data)
    $('#text').append("<pre>[message]-<b>[#{data.email}]</b>: got message '#{data.message}'</prev>")

  channel = dispatcher.subscribe('online')
  channel.bind 'user_enter', (data) ->
    console.log('c enter=======> ', data)
    $('#text').append("<pre>[channel user_enter]-<b>[#{data.email}]</b>: I'm in!</prev>")

  channel.bind 'user_left', (data) ->
    console.log('c left=======> ', data)
    $('#text').append("<pre>[channel user_left]-<b>[#{data.email}]</b>: I'm leaving...</prev>")

  dispatcher.trigger 'say',
    words: 'hi'
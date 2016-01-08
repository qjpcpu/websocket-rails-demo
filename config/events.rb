WebsocketRails::EventMap.describe do
  subscribe :client_connected, :to => RealtimeController, :with_method => :user_came
  # The :client_disconnected method is fired automatically when a client disconnects
  subscribe :client_disconnected, :to => RealtimeController, :with_method => :user_left
  # The :connection_closed method is fired automatically when a client loses connection without sending a disconnect frame.
  subscribe :connection_closed, :to => RealtimeController, :with_method => :user_left

  subscribe :say,:to=>RealtimeController,:with_method=>:say
end
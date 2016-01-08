# -*- coding: utf-8 -*-
class RealtimeController < WebsocketRails::BaseController

    def user_came
        logger.info "ProccessID: #{Process.pid} #{client_id} connected."
        broadcast_message :user_enter, message: "#{client_id} enter",name: client_id.to_s
        WebsocketRails[:online].trigger :user_enter, message: "#{client_id} enter",name: client_id.to_s
    end

    def say
        logger.info data
        broadcast_message :message, message: "#{client_id} says #{data['words']} to all"
    end

    def user_left
        logger.info "ProccessID: #{Process.pid} #{client_id} left."
        WebsocketRails[:online].trigger :user_left, message: "#{client_id} left",name: client_id.to_s
    end

end

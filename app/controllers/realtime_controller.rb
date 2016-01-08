# -*- coding: utf-8 -*-
class RealtimeController < WebsocketRails::BaseController

    before_action :authenticate_user!

    def user_came
        logger.info "ProccessID: #{Process.pid} #{client_id} connected."
        broadcast_message :user_enter, message: "#{current_user.email} enter",email: current_user.email
        WebsocketRails[:online].trigger :user_enter, message: "#{current_user.email} enter",email: current_user.email
    end

    def say
        logger.info data
        broadcast_message :message, message: data['words'],email: current_user.email
    end

    def user_left
        logger.info "ProccessID: #{Process.pid} #{current_user.email} left."
        WebsocketRails[:online].trigger :user_left, message: "#{current_user.email} left",email: current_user.email
    end

end

module Cricket
    module V1
      # Defaults
      module Defaults
        extend ActiveSupport::Concern
        MSG_SUCCESS = "Success"
        # APIKEY = 'f4919ce87ada4fda8952163971ed9fb6'
        MSG_ERROR = "Internal Server Error"
        BLOCKED = "You Blocked, Max Limit"
        INVALID_USER = 'Invalid User Request'
        # BASE_URL = "https://mobnews.app"
        # NEWS_API = News.new("f4919ce87ada4fda8952163971ed9fb6") 
  

        included do
          prefix 'api'
          version 'v1', using: :path
          default_format :json
          format :json
          #formatter :json, Grape::Formatter::ActiveModelSerializers
  
          helpers do
            def permitted_params
              @permitted_params ||= declared(params, include_missing: false)
            end
  
            def api_params
              Rails.logger.info"API Params:#{params.inspect}"
            end
  
            def logger
              Rails.logger
            end
  
            # def current_user
            #   # find token. Check if valid.
            #   token = ApiKey.where(access_token: params[:token]).first
            #   if token && !token.expired?
            #     @current_user = User.find(token.user_id)
            #   else
            #     false
            #   end
            # end

            def valid_user(user_id, security_token)
              user = User.find(user_id)#where("id = ? AND securitytoken = ?", user_id, security_token).first
              if user          
                return user
              else
                return false
              end
            end
          end

          rescue_from ActiveRecord::RecordNotFound do |e|
            error_response(message: e.message, status: 404)
          end
  
          rescue_from ActiveRecord::RecordInvalid do |e|
            error_response(message: e.message, status: 422)
          end
        end
      end
    end
  end
  
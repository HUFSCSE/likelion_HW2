require 'mailgun'

class HomeController < ApplicationController
    def index
    end
    
    def write
        @get_mail = params[:email]
        @get_text = params[:text]
        
        mg_client = Mailgun::Client.new("key-ec0dc8cff1cd8fa871a79d3e13d80cbe")

        message_params =  {
                           from: @get_mail,
                           to:    'gudrbshot@naver.com',
                           subject: 'KHK E-mail',
                           text:   @get_text 
                          }
        
        result = mg_client.send_message('sandbox031c13cfbb23462e97be2da508b557a7.mailgun.org', message_params).to_h!
        
        message_id = result['id']
        message = result['message']
    end
end

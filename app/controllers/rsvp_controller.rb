class VoicemailController < ApplicationController

	def answer
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		message = client.messages.create(
		    from: "+15675234372",
		    to: "7187535492",
		    body: "new voicemail"
	  		)
		render file: "voicemail/answer.xml", :layout => false
	end

	def audio
  	end

	def voicemail_params
      params.permit(:message_body, :from_number)
    end
end

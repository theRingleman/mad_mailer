class AccountsController < ApplicationController

	def index
	end

	def import
		Account.import(params[:file])
  	redirect_to root_url, notice: 'Account data imported!'
	end

	def send_emails
		Account.all.each do |account|
			account.send_mail
		end
		redirect_to root_url, notice: 'Emails Sent'
	end

end
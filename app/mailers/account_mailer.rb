class AccountMailer < ApplicationMailer
	default from: 'aubrey.darnell@madwiremedia.com'

	def account_info(account)
		@account = account
		mail(to: account.email, subject: "Recommendations for #{account.account_number}");
	end

end

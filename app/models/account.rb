class Account
	include ActiveModel::Model

	attr_accessor :account_number, :me, :improvement

	@@all = []

	def self.all
		@@all
	end

	def initialize(account_number, me, improvement)
		@account_number = account_number
		@me = me
		@improvement = []
		@improvement << improvement
		@@all << self
	end

	def email
		self.me.downcase.split(' ').join('.') + '@madwiremedia.com'
	end

	def send_mail
		MadMailer.account_info(self).deliver
	end

	def self.import(file)
		binding.pry
		CSV.foreach(file.path, headers: true) do |row|
			if @@all.empty?
				self.new(row['Account Description'], row['Marketing Executive'], row['Account Improvement'])
			elsif row['Marketing Executive'] != '#N/A' 
				if self.all.last.account_number == row['Account Description']
					self.all.last.improvement << row['Account Improvement']
				else
					self.new(row['Account Description'], row['Marketing Executive'], row['Account Improvement'])
				end
			end
		end
	end

end
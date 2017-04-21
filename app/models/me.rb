class Me
	include ActiveModel::Model
	require 'csv'

	attr_accessor :name, :accounts, :improvements

	@@all = []

	def self.all
		@@all
	end

	def initialize(name, account, improvement)
		@name = name
		@accounts = []
		@accounts << account
	end

	def email
		self.name.downcase.split(' ').join('.') + "@madwiremedia.com"
	end

end
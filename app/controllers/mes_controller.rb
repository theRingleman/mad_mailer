class MesController < ApplicationController

	def index
	end

	def import
		Me.import(params[:file])
		redirect mes_path
	end

end
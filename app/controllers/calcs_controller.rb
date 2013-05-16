class CalcsController < ApplicationController

	def create
  	@carbs = params[:carbs].to_f
  	@protein = params[:protein].to_f
  	@fat = params[:fat].to_f
  	@fiber = params[:fiber].to_f


  	formula = (@carbs * 16) + (@protein * 19) + (@fat * 45) - (@fiber * 14)
  	@result = (formula / 175).round(2)
  end
  
end

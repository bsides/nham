class Calculator < ApplicationController

  def index
  	@result = ''
  end

  def calculate_food_points
  	@carbs = param[:carbs].to_f
  	@protein = param[:proteins].to_f
  	@fat = param[:fat].to_f
  	@fiber = param[:fiber].to_f


  	formula = (@carbs * 16) + (@protein * 19) + (@fat * 45) - (@fiber * 14)
  	@result = (formula / 175).round(2)
  end

  def calculate_daily_points
  	# Daily Points Target
  	# Based entirelly on Weight Watchers formula at: http://en.wikipedia.org/wiki/Weight_Watchers#PointsPlus_.28US.3B_Nov_2010-.29
  	# 
  	# Weight in kilograms, height in meters
  	# TEEm = 864 - (9.72 * age) + 1.12 * (14.2 * weight + 503 * height)
  	# TEEf = 387 - (7.31 * age) + 1.14 * (10.9 * weight + 660.7 * height)
  	# Where TEEm and TEEf represent the total energy expenditure (in kCal) for men and women, respectively, on a basic day
  	#
  	# The TEE is adjusted for foods treated as having a PointsPlus value of 0 despite having a caloric content:
  	# ATEE = 0.9 * TEE + 200
  	# ATEE will be a range between 29 and 71
  	# Mininum kcal: 500
  	# Maximum kcal: 3000
  	#
  	# Final formula 2012
  	# Target-mod = min (max (round ( max(ATEE - 1000, 1000) / 35 ) -7 -4,26), 71)

  	TEEm = 864 - (9.72 * @age) + 1.12 * ((14.2 * @weight) + (503 * @height))
  	TEEf = 387 - (7.31 * @age) + 1.14 * ((10.9 * @weight) + (660.7 * @height))
  	ATEEm = 0.9 * TEEm + 200
  	ATEEf = 0.9 * TEEf + 200
  	formula = ((((ATEE - 1000).max) / 35).round -7).min
  end

end
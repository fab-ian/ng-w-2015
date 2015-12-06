class TuitionsController < ApplicationController
  before_action :authenticate_user!
  
  expose(:tuitions) { Tuition.includes(:student) }
  #expose(:students)
end

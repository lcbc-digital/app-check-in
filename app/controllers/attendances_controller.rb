class AttendancesController < ApplicationController
  def new
  	@checkins = CheckIn.includes('user').all
  end
end

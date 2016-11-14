class AttendancesController < ApplicationController
  def new
    @checkins = CheckIn.includes('user').all

    respond_to do |format|
      format.html
      # format.csv { send_data @checkins.to_csv, filename: "checkins-#{Date.today}.csv" }
      format.csv do
        send_data @checkins.to_csv
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=checkins-#{Date.today}.csv"
      end
    end
  end
end

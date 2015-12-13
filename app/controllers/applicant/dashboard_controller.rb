class Applicant::DashboardController < ApplicationController
  def index
    @jobs = Job.first(4)
  end
end
